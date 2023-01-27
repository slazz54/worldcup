#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

echo $($PSQL "TRUNCATE teams, games")
# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    #get winner name
    WINNER_NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    
    # if not found
    if [[ -z $WINNER_NAME ]]
    then
    
      #insert winner team
      INSERT_WINNER_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_NAME == "INSERT 0 1" ]]
      then
        echo Insert into teams, $WINNER
      fi
    fi
  fi
  if [[ $OPPONENT != "opponent" ]]
  then
    #get opponent name
    OPPONENT_NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")

    #if not found
    if [[ -z $OPPONENT_NAME ]]
    then

      #INSERT OPPONENT NAME
      INSERT_OPPONENT_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_NAME == "INSERT 0 1" ]]
      then
        echo Insert into teams, $OPPONENT
      fi
    fi
  fi

  if [[ $YEAR != "year" ]]
  then
  #get winner vs opponent
    YEAR_WINNER_OPPONENT=$($PSQL "SELECT CONCAT(g.year, tw.name, tog.name) AS result FROM games AS g LEFT JOIN teams AS tw ON g.winner_id = tw.team_id LEFT JOIN teams AS tog ON g.opponent_id = tog.team_id WHERE g.year='$YEAR' AND tw.name='$WINNER' AND tog.name='$OPPONENT'")
    if [[ -z $YEAR_WINNER_OPPONENT ]]
    then
      #get winner id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

      #get opponent id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      #insert games
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
      if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo Insert into games, $WINNER $OPPONENT
      fi
    fi
  fi
done
