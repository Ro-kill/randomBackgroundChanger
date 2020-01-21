#!/usr/bin/env sh
# bbchanger: browser background changer

# Tests required parameters
if test -f ~/backgrounds/$1; then
	echo "background exists"
else
	echo "background does not exist. Make sure your chrome mozilla directory is the same as your home"
	exit 1
fi

# Pulls current background from currentBackground file
current_background=$(cat ~/backgrounds/tmp/currentBackground.txt)
echo $current_background

# Checks that currentBackground value is in userContent.css
if grep -w "$current_background" ~/.mozilla/firefox/h6l9peqc.default-release/chrome/userContent.css; then
       		
	# Replaces old background with new background and sets currentBackground
	sed -i -e "s/$current_background/$1/g" ~/.mozilla/firefox/h6l9peqc.default-release/chrome/userContent.css
	sed -i -e "s/$current_background/$1/g" ~/backgrounds/tmp/currentBackground.txt
	echo "backgrounds changed"
	exit 0

else
	# If currentBackground value is not in userContent.css
	echo "Please check your ~/backgrounds/currentBackground.txt file, it does not match the userContent.css"
	exit 1
fi

