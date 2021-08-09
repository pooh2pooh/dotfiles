#!/bin/sh

DATA=$(curl -s 'https://blockchain.info/ru/ticker' | jq -r '.RUB .buy')
if ping -c1 ya.ru &> /dev/null;
  then echo $DATA | cut -f1 -d. | numfmt --to=si
  else echo "0.0"
fi
#printf "%'.2f\n" $DATA
