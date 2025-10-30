#include <iostream>
#include <cassert>
#include "../include/bib.hpp"
using namespace std;

int main() {
    int n = 5;
    int resultado = calcularFatorial(n);
    assert(resultado == 120);
    int soma = calcularSoma(2, 2);
    assert(soma == 4);
    
}
/*
git checkout develop
git checkout -b feat/calcularFatorial
make
make test
./bin/testeRegressivo.exe
git add .
git commit -m "Implementa função calcularFatorial e testes"
git checkout develop
git merge feat/calcularFatorial
git push origin develop*/