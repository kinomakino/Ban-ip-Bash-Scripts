#!/usr/bin/expect -f

set IP [lindex $argv 0]
set timeout 5
spawn ssh -o StrictHostKeyChecking=no user@ip_sonicwall -oKexAlgorithms=diffie-hellman-group1-sha1
expect "Password:"
send "password\n"
expect ">"
send "configure\n"
expect "*:"
send "yes\n"
send "address-object ipv4 BAN_OSSIM_IP\n"
expect "*#*"
send "host IP\n"
expect "*#*"
send "zone WAN\n"
expect "*#*"
send "commit\n"
expect "*#*"
send "exit\n"
expect "*#*"
send "address-group ipv4 BLACKLIST\n"
expect "*#*"
send "address-object ipv4 BAN_OSSIM_IP\n"
expect "*#*"
send "commit\n"
expect "*#*"
send "exit\n"
expect "*#*"
send "exit\n"
expect "*#*"
send "exit\n"
interact
