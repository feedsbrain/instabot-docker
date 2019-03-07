#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import ast
import sys

from instabot_py import InstaBot

bot = InstaBot(
    login=os.environ['IG_USER'],
    password=os.environ['IG_PASSWORD'],
    start_at_h = int(os.environ['IG_START_HOUR']),
    start_at_m = int(os.environ['IG_START_MINUTE']),
    end_at_h = int(os.environ['IG_END_HOUR']),
    end_at_m = int(os.environ['IG_END_MINUTE']),
    like_per_day=int(os.environ['IG_LIKE_PER_DAY']),
    media_max_like = int(os.environ['IG_MEDIA_MAX_LIKE']),
    media_min_like = int(os.environ['IG_MEDIA_MIN_LIKE']),
    follow_per_day=int(os.environ['IG_FOLLOW_PER_DAY']),
    follow_time=int(os.environ['IG_FOLLOW_TIME']),
    user_min_follow=int(os.environ['IG_USER_MIN_FOLLOW']),
    user_max_follow=int(os.environ['IG_USER_MAX_FOLLOW']),
    follow_time_enabled = os.environ['IG_FOLLOW_TIME_ENABLED'].lower() == 'true',
    unfollow_per_day=int(os.environ['IG_UNFOLLOW_PER_DAY']),
    unfollow_recent_feed=os.environ['IG_UNFOLLOW_RECENT_FEED'].lower() == 'true',
    unlike_per_day=int(os.environ['IG_UNLIKE_PER_DAY']),
    time_till_unlike=int(os.environ['IG_TIME_UNTIL_UNLIKE']),
    comments_per_day=int(os.environ['IG_COMMENT_PER_DAY']),
    comment_list=[os.environ['IG_COMMENT_SUBJECT'].split(','),
                os.environ['IG_COMMENT_PHOTO'].split(','),
                os.environ['IG_COMMENT_ADJ'].split(','),
                os.environ['IG_COMMENT_COMPLEMENT'].split(','),
                os.environ['IG_COMMENT_TERMINATOR'].split(',')],
    tag_list=os.environ['IG_TAGS'].split(','),
    tag_blacklist=os.environ['IG_TAGS_BLACKLIST'].split(','),
    user_blacklist=ast.literal_eval(os.environ['IG_USER_BLACKLIST']),
    max_like_for_one_tag=int(os.environ['IG_MAX_LIKE_FOR_TAG']),
    unfollow_break_min=int(os.environ['IG_UNFOLLOW_BREAK_MIN']),
    unfollow_break_max=int(os.environ['IG_UNFOLLOW_BREAK_MAX']),
    log_mod=int(os.environ['IG_LOG_MODE']),
    proxy=os.environ['IG_PROXY'],
    unfollow_not_following=os.environ['IG_UNFOLLOW_NOT_FOLLOWING'].lower() == 'true',
    unfollow_inactive=os.environ['IG_UNFOLLOW_INACTIVE'].lower() == 'true',
    unfollow_probably_fake=os.environ['IG_UNFOLLOW_PROBABLY_FAKE'].lower() == 'true',
    unfollow_selebgram=os.environ['IG_UNFOLLOW_SELEBGRAM'].lower() == 'true',
    database_name = './db/' + os.environ['IG_USER'] + '.db',
    session_file='./session/' + os.environ['IG_USER'] + '.session'
)

# check default username
if os.environ['IG_USER'] == "username" or os.environ['IG_USER'] == "": 
    bot.write_log("Setup your Instagram credentials using environment variables IG_USER and IG_PASSWORD")
    sys.exit(1)
else:
    bot.mainloop()
