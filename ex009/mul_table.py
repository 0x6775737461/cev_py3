#!/usr/bin/env python
# coding: utf-8

def main():
    num = int(input("Digite um número para ver a sua tabuada: "))

    for i in range(11):
        print(f"{num}\tx\t{i:2}\t= {(num * i):4}")

if __name__ == "__main__":
    main()
