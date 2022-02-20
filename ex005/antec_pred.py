#!/usr/bin/env python
# coding: utf-8

def main():
    num = int(input("Informe um inteiro: "))

    print(f"""
    \rAntecessor de {num} é: {num - 1}.
    \rSucessor de {num} é: {num + 1}.
    """)

if __name__ == "__main__":
    main()
