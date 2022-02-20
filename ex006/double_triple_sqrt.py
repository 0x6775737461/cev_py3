#!/usr/bin/env python
# coding: utf-8

from math import sqrt
from decimal import getcontext, Decimal

def main():
    getcontext().prec = 3

    num = int(input("Digite um número: "))

    print(f"""
    \rO dobro de {num} vale {num * 2}.
    \rO triplo de {num} vale {num * 3}.
    \rA raíz quadrada de {num} é igual a {Decimal(num).sqrt()}
    """)

if __name__ == "__main__":
    main()
