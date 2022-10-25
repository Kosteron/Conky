#!/bin/env bash
killall conky
# start for conky-bluetooth-monitor
conky -c /home/koriastra/.conky/conf/conky-bluetooth-monitor/conky-bluetooth-monitor &
# start for conky-calendar
conky -c /home/koriastra/.conky/conf/conky-calendar/conky-calendar &
# start for conky-clock
conky -c /home/koriastra/.conky/conf/conky-clock/conky-clock &
# start for conky-computer-metrics
conky -c /home/koriastra/.conky/conf/conky-computer-metrics/conky-computer-metrics &
# start for conky-exploded-view
conky -c /home/koriastra/.conky/conf/conky-exploded-view/conky-exploded-view &
# start for conky-rss-reader
conky -c /home/koriastra/.conky/conf/conky-rss-reader/conky-rss-reader &
# start for conky-weather
conky -c /home/koriastra/.conky/conf/conky-weather/conky-weather &
