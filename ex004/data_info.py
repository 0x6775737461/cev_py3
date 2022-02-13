#!/usr/bin/env python
# coding: utf-8

def main():
    var = input('Digite algo: ')

    print(f"O tipo primitivo desse valor é: {type(var)}")
    print(f"Só tem espaços? {var.isspace()}")
    print(f"É um número? {var.isnumeric()}")
    print(f"É alfabético? {var.isalpha()}")
    print(f"É alfanumérico? {var.isalnum()}")
    print(f"Está em maiúsculas? {var.isupper()}")
    print(f"Está em minúsculas? {var.islower()}")
    print(f"Está capitalizado? {var.istitle()}")

if __name__ == "__main__":
    main()
