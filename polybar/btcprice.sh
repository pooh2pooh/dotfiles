#!/bin/sh

# CONFIG HERE VAR!
file=$PWD/dotfiles/polybar/btc.tmp

if [[ -f $file ]];
  then BTC=$(cat $file)
  else BTC="..." # if not defiened!
fi
DATA=$(curl -s 'https://blockchain.info/ticker' | jq -r '.RUB .buy')
if ping -c1 ya.ru &> /dev/null;
  then
    if [ -z "$DATA" ]; then DATA=0; fi
    echo $DATA | cut -f1 -d. | numfmt --to=si > $file
    BTC=$(cat $file)
    
fi
if [[ ${#BTC} -ge 5 ]]
  then echo "Ошибка!"
  else echo $BTC
fi
#printf "%'.2f\n" $DATA
