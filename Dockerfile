# Use an official Python runtime as a parent image
FROM python:3.7-slim AS build-env

# Set the working directory to /app
WORKDIR /app

# Checkout latest instabot.py source code
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/instabot-py/instabot.py.git build
# Checkout instabot version 1.2.3
RUN cd build && git checkout 95ebc6e20fbf930dfbffd0b28d557a64d0042d54
RUN rm -rf build/.git

# Build runtime image
FROM python:3.7-slim
WORKDIR /app

# Copy from build image
COPY --from=build-env /app/build .

# This is the magic
COPY instabot.py /app
RUN rm example.py

# Install any needed packages specified in requirements.txt
RUN pip3 install --trusted-host pypi.python.org -r ./requirements/base.txt

# Define environment variable
# Your instagram username
ENV IG_USER=username \
# Your instagram password
    IG_PASSWORD=password \
# Start program at the hour
    IG_START_HOUR=0 \
# Start program at the min
    IG_START_MINUTE=0 \
# End program at the hour
    IG_END_HOUR=23 \
# End program at the min
    IG_END_MINUTE=59 \
# Number of photos to like per day (over 1000 may cause throttling)
    IG_LIKE_PER_DAY=50 \
# Maximum number of likes on photos to like (set to 0 to disable)
    IG_MEDIA_MAX_LIKE=0 \
# Minimum number of likes on photos to like (set to 0 to disable)
    IG_MEDIA_MIN_LIKE=0 \
# Users to follow per day
    IG_FOLLOW_PER_DAY=50 \
# Seconds to wait before unfollowing
    IG_FOLLOW_TIME=17800 \
# Check user before following them if they have X minimum of followers. Set 0 to disable
    IG_USER_MIN_FOLLOW=0 \
# Check user before following them if they have X maximumof followers. Set 0 to disable  
    IG_USER_MAX_FOLLOW=0 \
# Whether to wait seconds set in follow_time before unfollowing
    IG_FOLLOW_TIME_ENABLED=True \
# Users to unfollow per day
    IG_UNFOLLOW_PER_DAY=0 \
# If enabled, will populate database with users from recent feed and unfollow if they meet the conditions. Disable if you only want the bot to unfollow people it has previously followed.
    IG_UNFOLLOW_RECENT_FEED=True \
# Number of media to unlike that the bot has previously liked. Set to 0 to disable.
    IG_UNLIKE_PER_DAY=0 \
# How long to wait after liking media before unliking them.
    IG_TIME_UNTIL_UNLIKE=17800 \
# Comments to post per day
    IG_COMMENT_PER_DAY=0 \
# List of word lists for comment generation
    IG_COMMENT_SUBJECT=this,the,your \
    IG_COMMENT_PHOTO=photo,picture,pic,shot,snapshot,capture \
    IG_COMMENT_ADJ=is,looks,feels \
    IG_COMMENT_COMPLEMENT=great,super,good,wow,cool,great,magnificent,magical,stylish,beautiful,lovely,glorious,excellent,amazing \
    IG_COMMENT_TERMINATOR=.,..,...,!,!!,!!! \
# Tags to use for finding posts by hasthag or location
    IG_TAGS=landscape,cityscape,portraiture,travel,sunrise,sunset,milkyway \
# Tags to ignore when liking posts
    IG_TAGS_BLACKLIST=nude,sexy,lgbt,gay \
# Users whose posts to ignore
    IG_USER_BLACKLIST={} \
# How many media of a given tag to like at once (out of 21)
    IG_MAX_LIKE_FOR_TAG=10 \
# Minimum seconds to break between unfollows
    IG_UNFOLLOW_BREAK_MIN=15 \
# Maximum seconds to break between unfollows
    IG_UNFOLLOW_BREAK_MAX=30 \
    IG_MODE=0 \
    IG_LOG_MODE=0 \
# Access instagram through a proxy. (host:port or user:password@host:port)
    IG_PROXY= \
# Unfollow Condition: Unfollow those who do not follow you back
    IG_UNFOLLOW_NOT_FOLLOWING=True \
# Unfollow Condition: Unfollow those who have not posted in a while (inactive)
    IG_UNFOLLOW_INACTIVE=True \
# Unfollow Condition: Unfollow accounts which skewed follow/follower ratio (probably fake)	True
    IG_UNFOLLOW_PROBABLY_FAKE=True \
# Unfollow Condition: Unfollow (celebrity) accounts with too many followers and not enough following
    IG_UNFOLLOW_SELEBGRAM=False

# Define volume for database
VOLUME ["/app/db", "/app/session"]

# Run app.py when the container launches
CMD ["python", "instabot.py"]
