#include "bib.hpp"

int calcularFatorial(int n) {
    if (n < 0) return -1;
    if (n == 0) return 1;
    return n * calcularFatorial(n - 1);
}

int calcularSoma(int n1, int n2){
    return n1 + n2;
}
