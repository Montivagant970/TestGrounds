PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

NO_MATCH() {
  echo "I could not find that element in the database."
}

QUERY_DB() {
  QUERY_RESULT=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, p.type_id, t.type FROM elements e LEFT JOIN properties p USING (atomic_number) LEFT JOIN types t USING (type_id) WHERE $1=$2;")
  if [[ -z "$QUERY_RESULT" ]]
  then
    NO_MATCH
    return 1
  fi
  QUERY_READ 
}

QUERY_READ() {
  IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID TYPE <<< "$QUERY_RESULT"
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
}

NUM_PATTERN='^[0-9]+$'
SYM_PATTERN='^[a-zA-Z]{1,2}$'
NAME_PATTERN='^[a-zA-Z]{3,}$'
if [[ $1 =~ $NUM_PATTERN ]]
then
  QUERY_DB 'p.atomic_number' "$1"
elif [[ $1 =~ $SYM_PATTERN ]]
then
  QUERY_DB 'e.symbol' "'${1}'"
elif [[ $1 =~ $NAME_PATTERN ]]
then
  QUERY_DB 'e.name' "'${1}'"
else
  NO_MATCH
fi
