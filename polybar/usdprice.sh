#!/bin/sh

# CONFIG HERE VAR!
file=$PWD/dotfiles/polybar/usd.tmp

if [[ -f $file ]];
  then USD=$(cat $file)
  else USD="..." # if not defiened!
fi
DATA=$(curl -s 'https://www.cbr-xml-daily.ru/daily_json.js' | jq -r '.Valute.USD.Value')
if ping -c1 ya.ru &> /dev/null;
  then
    echo $DATA | cut -c1-5 > $file
    USD=$(cat $file)
fi
if [[ ${#USD} -ge 6 ]]
  then echo "Ошибка!"
  else echo $USD
fi
#printf "%s\n" $DATA
