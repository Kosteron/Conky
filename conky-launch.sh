#!/bin/env sh

killall conky

# Start computer monitoring widget (based on Mainte conky script)
conky -c $HOME/.conky/conky_computer_monitor/conkyrc-computer-metrics &
sleep 0.8
conky -c $HOME/.conky/conky_computer_monitor/conkyrc-exploded-view &

# start weather widget
sleep 0.8
bash $HOME/.conky/conky_weather/weather-pull.sh &
sleep 1
conky -c $HOME/.conky/conky_weather/conkyrc-weather &

# start calendar widget
sleep 0.8
conky -c $HOME/.conky/conky_calendar/conkyrc-calendar &

# start clock widget
sleep 0.8
conky -c $HOME/.conky/conky_clock/conkyrc-clock &

# start moc mini player
sleep 0.8
conky -c $HOME/.conky/conky_mini_moc_player/conkyrc-mini-moc-player &

# start pingbeat monitor
sleep 0.8
conky -c $HOME/.conky/conky_pingbeat/conkyrc-pingbeat &