#!/usr/bin/expect -f
set IP [lindex $argv 0]
set timeout 60
spawn ssh user@ip
expect "password:"
send "password\r"
expect "fortinet_name"
send "config firewall address\r"
expect "fortinet_name (address)"
send "edit IP\r"
expect ")"
send "set subnet IP/32\r"
expect ")"
send "end\r"
expect "fortinet_name"
send "config firewall addrgrp\r"
expect ")"
send "edit BLACKLIST\r"
expect ")"
send "append member IP\r"
expect ")"
send "end\r"
expect "fortinet_name"
send "exit\r"
