#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import ast
import sys

from instabot_py import InstaBot

os.environ['IG_CONFIG_FILE']='instabot.config.yml'

# We need to maintain compatibility between current old and new version here
os.environ['IG_LOGIN'] = os.environ['IG_USER']
username=os.environ['IG_LOGIN']
    
print('Instagram Username: ' + username)
print('Instabot config file: ' + os.environ['IG_CONFIG_FILE'])
    
bot = InstaBot(
    login=username,
    password=os.environ['IG_PASSWORD']
)

bot.mainloop()
