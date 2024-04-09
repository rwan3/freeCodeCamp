#!/bin/bash

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

  if [[ $1 =~ ^[0-9]+$ ]]
  then
    RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1;")
  else
    RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1';")

    if [[ -z $RESULT ]]
    then
      RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius  FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1';")
    fi
  fi

  # check if element is found
  if [[ -z $RESULT ]]
  then
    echo I could not find that element in the database.
  else
    echo "$RESULT" | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELT BAR BOIL
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  fi
fi