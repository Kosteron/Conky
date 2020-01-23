#!/bin/env sh

killall conky

# Start computer monitoring widget (based on Mainte conky script)
conky -c $HOME/.conky/Mainte/conkyrc-dark-bspwm &
sleep 0.8
conky -c $HOME/.conky/Mainte/conkyrc-dark-bg &

# start weather widget
sleep 0.8
bash $HOME/.conky/Mainte/weather-pull.sh &
sleep 1
conky -c $HOME/.conky/Mainte/conkyrc-weather &

# start calendar widget
sleep 0.8
conky -c $HOME/.conky/Mainte/conkyrc-calendar &
