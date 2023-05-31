#!/bin/bash

sudo rm -f /run/nologin
sudo /usr/bin/ssh-keygen -A
sudo /usr/sbin/sshd -D
