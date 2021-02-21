# Conky

![Conky logo](conky-logotype.png)

Conky is a free, light-weight system monitor for X, that displays any kind of information on your desktop.

You can find more information about conky :point_right: [here](https://github.com/brndnmtthws/conky)

## Conky Widget

In this new version, all elements have been adjusted for Manjaro Linux XFCE x64 with Lenovo laptop. Match for 1366x768 screen resolution.

## Motivation
The main reason for this repository is to save in one place and thus be able to share some work on the awesome personalization tool named **conky**

I really liked the design work provided by gvoze32 with the Mainte theme (See [here](https://github.com/gvoze32/Mainte)). And I wanted to take this style and apply it to other widgets on my desktop.

## Screenshots
![preview](preview.png)

## Features
Actually the gadgets can do :

- Show and Monitor computer metric like fan speed, processor use etc... (Use the awesome conky theme Mainte)
- Show local weather (Use the awesome http://wttr.in/ to show the local weather)
- Show a little calendar
- And much more !

## Installation

For those who want to try this conky's themes, here’s a step by step how to setup guide:

**1.** First of all, open terminal and install conky if you don’t have it via command:

```bash
sudo pacman -S conky
```

you may want to install optionnal package, please refer to the table below

**2.** Clone this repository
```bash
git clone https://github.com/Kosteron/Conky.git
```

**3.** Copy all folder to `~/.conky` (set hidden file to visible on your file manager cause the folder is hidden) or create this folder if it doesnt exist :
```bash
mkdir ~/.conky
mv Conky-master/* ~/.conky
```

**4.** Open terminal and type
```bash
cd ~/.conky/
./conky-launch.sh
```

**5.** Move the font to your font folder :
```bash
sudo mv ~/.conky/fonts/* /usr/share/fonts
```

**6.** You may have to change some parameters like resolution or position to match your actual linux desktop characteristics.
So edit **conky-rc** file and change this kind of parameter for the position on your screen :
```
conky.config = {
...
gap_x = 10,
gap_y = 520,
...
};
```

Edit the **conky-launch.sh** and uncommet or comment the lines corresponding to the widgets you don't want
To automatically run when startup, just add conky-launch.sh to autostart.

## Full detail

|Name|Dependencies|Description|
|----|----|----|
|**conky_calendar**| calendar| Simple Calendar |
|**conky_clock**|:heavy_multiplication_x: | Simple clock |
|**conky_computer_monitor**|:heavy_multiplication_x: | Show computer metrics |
|**conky_fortune**| fortune-mod | Displays fortune cookie on the desktop |
|**conky_mini_moc_player**| mocp, ffmpeg | Display information about the current song listened with mocp |
|**conky_pingbeat**|:heavy_multiplication_x: | Simple pingbeat |
|**conky_weather**|:heavy_multiplication_x:| Display a lot of information about weather |
|**conky_xfce_workspace_indicator**|:heavy_multiplication_x:|Simple workspace indicator|
|**conky_altcoin_monitor**|jq & awk|Simple altcoin price indicator|

## Tweak

The following section details how to modify the widgets to suit your needs.

### conkyrc-weather

If you want to change the location of the local weather, please edit the bash script **weather-pull.sh** and change the following line :
```bash
curl "http://wttr.in/aix-en-provence?T&1&Q&F&lang=fr" --silent --max-time 3 > /tmp/weather.tmp
```
by what you want, for example London : 
```bash
curl "http://wttr.in/london?T&1&Q&F" --silent --max-time 3 > /tmp/weather.tmp
```
You can find more parameter and option on the wttr.in [Github repository](https://github.com/chubin/wttr.in).

### conkyrc-pingbeat

don't forget to change the keyword **HOSTNAME** by the IP address or the domain name you want to monitor.

On the file **conkyrc-pingbeat** :
```bash
${exec if ! $( ping -c1 HOSTNAME &>/dev/null ) ; then echo "Server Offline - `date`" ; else echo "Server Online - `date`" ; fi }
```

### conkyrc-altcoin-monitor

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

## Credits
Many thanks to :

- [Vector](https://www.reddit.com/r/thinkpad/search/?q=exploded%20wallpaper&restrict_sr=1)
- **gvoze32**, who inspired me, and where I took the graphic design for the other conky's widgets
	- [Reddit Thread](https://www.reddit.com/r/unixporn/comments/e49pgl/oc_mainte_a_simple_and_functional_conky_theme/)
	- [Github repository](https://github.com/gvoze32/Mainte)
- **Igor chubin**
	- [Github repository](https://github.com/chubin/wttr.in)

## License
MIT © [Kosteron]()