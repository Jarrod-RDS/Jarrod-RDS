#!/bin/bash
file_check=$(find . -maxdepth 1 -type f -name 'docker-compose.yml' | wc -l)
if [[ $file_check -lt 1 ]]; then
    echo "Error: docker-compose.yml not found in current directory. Exiting"
    exit 1
fi
PS3='Please type the number of the timezone you wish to use in docker-compose.yml: '
options=("New York UTC-5" "Chicago UTC-6" "Denver UTC-7" "Los Angeles UTC-8" "Juneau UTC-9" "Anchorage UTC-10" "Honolulu UTC-10" "Amsterdam UTC+1" "Singapore UTC+8" "Quit")
select timez in "${options[@]}"
do
	case $timez in
		"New York UTC-5")
			sed -i 's+America/Los_Angeles+America/New_York+g' docker-compose.yml
			echo "Timezone changed to New York UTC-5"
			break
			;;
		"Chicago UTC-6")
			sed -i 's+America/Los_Angeles+America/Chicago+g' docker-compose.yml
			echo "Timezone changed to Chicago UTC-6"
			break
			;;
		"Denver UTC-7")
			sed -i 's+America/Los_Angeles+America/Denver+g' docker-compose.yml
			echo "Timezone changed to Denver UTC-7"
			break
			;;
		"Los Angeles UTC-8")
			echo "Timezone is Los Angeles UTC-8 by default. No changes made."
			break
			;;
		"Juneau UTC-9")
			sed -i 's+America/Los_Angeles+America/Juneau+g' docker-compose.yml
			echo "Timezone changed to Juneau UTC-9"
			break
			;;
		"Anchorage UTC-10")
			sed -i 's+America/Los_Angeles+America/Anchorage+g' docker-compose.yml
			echo "Timezone changed to Anchorage UTC-10"
			break
			;;
		"Honolulu UTC-10")
			sed -i 's+America/Los_Angeles+Pacific/Honolulu+g' docker-compose.yml
			echo "Timezone changed to Honolulu UTC-10"
			break
			;;
		"Singapore UTC+8")
			sed -i 's+America/Los_Angeles+Asia/Singapore+g' docker-compose.yml
			echo "Timezone changed to Singapore UTC+8"
			break
			;;
		"Amsterdam UTC+1")
			sed -i 's+America/Los_Angeles+Europe/Amsterdam+g' docker-compose.yml
			echo "Timezone changed to Amsterdam UTC+1"
			break
			;;
		Quit)
			break
			;;
	esac
done 
