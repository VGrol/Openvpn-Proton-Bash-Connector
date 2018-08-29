#!/bin/bash
# Openvpn Connector Script written by VGrol
# Configured with ProtonVPN in mind.

# This is the initial prompt, countries represent their top-level domains.
# Any change here is purely cosmetic, actual input is decided below.
printf "
				ProtonVPN Connector started, 
				 	  Welcome.
"
# This bit checks for arguments, so that input can be provided on the same line that calls the script.
# If any arguments are provided it'll route to that, else it'll prompt for input.

if [ $@ ]
	then
		input=$@
	else

		printf "

				      Viable servers 		
		CA, CH, CZ, DE, DK, ES, FR, HK, IT, IS, NL, JP, US, SE, SG.

				Viable Secure-core servers	
	   			    IS-DE, IS-US, SE-FR.
	
				Viable P2P and TOR servers 	
	  			  SE-P2P, NL-P2P, CH-TOR.	


				  To Disconnect and Exit 
				     please enter  DC.
"
		read -p "
			   Please enter the desired VPN Server:
				            " input  
fi
# The main loop, initial two digits, like ca) decides the input and tries to run openvpn with the config file in the default location. This script assumes the basic Protonvpn configuration files are present in /etc/openvpn/client.
# Changing the line after --config will allow for alternate profiles 
# Copying a segment, from XX) to ;break will allow for a larger selection of items.
# The brackets surrounding two letters incidate that both the are considered valid. The current implementation results in case-insensitive input. 
# Remember to add the corresponding XX) to the printf statement up above!

while true
do
	case $input in
		[cC][aA]) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/ca.protonvpn.com.udp1194.conf --mute-replay-warnings &
			printf "Canada selected, Connecting now."
			break;;


                [cC][hH]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/ch.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Switzerland selected, Connecting now."
                        break;;		 
		[cC][hH]-[tT][oO][rR]tor) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/ch-09-tor.protonvpn.com.udp1194.conf --mute-replay-warnings &
			printf "Swiss TOR Server selected, Connecting now."
			break;;
		 

                [cC][zZ]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/cz.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Czech Republic selected, Connecting now."
                        break;;


	 	[dD][eE]) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/de.protonvpn.com.udp1194.conf --mute-replay-warnings &
			printf "Germany selected, Connecting now."
			break;;

	
                [dD][kK]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/dk.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Denmark selected, Connecting now."
                        break;;


                [eE][sS]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/es.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Spain selected, Connecting now."
                        break;;


                [fF][rR]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/fr.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "France selected, Connecting now."
                        break;;


                [hH][kK]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/hk.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Hong Kong selected, Connecting now."
                        break;;
	 

                [iI][tT]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/it.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Italy selected, Connecting now."
                        break;;


		[iI][sS]) killall -SIGINT openvpn &
		        openvpn --config /etc/openvpn/client/is.protonvpn.com.udp1194.conf --mute-replay-warnings &
			printf "Iceland selected, Connecting now."
			break;;
                [iI][sS]-[dD][eE]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/is-de-01.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Secure-Core Iceland-Germany selected, Connecting now."
                        break;;
                [iI][sS]-[uU][sS]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/is-us-01.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Secure-Core Iceland-United States selected, Connecting now."
                        break;;

	
		[nN][lL]) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/nl.protonvpn.com.udp1194.conf --mute-replay-warnings &
			printf "Netherlands selected, Connecting now."
			break;;
                [nN][lL]-[pP]2[pP]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/nl-12.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Dutch P2P server selected, Connecting now."
                        break;;


		[jJ][pP]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/jp.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Japan selected, Connecting now."
                        break;;
	
		 
		[uU][sS]) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/us.protonvpn.com.udp1194.conf --mute-replay-warnings &
			printf "United States selected, Connecting now."
			break;;

		 
		[sS][eE]) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/se.protonvpn.com.udp1194.conf --mute-replay-warnings &
			printf "Sweden selected, Connecting now."
			break;;
                [sS][eE]-[pP]2[pP]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/se-03.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Swedish P2P Server selected, Connecting now."
                        break;;
                [sS][eE]-[fF][rR]) killall -SIGINT openvpn &
                        openvpn --config /etc/openvpn/client/se-fr-01.protonvpn.com.udp1194.conf --mute-replay-warnings &
                        printf "Secure Core Sweden-France selected, Connecting now."
                        break;;


	 	[sS][gG]) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/sg.protonvpn.com.udp1194.conf --mute-replay-warnings &
			printf "Singapore selected, Connecting now."
			break;;
       			
		[dD][cC]) killall -SIGINT openvpn &
			printf "Disconnection selected, Disabling VPN."
			break;;

	 * ) printf "Invalid input, Closing ProtonVPN Connector."
	     break;;
	esac
done
