#!/usr/bin/expect -f
spawn ssh students@172.27.26.188 
expect ": "
send "cs641a\r"
expect ": "
send "Cryptbits\r"
expect ": "
send "#amkers12\r"
expect ": "
send "7\r"
expect "> "
send "go\r"
expect "> "
send "go\r"
expect "> "
send "go\r"
expect "> "
send "go\r"
expect "> "
send "go\r"
expect "> "
send "give\r"
expect "> "
send "read\r"
expect "> "

    # list
	# exit
	# quit
	# give
	# read
	# enter
	# go
	# climb
	# put
	# insert
	# pull
	# dive
	# jump
	# back
	# catch
	# grab
	# explore
	# pick
	# pluck
	# wave
	# exit1
	# exit2
	# exit3
	# exit4
	# exit5
	# exit6
	# exit7
	# exit8
	# exit9