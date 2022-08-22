#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

TAKE_GUESS() {
  # Takes one guess with validation

  echo -e "\n$1" # Guess input message
  read GUESS
  
  while [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS
  done
}

echo -e "\n===== NUMBER GUESSING GAME =====\n"

# Get username
echo "Enter your username:"
read USER_NAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USER_NAME'")

# if not found
if [[ -z $USER_ID ]]
then
  # insert a new username in the table
  
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES ('$USER_NAME')")
    #TODO: Validate the result?

  #GET NEW USER ID
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USER_NAME'")
else
  # get player stats
  USER_NAME=$($PSQL "SELECT name FROM users WHERE user_id=$USER_ID")
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GUESS=$($PSQL "SELECT MIN(num_guess) FROM games WHERE user_id=$USER_ID")

  # show player stats
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
fi

# GAME START

# Generate random number
NUMBER=$(( $RANDOM % 1000 ))

TAKE_GUESS "Guess the secret number between 1 and 1000:"
NUM_GUESS=1

while [[ $GUESS != $NUMBER ]]
do
  # Gives the hint as input message
  if [[ $GUESS > $NUMBER ]]
  then
    RETRY_TEXT="It's lower than that, guess again:"
  else
    RETRY_TEXT="It's higher than that, guess again:"
  fi

  # takes another guess
  TAKE_GUESS "$RETRY_TEXT"

  # increment NUM_GUESS
  (( NUM_GUESS++ ))
done

# after the correct guess: show number of guesses
echo -e "\nYou guessed it in $NUM_GUESS tries. The secret number was $NUMBER. Nice job!"

# Record results to games table
ADD_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, num_guess) VALUES($USER_ID, $NUM_GUESS)")
