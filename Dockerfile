# Use git container to checkout code
FROM alpine/git AS build-env

# Set the working directory to /app
WORKDIR /app

# Checkout latest instabot.py source code
RUN git clone https://github.com/instabot-py/instabot.py.git build
# Checkout instabot version 1.2.5
RUN cd build && git checkout 98c2c9b3b89aab4ab4527310f9cf4e3c086df30e
RUN rm -rf build/.git

# Build runtime image
FROM python:3.7-slim
WORKDIR /app

# Copy from build image
COPY --from=build-env /app/build .

# This is the magic
COPY start-instabot.py /app
# Replace environment variable prefix
RUN sed -i 's/ConfigManager(prefix="INSTABOT")/ConfigManager(prefix="IG")/g' /app/instabot_py/config.py
# Cleanup default config and example
RUN rm example.py
RUN rm /app/instabot.config.yml
# Copy our own config here
COPY ./config/instabot.config.yml /app/config/instabot.config.yml
RUN ln -sf /app/config/instabot.config.yml /app/instabot.config.yml

# Install any needed packages
RUN pip3 install --trusted-host pypi.python.org -r ./requirements/base.txt
RUN pip3 install --trusted-host pypi.python.org -r ./requirements/misc-deps.txt
RUN pip3 install --trusted-host pypi.python.org python-telegram-handler sqlalchemy

# Define environment variable
# Your instagram username
ENV IG_USER=username \
# Your instagram password
    IG_PASSWORD=password

# Define volume for database and config
VOLUME ["/app/db", "/app/session", "/app/config"]

# Run app.py when the container launches
CMD ["python", "start-instabot.py"]
