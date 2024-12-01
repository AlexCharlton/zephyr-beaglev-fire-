use core::sync::atomic::{AtomicUsize, Ordering};
use critical_section::RawRestoreState;

use super::sys::{hart_id, MIP_MSIP};

pub struct MPFSCriticalSection;

const LOCK_UNOWNED: usize = 0;

// Stores which hart (core) owns the lock: 0 = unowned, 1-4 = hart ID
static LOCK_OWNER: AtomicUsize = AtomicUsize::new(LOCK_UNOWNED);

unsafe impl critical_section::Impl for MPFSCriticalSection {
    unsafe fn acquire() -> RawRestoreState {
        let hart_id: usize = hart_id();

        // Check if we already own the lock
        if LOCK_OWNER.load(Ordering::Acquire) == hart_id {
            return false as RawRestoreState;
        }

        // Read and clear the MIE bit from mstatus
        let mut status: usize;
        core::arch::asm!(
            "csrrci {}, mstatus, {}", // Clear and get MIE bit in one operation
            out(reg) status,
            const MIP_MSIP
        );
        let was_enabled = (status & MIP_MSIP) != 0;

        loop {
            // Interrupts are already disabled by the csrrci above
            match LOCK_OWNER.compare_exchange(
                LOCK_UNOWNED,
                hart_id,
                Ordering::AcqRel,
                Ordering::Acquire,
            ) {
                Ok(_) => break,
                Err(_) => {
                    // Re-enable interrupts if they were enabled before
                    if was_enabled {
                        core::arch::asm!(
                            "csrsi mstatus, {}",
                            const MIP_MSIP,
                            options(nomem, nostack)
                        );
                    }
                }
            }
        }

        was_enabled as RawRestoreState
    }

    unsafe fn release(was_active: RawRestoreState) {
        if was_active {
            // Release the lock
            LOCK_OWNER.store(LOCK_UNOWNED, Ordering::Release);

            // Re-enable interrupts
            core::arch::asm!("csrsi mstatus, {}", const MIP_MSIP, options(nomem, nostack));
        }
    }
}
