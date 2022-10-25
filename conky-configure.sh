#!/bin/env bash

set -eE -o functrace
function display_failure {
	echo "failed at $1 : $2"
}
trap 'display_failure ${LINENO} "${BASH_COMMAND}"' ERR

export NEWT_COLORS='root=white,back;roottext=white,black'
VERSION="1.0.0"
BACKTITLE="KISS Conky Assistant ${VERSION}"

function select_configurations_menu {
#
# Synopsys  : Menu which permet to a user to select configuration
# Parameter : Title of the menu
#	      Text of the menu
#
	local title="$1"
	local text="$2"
	local available_conf=()
	local conf_info=""

	# Create an array from the conf folder
	for conf in $(list_confs) ; do
		if [ -f "conf/${conf}/${conf}" ]; then
			conf_info=$(cat "conf/${conf}/${conf}" | head -n1 | sed "s/--/>/")
			if [ -z "$conf_info" ] ; then
				available_conf+=(  "$conf" "Unable to retrieve information" "OFF" )
			else
				available_conf+=(  "$conf" "$conf_info" "OFF" )
			fi
		fi
	done

	# Show configuration available
	local confs_to_activate=$(whiptail --backtitle "$BACKTITLE" --title "$title" --separate-output \
		--checklist "$text" 25 100 15 "${available_conf[@]}" 3>&1 1>&2 2>&3 || true )

	# If no choice made by the user, show a message, or ask for confirmation
	if [ -f $confs_to_activate ]; then
		display_message "No file selected, Aborted"
		return 0
	else
		if ask_confirmation "$(printf -- "Configuration selected :\n\n%s\n\nProceed?" "${confs_to_activate[@]}")"; then
			create_luncher "$confs_to_activate"
		        if ask_confirmation "$(printf "Do you want to start the program ?")"; then
		                start_program
		        else
		                return 0
		        fi
		else
			display_message "Aborted"
			return 0
		fi
	fi
}

function start_program {
#
#
#
	bash conky-launch.sh &
}


function list_confs {
#
# Synopsys  : This function create an array from a list of folder
# Parameter : No
#
	local conf_dir=conf
	local confs=()

	IFS=$'\n'
	for entry in $(ls $conf_dir)
	do
		confs+=( "$entry" )
	done

	echo "${confs[@]}"
}

function create_luncher {
#
# Synopsys  : This function create a launcher script from the configuration selected by a user
# Parameter : Array containing each configuration folder selected by a user
#
	local confs_to_activate="$1"
	local launcher_name="conky-launch.sh"

	if [ -f "$launcher_name" ]; then 
		rm "$launcher_name"
	fi

	echo -e "#!/bin/env bash" >> "$launcher_name"
	echo -e "killall conky" >> "$launcher_name"
	for conf in $confs_to_activate ; do
		#echo -e "sleep 0.8" >> "$launcher_name"
		echo -e "# start for ${conf}" >> "$launcher_name"
		echo -e "conky -c ~/.conky/conf/${conf}/${conf} &" >> "$launcher_name"
	done

	display_message "Launcher created"
}

function display_message {
#
# Synopsys  : Show a message
# Parameter : message to show
#
	local message="$1"
	whiptail --backtitle "$BACKTITLE" --msgbox "$message" 0 0
}

function ask_confirmation {
#
# Synopsys  : Ask for a confirmation
# Parameter : message to show
# 
	local message="$1"
	whiptail --backtitle "$BACKTITLE" --yesno "$message" 0 0
}

select_configurations_menu "KISS Conky Assistant" "Select a configuration file, please read each configuration's description"
