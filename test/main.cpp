#include <iostream>
#include "../include/bib.hpp"
using namespace std;

int main() {
    int n = 5;
    int resultado = calcularFatorial(n);
    if (resultado == 120) {
        cout << "Teste OK" << endl;
        return 0;
    } else {
        cout << "Teste falhou: resultado = " << resultado << endl;
        return 1;
    }
}
