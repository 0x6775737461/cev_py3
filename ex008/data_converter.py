#!/usr/bin/env python
# coding: utf-8

def main():
    num = float(input("Digite uma distância em metros: "))

    print(f"""
    \rA medida de {num}m corresponde a
    \r{num / (10 ** 3)}\tkm\t(quilômetro)
    \r{num / (10 ** 2)}\thm\t(hectômetro)
    \r{num / 10}\tdam\t(decâmetro)
    
    \r{num * 10}\tdm\t(decímetro)
    \r{num * (10 ** 2)}\tcm\t(centímetro)
    \r{num * (10 ** 3)}\tmm\t(milímetro)
    """)

if __name__ == "__main__":
    main()
