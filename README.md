# InstaBot Docker

Instabot is a toolkit written in Python for building Instagram bots using the undocumented private API. Instabot Docker is the docker image that wrap original instabot script and expose required parameters to environment variables.

# How to Use

You need to be faimiar with Docker CLI. For beginners, I recommended to use [Kitematic](https://kitematic.com/). Minimum parameter to run this image is:

```
docker run -e IG_USER=username \
           -e IG_PASSWORD=password \
           -e IG_TAGS=portrait,landscape \
           --name username feedsbrain/instabot
```

Please check the list of supported parameters down below.

# Parameters
|         Parameter         |                                                                                               Description                                                                                                |     Default value     |
| :-----------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------: |
|          IG_USER          |                                                                                         Your instagram username                                                                                          |                       |
|        IG_PASSWORD        |                                                                                         Your instagram password                                                                                          |                       |
|       IG_START_HOUR       |                                                                                        Start program at the hour                                                                                         |           0           |
|      IG_START_MINUTE      |                                                                                         Start program at the min                                                                                         |           0           |
|        IG_END_HOUR        |                                                                                         End program at the hour                                                                                          |          23           |
|       IG_END_MINUTE       |                                                                                          End program at the min                                                                                          |          59           |
|      IG_LIKE_PER_DAY      |                                                                  Number of photos to like per day<br/>(over 1000 may cause throttling)                                                                   |         1000          |
|     IG_MEDIA_MAX_LIKE     |                                                                   Maximum number of likes on photos to like<br/>(set to 0 to disable)                                                                    |           0           |
|     IG_MEDIA_MIN_LIKE     |                                                                   Minimum number of likes on photos to like<br/>(set to 0 to disable)                                                                    |           0           |
|     IG_FOLLOW_PER_DAY     |                                                                                         Users to follow per day                                                                                          |           0           |
|      IG_FOLLOW_TIME       |                                                                                    Seconds to wait before unfollowing                                                                                    |    18000 (5 hours)    |
|    IG_USER_MIN_FOLLOW     |                                                      Check user before following them<br/>if they have X minimum of followers.<br/>Set 0 to disable                                                      |           0           |
|    IG_USER_MAX_FOLLOW     |                                                      Check user before following them<br/>if they have X maximum of followers.<br/>Set 0 to disable                                                      |           0           |
|  IG_FOLLOW_TIME_ENABLED   |                                                                      Whether to wait seconds set in follow_time before unfollowing                                                                       |         True          |
|    IG_UNFOLLOW_PER_DAY    |                                                                                        Users to unfollow per day                                                                                         |           0           |
|  IG_UNFOLLOW_RECENT_FEED  | If enabled, will populate database<br/>with users from recent feed and unfollow<br/>if they meet the conditions.<br/>Disable if you only want the bot<br/>to unfollow people it has previously followed. |         True          |
|     IG_UNLIKE_PER_DAY     |                                                            Number of media to unlike that the bot has previously liked. Set to 0 to disable.                                                             |           0           |
|   IG_TIME_UNTIL_UNLIKE    |                                                                        How long to wait after liking media before unliking them.                                                                         |    259200 (3 days)    |
|    IG_COMMENT_PER_DAY     |                                                                                         Comments to post per day                                                                                         |           0           |
|    IG_COMMENT_SUBJECT     |                                                                            List of word lists for comment subject generation                                                                             |    ['this','your']    |
|     IG_COMMENT_PHOTO      |                                                                             List of word lists for comment photo generation                                                                              |  ['photo','picture']  |
|      IG_COMMENT_ADJ       |                                                                              List of word lists for comment adj generation                                                                               |   ['looks','feels']   |
|   IG_COMMENT_COMPLEMENT   |                                                                           List of word lists for comment complement generation                                                                           |   ['great','good']    |
|   IG_COMMENT_TERMINATOR   |                                                                           List of word lists for comment terminator generation                                                                           |   ['!','!!','!!!']    |
|          IG_TAGS          |                     Tags to use for finding posts by hasthag or location<br/>(l:locationid from e.g.<br/>https://instagram.com/explore/locations/212999109/los-angeles-california/)                      | ['cat','l:212999109'] |
|     IG_TAGS_BLACKLIST     |                                                                                     Tags to ignore when liking posts                                                                                     |          []           |
|     IG_USER_BLACKLIST     |                   Users whose posts to ignore.<br/>Example: `{"foo": "", "bar": ""}`<br/>type only the key and leave value empty<br/>-- it will be populated with userids on startup.                    |          {}           |
|    IG_MAX_LIKE_FOR_TAG    |                                                                      How many media of a given tag<br/>to like at once (out of 21)                                                                       |           5           |
|   IG_UNFOLLOW_BREAK_MIN   |                                                                                Minimum seconds to break between unfollows                                                                                |          15           |
|   IG_UNFOLLOW_BREAK_MAX   |                                                                                Maximum seconds to break between unfollows                                                                                |          30           |
|        IG_LOG_MODE        |                                                                       Logging target (0 log to console, 1 log to file, 2 no log.)                                                                        |           0           |
|         IG_PROXY          |                                                               Access instagram through a proxy.<br/>(host:port or user:password@host:port)                                                               |                       |
| IG_UNFOLLOW_NOT_FOLLOWING |                                                                  Unfollow Condition:<br/>Unfollow those who<br/>do not follow you back                                                                   |         True          |
|   IG_UNFOLLOW_INACTIVE    |                                                           Unfollow Condition:<br/>Unfollow those who have not<br/>posted in a while (inactive)                                                           |         True          |
| IG_UNFOLLOW_PROBABLY_FAKE |                                                     Unfollow Condition:<br/>Unfollow accounts which skewed<br/>follow/follower ratio (probably fake)                                                     |         True          |
|   IG_UNFOLLOW_SELEBRAM    |                                                Unfollow Condition:<br/>Unfollow (celebrity) accounts with too many<br/>followers and not enough following                                                |         False         |