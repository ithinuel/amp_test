#include <stdint.h>
#include "test_cm0.h"
#include "test_cm3.h"

volatile uint32_t r;

void _start(void) {
    uint32_t t = test_cm0(r);
    r = rbit(t);
}
