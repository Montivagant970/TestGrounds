#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon -t --no-align -c"
echo $($PSQL "TRUNCATE customers, appointments RESTART IDENTITY")

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nWhat service would you like to book today?"
  $PSQL "SELECT service_id, name FROM services;" | while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done 

  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED';")
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "Please enter a valid service."
  else
    SERVICE $SERVICE_ID_SELECTED $SERVICE_NAME
  fi
}


SERVICE() {
  echo -e "\nPlease enter a phone number to book:"

  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nLooks like you're a new user! What is your name, so that we can put you in our system?"
    read CUSTOMER_NAME

    CUSTOMER_INSERTION_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' AND name = '$CUSTOMER_NAME'")

  echo -e "\nWhat time would you like to book the appointment?"
  read SERVICE_TIME

  if [[ -z $SERVICE_TIME ]]
  then
    MAIN_MENU "Apologies, it seems something went wrong in our system. Try again with a valid time, e.g. 10:30"
  else
    APPOINTMENT_INSERTION_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$1', '$SERVICE_TIME')")
    if [[ $APPOINTMENT_INSERTION_RESULT = "INSERT 0 1" ]]
    then 
      echo -e "\nI have put you down for a $2 at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      MAIN_MENU "Apologies, it seems something went wrong in our system when entering your appointment. Please try again."
    fi
  fi

  echo -e "\nWould you like to book another appointment? Hit enter to exit."
  read NEW_APPOINTMENT
  if [[ -z $NEW_APPOINTMENT ]]
  then
    exit 0
  else 
    MAIN_MENU
  fi
}

echo -e "\n~~~~Welcome to our Salon~~~~"
MAIN_MENU
