#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=game_data -t --no-align -c"

NUM_GUESSES=0
GET_USER_INPUT() {
  (( NUM_GUESSES+=1 ))   
  read GUESS_NUM
}

echo "Enter your username:"
read USERNAME

USERNAME_LOOKUP_RESULT=$($PSQL "SELECT * FROM users WHERE username='$USERNAME';")
if [[ -z $USERNAME_LOOKUP_RESULT ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INITIALIZE_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, 0);")
else
  IFS='|' read -r USERNAME GAMES_PLAYED BEST_GAME <<< $USERNAME_LOOKUP_RESULT
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."  
fi

TARGET_NUM=$(( RANDOM % 1000 + 1 ))
echo $TARGET_NUM
echo -e "\nGuess the secret number between 1 and 1000:"
GET_USER_INPUT

while [[ $GUESS_NUM -ne $TARGET_NUM ]]
do
  if [[ ! $GUESS_NUM =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    GET_USER_INPUT
  elif [[ $GUESS_NUM -gt $TARGET_NUM ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    GET_USER_INPUT
  else
    echo -e "\nIt's higher than that, guess again:"
    GET_USER_INPUT
  fi
done

echo -e "\nYou guessed it in $NUM_GUESSES tries. The secret number was $TARGET_NUM. Nice job!"
(( GAMES_PLAYED+=1 ))

if [[ $BEST_GAME -eq 0 || $NUM_GUESSES -lt $BEST_GAME ]]
then
  END_UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$NUM_GUESSES WHERE username='$USERNAME';")
else
  END_UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME';")
fi
