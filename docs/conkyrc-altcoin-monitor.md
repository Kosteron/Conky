# conkyrc-altcoin-monitor

![preview](conkyrc-altcoin-monitor.png)

If you want to change the displayed currencies, the script uses the [coingecko](https://www.coingecko.com/en/api#explore-api) API to get altcoin information, especially the 'GET /coins/markets' one.

On the file **fetch.sh** :
```bash
#/bin/bash

#curl -X GET "https://api.coingecko.com/api/v3/coins/list?include_platform=false" -H  "accept: application/json" > list.json

curl -X GET "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&ids=bitcoin%2Cethereum%2Cripple%2Cpolkadot%2Cpax-gold&order=market_cap_desc&per_page=100&page=1&sparkline=false" -H  "accept: application/json" -o currentData.json
cat currentData.json | jq -r '.[] | [.id,.current_price] | @csv' | awk -v FS="," 'BEGIN{print "Name\t\tCurrent Price";print "────────────────────────"}{printf "%s\t%s€%s",$1,$2,ORS}'
```

Just add after the **http** parameter **&ids=** the coin id you want to add to the table separated by a **%2C**. The following example show only Bitcoin and Ethereum :

```
GET /coins/markets?vs_currency=eur&ids=bitcoin%2Cethereum&order=market_cap_desc&per_page=100&page=1&sparkline=false
```
