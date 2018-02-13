#!/bin/bash
# Openvpn Connector Script written by VGrol
# Configured with ProtonVPN in mind.

# This is the initial prompt, countries represent their top-level domains.
# Any change here is purely cosmetic, actual input is decided below.

echo "ProtonVPN Connector started, Welcome."
echo "Viable servers:'ca', 'ch', 'de', 'is', 'nl', 'us', 'se'. 'sg'"
echo "Viable Secure-core servers: 'is-de', 'is-us', 'se-fr'."
echo "To disconnect entirely please enter 'dc'"
read -p "Please select a VPN Server:" input 
  

# The main loop, initial two digits, like ca) decides the input and tries to run openvpn with the config file in the default location. This script assumes the basic Protonvpn configuration files are present in /etc/openvpn/client.
# Changing the line after --config will allow for alternate profiles 
# Copying a segment, from XX) to ;break will allow for a larger selection of items. 
# Remember to add the corresponding XX) to the echo statement up above!

while true
do
	case $input in
		ca) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/ca.protonvpn.com.udp1194.conf &
			echo "Canada selected, Connecting now."
			break;;
		 
		ch) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/ch.protonvpn.com.udp1194.conf &
			echo "Switzerland selected, Connecting now."
			break;;
		 
	 	de) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/de.protonvpn.com.udp1194.conf &
			echo "Germany selected, Connecting now."
			break;;
		 
		is) killall -SIGINT openvpn &
		        openvpn --config /etc/openvpn/client/is.protonvpn.com.udp1194.conf &
			echo "Iceland selected, Connecting now."
			break;;
	
		nl) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/nl.protonvpn.com.udp1194.conf &
			echo "Netherlands selected, Connecting now."
			break;;
		 
		us) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/us.protonvpn.com.udp1194.conf &
			echo "United Statesselected, Connecting now."
			break;;
		 
		se) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/se.protonvpn.com.udp1194.conf &
			echo "Sweden selected, Connecting now."
			break;;
	
	 	sg) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/sg.protonvpn.com.udp1194.conf &
			echo "Singapore selected, Connecting now."
			break;;
		 
 		is-de) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/is-de-01.protonvpn.com.udp1194.conf &
			echo "Secure-Core Iceland-Germany selected, Connecting now."
			break;;
		
		is-us) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/is-us-01.protonvpn.com.udp1194.conf &
			echo "Secure-Core Iceland-United States selected, Connecting now."
			break;;
		 
		se-fr) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/se-fr-01.protonvpn.com.udp1194.conf &
			echo "Secure Core Sweden-France selected, Connecting now."
			break;;
       			
		dc) killall -SIGINT openvpn &
			echo "Disconnection selected, Disabling VPN."
			break;;

	 * ) echo "Invalid input, Closing ProtonVPN Connector."
	     break;;
	esac
done
