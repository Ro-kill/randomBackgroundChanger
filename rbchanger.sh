#!/usr/bin/env sh
# rbchanger: random background changer

# Selects a random background
background="$(ls ~/backgrounds |grep .jpg |sort -R |tail -1)"
background2=$background

# Num of monitors
count=$(xrandr |grep " connected" |wc -l)

# If two monitors
if [ $count -eq 2 ]
then

   echo "two monitors"

   # Select second background
   background2="$(ls ~/backgrounds |grep .jpg |grep -v $background |sort -R |tail -1)"
   echo $background2

   # Make dual background
   convert ~/backgrounds/$background ~/backgrounds/$background2 -append ~/backgrounds/tmp/dualBackground.jpg

   # Set background
   nitrogen --set-auto ~/backgrounds/tmp/dualBackground.jpg

# If one monitor
else

   # Changes background
   nitrogen --set-auto ~/backgrounds/$background
   echo $background

fi

# Selects another random background
background3="$(ls ~/backgrounds |grep .jpg |grep -v $background |grep -v $background2 |sort -R |tail -1)"
echo $background3

# Changes firefox background
~/bin/bbchanger.sh $background3
