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
		[uU][sS]) killall -SIGINT openvpn &
			openvpn --config /etc/openvpn/client/us.protonvpn.com.udp1194.conf &
			echo "United States selected, Connecting now."
			break;;
```
To change the command that triggers this connection, replace the [uU][sS]) with Example).
The brackets simply provide an alternative input, [uU] for instance, results in both u and U being correct. 
In this case it is to implement insensitive capitalization. 
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


## Running the script
Simply provide the script execute permissions and run as root. Root is required if the authfile is used.

```
sudo chmod +x ~/openvpn-connector.sh
```

Then to execute.
```
sudo ~/openvpn-connector.sh
```

## Notes 

#### Reconnect after suspend
If you're having trouble with openvpn not reconnecting after waking from suspend,
Arch users can simply download [openvpn-reconnect](https://aur.archlinux.org/packages/openvpn-reconnect/) from the AUR.
However it is also possible to make a small systemd service that reconnects automatically.

```
/etc/systemd/system/openvpn-reconnect.service
```
```
[Unit]
Description=Restart OpenVPN after suspend

[Service]
ExecStart=/usr/bin/pkill --signal SIGHUP --exact openvpn

[Install]
WantedBy=sleep.target
```
Make sure to enable and activate it.
```
systemctl enable openvpn-reconnect.service
systemctl start openvpn-reconnect.service
```


#### Systend Resolver
As of Systemd version 229, the standard resolv-conf updater is now depreciated,
as Systemd now provides proper API hooks to change the resolver.

This is done through installing the Update-Systemd-Resolved script, [which can be found here.](https://github.com/jonathanio/update-systemd-resolved)
Arch-linux users can also download the Aur package [openvpn-update-Systemd-resolved](https://aur.archlinux.org/packages/openvpn-update-systemd-resolved/)

Make sure to enable and start Systemd resolver.
```
systemctl enable systemd-resolved.service
systemctl start systemd-resolved.service
```

Currently, all proton VPN files are provided with the old resolver.conf configuration,
but this is easily resolved by replacing
```
up /etc/openvpn/update-resolv-conf
down /etc/openvpn/update-resolv-conf
```

with
```
setenv PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
up /etc/openvpn/scripts/update-systemd-resolved
down /etc/openvpn/scripts/update-systemd-resolved
down-pre
```

In the future, we'll most likely see systemd-update-resolved become the standard script, but alas that time is not now.



## Official protonvpn-cli
Proton recently released their own VPN tool, [you can find it here](https://github.com/ProtonVPN/protonvpn-cli)
as to be expected, it is much more advanced and polished than my tool. 
It pulls all the server configuration files from their server.

Personally I think it's great for manually picking a server, but it when the service is under stress, 
it won't be able to pull the configuration files from their server reliably. 

It also doesn't play too nicely with resume-from-hibernation implementations or start up at boot.
So for now, I'll keep an eye on it, but it hasn't depreciated my tool entirely. 
Though I'd recommend users to check theirs out before mine, since it features more user friendly configuration.
