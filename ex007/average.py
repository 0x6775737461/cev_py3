#!/usr/bin/env python
# coding: utf-8

def main():
    note_1 = float(input("Primeira nota do aluno: "))
    note_2 = float(input("Segunda nota do aluno: "))

    average = (note_1 + note_2) / 2
    
    print(f"A média entre {note_1} e {note_2} é igual a {average}")

if __name__ == "__main__":
    main()
