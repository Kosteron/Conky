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

Check the following tweak column to see how to modify the widgets to suit your needs.

| Name | Dependencies | Description | Tweak |
|----|----|----|----|
| **conky_calendar** | ncal | Simple Calendar | :heavy_multiplication_x: |
| **conky_clock** | :heavy_multiplication_x: | Simple clock | :heavy_multiplication_x: |
| **conky_computer_monitor** | acpi | Show computer metrics | :heavy_multiplication_x: |
| **conky_fortune** | fortune-mod | Displays fortune cookie on the desktop | :heavy_multiplication_x: |
| **conky_mini_moc_player** | mocp, ffmpeg | Display information about the current song listened with mocp | :heavy_multiplication_x: |
| **conky_pingbeat** | :heavy_multiplication_x: | Simple pingbeat | [doc](docs/conkyrc-pingbeat.md) |
| **conky_weather** | :heavy_multiplication_x: | Display a lot of information about weather | [doc](docs/conkyrc-weather.md) |
| **conky_xfce_workspace_indicator** | :heavy_multiplication_x: | Simple workspace indicator | :heavy_multiplication_x: |
| **conky_altcoin_monitor** | jq & awk | Simple altcoin price indicator | [doc](docs/conkyrc-altcoin-monitor.md) |
| **conky_rss_reader** | conky-all | Simple RSS Reader | [doc](docs/conky-rss-reader.md) |
| **conky_bluetooth_monitor** | bluetoothctl | Simple Bluetooth Monitor | [doc](docs/conky-bluetooth-monitor.md) |

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