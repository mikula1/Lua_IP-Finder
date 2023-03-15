# Downloading lua

## Windows

Lua has a website where you can download their tools which will allow you to write and execute lua code: https://www.lua.org/download.html

In order execute lua code you may have to add lua in the environment variables by adding the path from where it's installed

## Linux

The entire installation of Lua can be done using the command line, with the apt package manager.

Open up a new Terminal and type: sudo apt-get install lua5.4

Provide your password when prompted and wait for the installation to finish.

# Downloading lua project

Open up Terminal and clone repository to desired location: git clone https://github.com/mikula1/lua_IPfinder

### or

Simply download the project from github site.

# Using lua console

## Windows

Open the lua console and type out command: lua54 C:\Users\PATH..\IPfinder.lua

The PATH.. will be the directory where you downloaded the project files

NOTE: check what version of lua you have and change the lua54 (lua v5.4) to lua(your version) 

## Linux

Open terminal and navigate to file directory and type: lua IPfinder

# Using IPfinder program

Type in desired IP addresses to find out the resoliution between them.

IP addresses should be typed in one at a time, each followed by "Enter"

NOTE: this program only supports full format IPv4 and IPv6 addresses 
e.g  IPv4 --> 192.0.2.146  IPv6 --> 2001:0db8:85a3:0000:0000:8a2e:0370:7334


