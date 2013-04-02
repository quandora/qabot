# Qabot is [Quandora][quandora]'s Hubot

[Hubot][hubot] is a pretty cool robot, helping us having fun and automating things.
This version is designed to be deployed on [Heroku][heroku].

To learn more about hubot, check out: [github.com/hubot][hubot]

[heroku]: http://www.heroku.com
[hubot]: http://github.com/hubot

## Quandora Plugin

The quandora plugin (scripts/quandora.coffee) allows to search in a quandora site and get answers.

Configuration:
```
-   HUBOT_QUANDORA_DOMAIN // your quandora domain name
-   HUBOT_QUANDORA_USER
-   HUBOT_QUANDORA_PASSWD
-   HUBOT_QUANDORA_MATCH_ANY_QUESTION //not yet used
-   HUBOT_QUANDORA_API_URL //not yet used
```

Commands:
```
-   hubot (q|ask|quandora query) <text> - search <text> in Quandora
-   hubot qs <n> - display question <n> after a search
-   hubot (qd|quandora domain) - display configured quandora domain
```

##About Quandora

[Quandora][quandora] is Question & Answer Software for technical team, helping them share knowledge in a fun and efficient way. Think StackOverflow, for your team and your knowledge.
Quandora integrates with many other services like Google Apps, Zendesk, Yammer, HipChat, Campfire and many others!

[quandora]: http://www.quandora.com