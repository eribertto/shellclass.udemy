#!/bin/bash

# this script creates a user on the local system
# you will be prompted to enter the username, the person name and a password
# the username, password and host for this account will be displayed

# make sure the script is run by root
if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo or as root.'
	exit 1
fi

# get the username (login)
read -rp 'Enter the username to create: ' USER_NAME

# get the real name (contents for the description field).
read -rp 'Enter the name of the person or application that will use this account: ' COMMENT

# get the password
read -rp 'Enter the password of the account: ' PASSWORD

# create the account
# note the comment variable wrapped by double quotes as protection for spaces in the comment
if ! useradd -c "${COMMENT}" -m "${USER_NAME}"
then
	echo 'The account could not be created!'
	exit 1
fi

# set the password
if ! echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"
then
	echo 'The password could not be set!'
	exit 1
fi

# force password change on first login
passwd -e "${USER_NAME}"

# display the username, password and host where the user was created
# use echo to add new line separators
echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo 'host:'
echo "${HOSTNAME}"
exit 0	# give success status





