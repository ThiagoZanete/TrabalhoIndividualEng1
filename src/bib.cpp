#include "bib.hpp"

int calcularFatorial(int n) {
    if (n < 0) return -1;
    if (n == 0) return 1;
    return n * calcularFatorial(n - 1);
}
