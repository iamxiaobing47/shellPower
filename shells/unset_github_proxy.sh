#!/bin/bash

#Unset git proxy when the VPN is disconnected
git config --global --unset http.proxy 
git config --global --unset https.proxy