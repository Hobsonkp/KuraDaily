#!/bin/bash
# Write a script for scp & ssh by demonstrating remote login & file transfer functions
# Prerequisites:
#   Knowledge about ssh and scp commands.
#   Use of “case” in shell script.
#   Copy files/directories with cp command
# Objective:
#   To understand working of scp and ssh commands.
# Requirements:
#   Provide a menu to user to select ssh or scp
#   Based on user selection ask for user name and ip-address.
#   For scp ask user for direction of copy:
#       remote to local
#       local to remote.
#   Copy file to destination home directory with same source file name.
#   Ask for source/destination file location. If no destination location is provided
#   If user gives destination along with filename, keep that as destination filename.
#   If user provides only destination location (no file name), keep as source file name
# Note: User should know the password for remote user.

serverIP=""
fileUpld=""
pemName=""
userName=""
copyUPDWN=""

function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS #The Internal Field Separator (IFS) that is used for word splitting after expansion and to split lines into words with the read builtin command
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
    return $stat
}

# prompt user method of connection

read -p "Enter the method you would like to use to access the remote. Type 1 for ssh  or 2 scp?  : " promptP

case $promptP in
	1) echo "Processing via ssh"; 
    read -p "Enter the ip address for the remote system. : " serverIP;
        while !(valid_ip $serverIP) ; do
            echo "bad IP address";
            read -p "Enter a valid ip address for the remote system. : " serverIP;
        done
        if valid_ip $serverIP; then
             echo "good IP address";
             read -p "Does the remote server require a pem file? 1 - no ; 2 - yes : " pemYN;
                if [[ $pemYN -eq 1 ]]; then
                    ping -c1 -W1 -q $serverIP &>/dev/null
                    status=$( echo $? )
                    if [[ $status == 0 ]] ; then
                        echo "Server is reachable"
                        read -p "Enter your username : " userName;
                        ssh $userName@$serverIP
                    else
                       echo Connection failure
                       exit 10
                    fi
                else
                    ping -c1 -W1 -q $serverIP &>/dev/null
                    status=$( echo $? )
                    if [[ $status == 0 ]] ; then
                        echo "Server is reachable"
                        read -p "Enter your username : " userName;
                        read -p "Enter name of pem file?  : " pemName;
                        ssh -i ../$pemName $userName@$serverIP
                    else
                       echo Connection failure
                       exit 10
                    fi
                    
                fi
        else
             echo "fail";
        fi
    exit 1;;
	2) echo "Processing via scp"; 
    read -p "Enter the ip address for the remote system. : " serverIP;
        while !(valid_ip $serverIP) ; do
            echo "bad IP address";
            read -p "Enter a valid ip address for the remote system. : " serverIP;
        done
        if valid_ip $serverIP ; then
             echo "good IP address";
             read -p "Enter your username : " userName;
             read -p "What is the direction of file copy? 1 - upload ; 2 - download : " copyUPDWN;
             read -p "Does the remote server require a pem file? 1 - no ; 2 - yes : " pemYN;
             read -p "Enter your username : " userName;
             read -p "Enter your source file location : " sourceLocation;
             read -p "Enter your destination file location : " destinationLocation;
            if [[ $copyUPDWN -eq 0 ]]; then
                if [[$pemYN -eq 1]]; then
                    ping -c1 -W1 -q $serverIP &>/dev/null
                    status=$( echo $? )
                    if [[ $status == 0 ]] ; then
                     scp $sourceLocation $userName@$serverIP:$destinationLocation
                    else
                       echo Connection failure
                       exit 10
                    fi
                else
                    ping -c1 -W1 -q $serverIP &>/dev/null
                    status=$( echo $? )
                    if [[ $status == 0 ]] ; then
                    scp -i $pemFile $sourceLocation $userName@$serverIP:$destinationLocation
                    else
                       echo Connection failure
                       exit 10
                    fi
                fi
            else
                if [[$pemYN -eq 1]]; then
                    ping -c1 -W1 -q $serverIP &>/dev/null
                    status=$( echo $? )
                    if [[ $status == 0 ]] ; then
                    scp $userName@$serverIP:$sourceLocation $destinationLocation
                    else
                       echo Connection failure
                       exit 10
                    fi
                else
                    ping -c1 -W1 -q $serverIP &>/dev/null
                    status=$( echo $? )
                    if [[ $status == 0 ]] ; then
                    scp  -i $pemFile $userName@$serverIP:$sourceLocation $destinationLocation
                    else
                       echo Connection failure
                       exit 10
                    fi
                fi
            fi
        else
             echo "bad IP address";
             echo "fail"; 
             exit 9;
        fi
    exit 2;;
	*) echo "Invalid Entry"; 
    exit 0;;
esac


ping -c1 -W1 -q $serverIP &>/dev/null
status=$( echo $? )
if [[ $status == 0 ]] ; then
    echo Sending file to server
    scp -i ../$pemName ../$fileUpld ubuntu@$serverIP:/home/ubuntu/Kerri/ 
    ssh -t -i ../$pemName ubuntu@$serverIP "test -e /home/ubuntu/Kerri/$fileUpld"
        if [ $? -eq 0 ]; then
            echo $fileUpld is on the server
            else
            echo $fileUpld is not on the server
            fi
else
     echo Connection failure
     exit 1
fi

exit 0