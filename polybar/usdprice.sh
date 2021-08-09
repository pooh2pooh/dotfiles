#!/bin/sh

DATA=$(curl -s 'https://www.cbr-xml-daily.ru/daily_json.js' | jq -r '.Valute.USD.Value')
if ping -c1 ya.ru &> /dev/null;
  then echo $DATA | cut -c1-5
  else echo "0.0"
fi
#printf "%s\n" $DATA
