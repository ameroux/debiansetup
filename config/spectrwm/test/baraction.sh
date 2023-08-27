# chai_bronz config
#!/bin/bash
 
##############################
#       VOLUME
##############################
 
vol() {
    VOLONOFF="$(amixer -D pulse get Master | grep Left: | sed 's/[][]//g' | awk '{print $6}')"
    volu="$(amixer -D pulse get Master | awk -F'[][]' 'END{ print $2 }')"
 
MuteIcon="婢"
VolIcon="墳"
 
if [ "$VOLONOFF" = "on" ]; then
    echo "$VolIcon $volu"
else
    echo "$MuteIcon Mute"
fi
 
}
 
##############################
#           Brightness
##############################
 
lume() {
        lume="$(xbacklight -get | awk -F'.' 'END{print $1}')"
        echo -e " $lume%"
}
 
##############################
#           System Temp
##############################
 
temp() {
        temp="$(sensors | awk '/Core 0/ {print $3+0}')"  
    echo -e " $temp"℃""
}
 
#############################
#           BATTERY
#############################
 
bat() {
batstat="$(cat /sys/class/power_supply/BAT0/status)"
battery="$(cat /sys/class/power_supply/BAT0/capacity)"
    if [ $batstat = 'Unknown' ]; then
    batstat=""
    elif [[ $battery -ge 5 ]] && [[ $battery -le 19 ]]; then
    batstat=""
    elif [[ $battery -ge 20 ]] && [[ $battery -le 39 ]]; then
    batstat=""
    elif [[ $battery -ge 40 ]] && [[ $battery -le 59 ]]; then
    batstat=""
    elif [[ $battery -ge 60 ]] && [[ $battery -le 79 ]]; then
    batstat=""
    elif [[ $battery -ge 80 ]] && [[ $battery -le 95 ]]; then
    batstat=""
    elif [[ $battery -ge 96 ]] && [[ $battery -le 100 ]]; then
    batstat=""
fi
 
echo "$batstat  $battery"%""
}
 
########################################
#             NETWORK
########################################
 
network() {
 
wifi="$(ip a | grep wlp4s0 | grep inet | wc -l)"
myssid="$(iwgetid -r)" 
 
if [ $wifi = 1 ]; then
    echo "   $myssid"
else 
    echo "睊  Disconnected"
fi
}
 
 
########################################
#             DATE & TIME
########################################
 
clock() {
 
timedate=$(date '+%a %b %e  %l:%M %p')
	echo "  $timedate" 
 
}
 
#########################################
#        Bar Action Output
#########################################
 
      SLEEP_SEC=60
      #loops forever outputting a line every SLEEP_SEC secs
      while :; do     
      echo   "$(network)     $(temp)     $(lume)     $(vol)     $(bat)     $(clock)"
        sleep $SLEEP_SEC
        done
