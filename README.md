# Openvpn Proton Bash Connector

## Description
This is a small bash script that was written to allow for easier VPN selection.
It has been configured to work out of the box for most ProtonVPN users, 
if they configure their client files correctly.

Documentation is provided to costumize the script and how to run it.
With some configuration, this should work with all Openvpn client configs. 

## Configuration
Example of default US selection.
``` 
		us) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/us.protonvpn.com.udp1194.conf &
			echo "United Statesselected, Connecting now."
			break;;
```
To change the command that triggers this connection, replace the US) with Example).
To change the location of the configuration file, replace /etc/openvpn/client/us.protonvpn.com.udp1194.conf with anything of your desire. This will need to be an OpenVPN compatible profile. 

If you wish to add more, add code segment above with your desired information. Make sure to add it before the * ) statement. 

## Openvpn open preperation
First retrieve your openvpn configuration files, Protonvpn does this via their vpn-account protal.
This script supports the following openvpn profiles natively, but can be configured to support all.

Standard servers: Canada, Switzerland, Germany, Iceland, The Netherlands, The United States, Sweden and Singapore.
Secure-Core servers: Iceland-Germany, Iceland-The United States and Sweden-France.

By default Openvpn client configuration files should be stored in /etc/openvpn/client/. 

If your VPN profile requires authentication, remember to add the following line to each configuration file. 
```
auth-user-pass /etc/openvpn/client/authfile
```


Now create the file listed above and add the following information.
```
*Username*
*Password*
```


Now make sure only root owns it and is the only one to access it.
```
sudo chmod 700 /etc/openvpn/client/authfile
sudo chown root:root /etc/openvpn/client/authfile
```


## How to run
Simply provide the script execute permissions and run as root. Root is required if the authfile is used.

```
sudo chmod +x ~/openvpn-connector.sh
```

Then to execute.
```
sudo ~/openvpn-connector.sh
```
