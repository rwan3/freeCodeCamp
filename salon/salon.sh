#! /bin/bash


PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
#$PSQL TRUNCATE customers appointments services

MAIN_MENU(){
  echo -e "\n~~~ WELCOME ~~~\n"

  echo Pick one of our services:
  SERVICES=$($PSQL "SELECT * FROM services;")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"

  done   

  # read service_id input
  read SERVICE_ID_SELECTED
  
  # get service_id
  SERVICE_ID_RESPONSE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")

  # if service not exists
  if [[ -z $SERVICE_ID_RESPONSE ]]
  then
    MAIN_MENU
  else
    echo Please enter your phone number:
    read CUSTOMER_PHONE

    # check if customer exists
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    
    if [[ -z $CUSTOMER_ID ]]
    then
      echo Please enter your Name:
      read CUSTOMER_NAME
      NEW_CUSTOMER_RESPONSE=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    fi

    echo Please enter a time the appointment should take place:
    read SERVICE_TIME

    NEW_APPOINTMENT_RESPONSE=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_RESPONSE, '$SERVICE_TIME');")

    if [[ $NEW_APPOINTMENT_RESPONSE = "INSERT 0 1" ]]
    then
      GET_SERVICE=$($PSQL "SELECT name from services WHERE service_id=$SERVICE_ID_RESPONSE ;")

      # check if name is set
      if [[ -z $CUSTOMER_NAME ]]
      then
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
      fi

      echo "I have put you down for a $GET_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
    fi

  fi

  

}

MAIN_MENU