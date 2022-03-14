#!/bin/sh

# CONFIG HERE VAR!
file=$PWD/btc.tmp
oldbtc=$PWD/old_btc.tmp

if [[ -f $file ]];
  then BTC=$(cat $file)
  else BTC="..." # if not defiened!
fi
if [[ -f $oldbtc ]];
  then OLD=$(cat $oldbtc)
  else OLD=0
fi

perOldBTC=$(echo $OLD | numfmt --from=si)
perBTC=$(echo $BTC | numfmt --from=si)

if (( perOldBTC > perBTC ));
  then PER="%{F#859900} %{F-}"
fi
if (( perOldBTC <= perBTC ));
  then PER="%{F#dc322f} %{F-}"
fi

DATA=$(curl -s 'https://blockchain.info/ticker' | jq -r '.RUB .buy')
if ping -c1 ya.ru &> /dev/null;
  then
    if [ -z "$DATA" ]; then DATA=0; fi
    echo $BTC > $oldbtc
    sleep 0.1
    echo $DATA | cut -f1 -d. | numfmt --to=si > $file
    BTC=$(cat $file)
    
fi
if [[ ${#BTC} -ge 5 ]]
  then echo "Ошибка!"
  else echo $BTC $PER 
fi
#printf "%'.2f\n" $DATA
