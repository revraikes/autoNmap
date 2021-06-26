# autoNmap
Network discovery with Nmap for listing network devices in an easily readable CSV file

Requirements:
Linux OS
Nmap program installed
Terminal running Bash shell
"sudo" rights

This is a simple, interactive script to find devices on your network and diplay them in a way that is easily readable and transportable.
Use cases:
 You aren't great with the commandline but you know where to find the Terminal
 You just want to know what your headless Raspberry Pi IP address is and you don't have a cable to connect to a monitor
 You had some folks put up your security cameras and- oops- you forgot to get the MAC addresses so you can add them to your DHCP reservations

Using the -sP flag, the script pulls the IP, MAC, and NIC manufacturer so that you can discern what possible device is being reported on that IP.

How to use:
Download this script to the directory of your choice
Open Terminal and cd into that directory, i.e: cd ~/Downloads (if you didn't move it to your home dir.)
Launch script in Terminal with: ./autoNmap.sh
(if Terminal complains, use "chmod 744 autoNmap.sh" and reissue the above command)
You will be asked for the IP range: example 192.168.0.0/24 is your whole network, 10.1.1.20-60 will show you what is on the network if you know what's on 10.1.1.1 (likely the gateway) up to 10.1.1.19
You will be asked what you want to call the file - nmap prefix and date suffix will be appended for your convenience
If you have not used sudo recently, you will be asked for a password
Once it has finished (which may be some time for a large network) you will be asked if you want to open the file. If you do not, you are told where it exists.

Could you do all of this with Nmap's built-in XML generator? Sure, if you know Python or some other way to parse the info. I made this for fun to see if I could in Bash.
I hope you get something out of this simple, little tool, especially when your sys-admin says, "Sure, just get me the IPs & MACs and I'll set them up in the system :)
Happened to me, true story.
