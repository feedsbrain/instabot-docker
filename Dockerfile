# Use git container to checkout code
FROM alpine/git AS build-env

# Set the working directory to /app
WORKDIR /app

# Checkout latest instabot.py source code
RUN git clone https://github.com/instabot-py/instabot.py.git build

# Checkout instabot version 0.5.21
RUN cd build && git pull && git checkout 4850b9ab1bb8f3ec931494164fe9f369e2af2b1b
RUN rm -rf build/.git

# Build runtime image
FROM python:3.8.1-slim
WORKDIR /app

# Copy from build image
COPY --from=build-env /app/build ./instabot.py

# This is the magic
RUN python -m pip install ./instabot.py
COPY ./start-instabot.sh /app/start-instabot.sh
RUN chmod a+x /app/start-instabot.sh

# Copy our own config here
COPY ./config/instabot.config.yml /app/config/instabot.config.yml
RUN ln -sf /app/config/instabot.config.yml /app/instabot.config.yml

# Define environment variable
# Your instagram username
ENV IG_USER=username \
# Your instagram password
    IG_PASSWORD=password

# Define volume for database and config
VOLUME ["/app/db", "/app/session", "/app/config"]

# Run start-instabot.sh when the container launches
CMD ["/app/start-instabot.sh"]
