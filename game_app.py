import random

def which_numaber_am_i():
    print("Hey system, please think a number from 1 to 30")
    system_selected_number = random.randint(1, 30)
    guess_number = ""

    while system_selected_number != guess_number:
        guess_number = int(input("Guess your number between 1 to 30: "))

        if guess_number < system_selected_number:
            print(" it is too low, try again another number")
        elif guess_number > system_selected_number:
            print(" it is too high, try again another number")
        else :
            print(f" {guess_number} you guessed the right number")
            return guess_number
            print(guess_number)
            break

which_numaber_am_i()