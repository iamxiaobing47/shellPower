#!/bin/bash

#Set git proxy when the VPN is connected
git config --global http.proxy http://127.0.0.1:7890 
git config --global https.proxy http://127.0.0.1:7890
