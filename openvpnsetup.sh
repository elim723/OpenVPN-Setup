#!/bin/bash

exitstatus=0
while [ $exitstatus = 0 ]
do
	CHOICE=$(whiptail --title "OpenVPN-Setup" --menu "Setup options:" 16 78 5 \
	"01" "Setup OpenVPN on your system" \
	"02" "Generate a client profile with MakeOVPN" \
	"03" "Remove OpenVPN and revert your system to a pre-installation state" 3>&2 2>&1 1>&3)

	case "${CHOICE}" in
		01)
			sudo chmod +x openvpnsetup.sh
			sudo ./openvpnsetup.sh
			if (whiptail --title "Reboot" --yesno --defaultno "Would you like to reboot now?" 8 78) then
				whiptail --title "Reboot" --msgbox "The system will reboot." 8 78
			fi
		;;
		02)
			./MakeOVPN.sh
		;;
		03)
			sudo ./remove.sh
		;;
		*) #whiptail --title "OpenVPN-Setup" --msgbox "You cancelled or are done." 8 78
			exitstatus=1
			exit
		;;
	esac
done
