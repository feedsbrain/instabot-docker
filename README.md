# InstaBot Docker

Instabot is a toolkit written in Python for building Instagram bots using the undocumented private API. Instabot Docker is the docker image that wrap original instabot script and expose required parameters to environment variables.

# How to Build

Clone this repository using command:

```
git clone https://github.com/feedsbrain/instabot-docker
```

then follow the instruction below. I'm assuming that you already familiar with `docker` and `docker-cli` .

Using Docker CLI: 

```
docker build -t [image-name:tag-name].
```

Example: 

```
docker build -t instabot:latest .
```

# How to Use

You need to be faimiar with Docker CLI. For beginners, I recommended to use [Kitematic](https://kitematic.com/). Minimum parameter to run this image is:

```
docker run -e IG_USER=username -e IG_PASSWORD=password --name username feedsbrain/instabot
```

Please check the list of supported parameters down below.

# Parameters
|  Parameter  |       Description       |
|:-----------:|:-----------------------:|
|   IG_USER   | Your instagram username |
| IG_PASSWORD | Your instagram password |

# Configuration

The latest changes done by [instabot.py](https://github.com/instabot-py/instabot.py) team has allows us to put the bot configurations inside the `yaml` file. And without any specific reason, this repo has included default configuration inside the docker image with default values as you can see here:

`instabot.config.yml`

```
---
debug: 0
logging.version: 1
logging.disable_existing_loggers: False
logging.root.level: INFO
logging.formatters.simple: 
  format: '%(asctime)s - {{login}} - %(name)s - %(levelname)s - %(message)s'
logging.handlers.console:
  level: DEBUG
  class: logging.StreamHandler
  formatter: simple
  stream: ext://sys.stdout
logging.loggers.InstaBot.handlers:
  - console
start_at_h: 0
start_at_m: 0
end_at_h: 23
end_at_m: 59
like_per_run: 200
follow_per_run: 5
follow_time: 604800
user_min_follow: 200
user_max_follow: 0
follow_time_enabled: true
unfollow_per_run: 5
unfollow_recent_feed: true
unlike_per_run: 0
time_till_unlike: 604800
comments_per_day: 0
comment_list: 
  - 
    - this
    - the
    - your
  - 
    - photo
    - picture
    - pic
    - shot
    - snapshot
    - capture
  - 
    - is
    - looks
    - "is really"
  - 
    - great
    - super
    - good
    - wow
    - cool
    - great
    - magnificent
    - magical
    - stylish
    - beautiful
    - lovely
    - excellent
    - amazing
  - 
    - "."
    - "..."
    - "!"
    - "!!!"
tag_list: 
  - landscape
  - cityscape
  - portraiture
  - travel
  - sunrise
  - sunset
  - milkyway
  - drone
  - food
  - model
  - traveldestination
  - wunderlust
  - nature
  - model
  - cookie
  - cake
  - street
  - foodism
  - candid
  - healthyfood
  - healt
  - portraiture
  - streetfood
tag_blacklist: 
  - nude
  - sexy
  - lgbt
  - gay
max_like_for_one_tag: 10
unfollow_break_min: 15
unfollow_break_max: 30
unfollow_not_following: true
unfollow_inactive: true
unfollow_selebgram: false
unfollow_probably_fake: true
unwanted_username_list: 
  - second
  - stuff
  - art
  - project
  - love
  - life
  - food
  - blog
  - free
  - keren
  - photo
  - graphy
  - indo
  - travel
  - art
  - shop
  - store
  - sex
  - toko
  - jual
  - online
  - murah
  - jam
  - kaos
  - case
  - baju
  - fashion
  - corp
  - tas
  - butik
  - grosir
  - karpet
  - sosis
  - salon
  - skin
  - care
  - cloth
  - tech
  - rental
  - kamera
  - beauty
  - express
  - kredit
  - collection
  - impor
  - preloved
  - follow
  - follower
  - gain
  - .id
  - _id
  - bags
unfollow_whitelist: 
  - instagram
  - facebook
  - twitter
```

If you need to use your own configuration file, please refer to the original [instabot.py](https://github.com/instabot-py/instabot.py) page for the complete documentation on how to create this configuration file. What we need to do next is to put the config inside a folder i.e. `config/instabot.config.yml` so that you can bind the `config` folder as volume to `/app/config`. 

Please refer to this `docker-compose.yml` sample:

`docker-compose.yml`
```
# docker-compose.yml example
version: '3'
services:
  instabot: # recomended to use your username
    build: .
    stdin_open: true
    tty: true
    restart: always
    environment:
      - IG_USER=username
      - IG_PASSWORD=password
    volumes:
      - data:/app/db
      - session:/app/session
      - /host/location/config:/app/config # bind to your host folder
    networks:
      - instagram
networks:
  instagram:
volumes:
  data:
  session:
  config:
```

# Credits

All credits goes to the [instabot.py](https://github.com/instabot-py/instabot.py) team as my involvement is just packaging their work to docker image as I personally use to help me to do my job maintaining multiple accounts.