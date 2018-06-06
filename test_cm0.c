#include <stdint.h>
uint32_t test_cm0(uint32_t n) {
    return (n >> 13) & 0x3F;
}
