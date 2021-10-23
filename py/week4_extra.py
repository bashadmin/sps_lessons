#!/usr/bin/env python

# This week's extra credit work is a programming challenge that riffs off this week's synthesizing tasks and
# asks you to provide the inverse temperature conversion function or functions. Following the principles of 
# DRY-ness, Abstraction and Once-and-Only-Once, can you find a way to combine the similar (though inverted) 
# logic of reversing Kelvin to Celsius, Celsius to Fahrenheit, and Kelvin to Fahrenheit.

# Provide a one-to-two paragraph explanation of the coding choices you made to avoid unnecessary duplication 
# and enforce consistency and remember that even extra credit work must still adhere to all documentation and 
# style rules.

# Commentators, discuss your fellow students work. Provide comparisons to other work and offer constructive 
# criticism that might be used to improve the programs.

# k->C
# 0K − 273.15 = -273.1°C
# C->F
# (0°C × 9/5) + 32 = 32°F
# K->F
# (0K − 273.15) × 9/5 + 32 = -459.7°F

# Gives the user options
menu = {}
menu['1']="Kelvin to Celsius"
menu['2']="Celsius to Fahrenheit"
menu['3']='Kelvin to Fahrenheit'

# Rounds output
def output(out):
    return round(out,2)

# Converts kelvin to celsius
def kelvin_to_celsius(K:float):
    C = K - 273.15
    return output(C)

# converts celsius to fahrenheit
def celsius_to_fahrenheit(C:float):
    F = (C * (9/5)) + 32
    return output(F)

# converts kelvin to fahrenheit
def kelvin_to_fahrenheit(K:float):
    F = ((kelvin_to_celsius(K)) * (9/5)) + 32
    return output(F)

# converts user input to float for conversion
def choose():
    choice = float(input("Enter Temp: "))
    return choice

# main function to covert different temps
def convert():
    print(menu)
    selection = input("Choose 1, 2, or 3 for your conversion: ")
    selection = selection
    if selection == '1':
        return kelvin_to_celsius(choose())
    elif selection == '2':
        return celsius_to_fahrenheit(choose())
    elif selection == '3':
        return kelvin_to_fahrenheit(choose())
    else:
        print("Goodbye.")

convert()
