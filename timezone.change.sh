#!/bin/bash
file_check=$(find . -maxdepth 1 -type f -name 'docker-compose.yml' | wc -l)
if [[ $file_check -lt 1 ]]; then
    echo "Error: docker-compose.yml not found in current directory. Exiting"
    exit 1
fi
PS3='Please type the number of the timezone you wish to use in docker-compose.yml: '
options=("New York" "Chicago" "Denver" "Los Angeles" "Juneau" "Anchorage" "Honolulu" "Quit")
##America/Anchorage UTC-10
##America/Chicago UTC-6
##America/Denver UTC-7
##America/Juneau UTC-9
##America/New_York UTC-5
##Pacific/Honolulu UTC-10
select timez in "${options[@]}"
do
	case $timez in
		"New York")
			sed -i 's+America/Los_Angeles+America/New_York+g' docker-compose.yml
			echo "Timezone changed to New York UTC-5"
			break
			;;
		Chicago)
			sed -i 's+America/Los_Angeles+America/Chicago+g' docker-compose.yml
			echo "Timezone changed to Chicago UTC-6"
			break
			;;
		Denver)
			sed -i 's+America/Los_Angeles+America/Denver+g' docker-compose.yml
			echo "Timezone changed to Denver UTC-7"
			break
			;;
		"Los Angeles")
			echo "Timezone is Los Angeles UTC-8 by default. No changes made."
			break
			;;
		Juneau)
			sed -i 's+America/Los_Angeles+America/Juneau+g' docker-compose.yml
			echo "Timezone changed to Juneau UTC-9"
			break
			;;
		Anchorage)
			sed -i 's+America/Los_Angeles+America/Anchorage+g' docker-compose.yml
			echo "Timezone changed to Anchorage UTC-10"
			break
			;;
		Honolulu)
			sed -i 's+America/Los_Angeles+Pacific/Honolulu+g' docker-compose.yml
			echo "Timezone changed to Honolulu UTC-10"
			break
			;;
		Quit)
			break
			;;
	esac
done 
