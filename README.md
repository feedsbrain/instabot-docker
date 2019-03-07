# InstaBot

Instabot is a toolkit written in Python for building Instagram bots using the undocumented private API.

## Parameters
| Parameter            | Type|                Description                           |        Default value             |
|:--------------------:|:---:|:----------------------------------------------------:|:--------------------------------:|
| IG_USER              | str | Your instagram username                              |      |
| IG_PASSWORD          | str | Your instagram password                              |      |
| IG_START_HOUR        | int | Start program at the hour                            | 0    |
| IG_START_MINUTE      | int | Start program at the min                             | 0    |
| IG_END_HOUR          | int | End program at the hour                              | 23   |
| IG_END_MINUTE        | int | End program at the min                               | 59   |
| IG_LIKE_PER_DAY      | int | Number of photos to like per day (over 1000 may cause throttling) | 1000 |
| IG_MEDIA_MAX_LIKE    | int | Maximum number of likes on photos to like (set to 0 to disable)   | 0    |
| IG_MEDIA_MIN_LIKE    | int | Minimum number of likes on photos to like (set to 0 to disable)   | 0    |
| IG_FOLLOW_PER_DAY    | int | Users to follow per day                              | 0    |
| IG_FOLLOW_TIME       | int | Seconds to wait before unfollowing                   | 5 * 60 * 60 |
| IG_USER_MIN_FOLLOW   | int | Check user before following them if they have X minimum of followers. Set 0 to disable   | 0 |
| IG_USER_MAX_FOLLOW   | int | Check user before following them if they have X maximum of followers. Set 0 to disable   | 0 |
| IG_FOLLOW_TIME_ENABLED  | bool| Whether to wait seconds set in follow_time before unfollowing | True |
| IG_UNFOLLOW_PER_DAY     | int | Users to unfollow per day                            | 0    |
| IG_UNFOLLOW_RECENT_FEED | bool| If enabled, will populate database with users from recent feed and unfollow if they meet the conditions. Disable if you only want the bot to unfollow people it has previously followed. | True |
| IG_UNLIKE_PER_DAY       | int | Number of media to unlike that the bot has previously liked. Set to 0 to disable.                           | 0 |
| IG_TIME_UNTIL_UNLIKE    | int | How long to wait after liking media before unliking them. | 3 * 24 * 60 * 60 (3 days) |
| IG_COMMENT_PER_DAY      | int | Comments to post per day                             | 0    |
| IG_COMMENT_SUBJECT      | [[str]] | List of word lists for comment subject generation        | ['this','the','your'] |
| IG_COMMENT_PHOTO        | [[str]] | List of word lists for comment photo generation          | ['photo','picture','pic','shot'] |
| IG_COMMENT_ADJ          | [[str]] | List of word lists for comment adj generation            | ['is','looks','feels'] |
| IG_COMMENT_COMPLEMENT   | [[str]] | List of word lists for comment complement generation     | ['great','super','good'] |
| IG_COMMENT_TERMINATOR   | [[str]] | List of word lists for comment terminator generation     | ['.','..','...','!','!!','!!!'] |
| IG_TAGS                 | [str] | Tags to use for finding posts by hasthag or location(l:locationid from e.g. https://www.instagram.com/explore/locations/212999109/los-angeles-california/) | ['cat', 'car', 'dog', 'l:212999109'] |
| IG_TAGS_BLACKLIST       | [str] | Tags to ignore when liking posts                   | [] |
| IG_USER_BLACKLIST       | {str: str} | Users whose posts to ignore. Example: `{"firstUsername": "", "secondUsername": ""}` type only the key and leave value empty -- it will be populated with userids on startup. | {} |
| IG_MAX_LIKE_FOR_TAG     | int | How many media of a given tag to like at once (out of 21) | 5 |
| IG_UNFOLLOW_BREAK_MIN   | int | Minimum seconds to break between unfollows           | 15 |
| IG_UNFOLLOW_BREAK_MAX   | int | Maximum seconds to break between unfollows           | 30 |
| IG_LOG_MODE             | int | Logging target (0 log to console, 1 log to file, 2 no log.) | 0 |
| IG_PROXY                | str | Access instagram through a proxy. (host:port or user:password@host:port) | |
| IG_UNFOLLOW_NOT_FOLLOWING   | bool | Unfollow Condition: Unfollow those who do not follow you back | True |
| IG_UNFOLLOW_INACTIVE        | bool | Unfollow Condition: Unfollow those who have not posted in a while (inactive) | True |
| IG_UNFOLLOW_PROBABLY_FAKE   | bool | Unfollow Condition: Unfollow accounts which skewed follow/follower ratio (probably fake) | True |
| IG_UNFOLLOW_SELEBRAM        | bool | Unfollow Condition: Unfollow (celebrity) accounts with too many followers and not enough following | False |