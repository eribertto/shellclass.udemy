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
useradd -c "${COMMENT}" -m "${USER_NAME}"

# check if the useradd command succeeded or not
# we dont want to tell the user that an account was created when it hasn't been
if [[ "${?}" -ne 0 ]]	# check the exit status
then
	echo 'The account could not be created!'
	exit 1
fi

# set the password
echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"
if [[ "${?}" -ne 0 ]]
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





