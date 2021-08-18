#!/bin/sh

# CONFIG HERE VAR!
file=$PWD/dotfiles/polybar/btc.tmp

if [[ -f $file ]];
  then BTC=$(cat $file)
  else BTC="..." # if not defiened!
fi
DATA=$(curl -s 'https://blockchain.info/ru/ticker' | jq -r '.RUB .buy')
if ping -c1 ya.ru &> /dev/null;
  then
    echo $DATA | cut -f1 -d. | numfmt --to=si > $file
    BTC=$(cat $file)
fi
echo $BTC
#printf "%'.2f\n" $DATA
