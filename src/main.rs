#![no_main]
#![no_std]

use core::{
    arch::{global_asm},
    panic::PanicInfo,
};

global_asm!(include_str!("./asm/stage_1.s"));

#[no_mangle]
pub unsafe extern "C" fn kernel() -> ! {
    loop {}
}

#[panic_handler]
fn panic(_panic: &PanicInfo<'_>) -> ! {
    loop {}
}
