# Description:
#  Search Quandora and return answers
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_QUANDORA_DOMAIN
#   HUBOT_QUANDORA_USER
#   HUBOT_QUANDORA_PASSWD
#
# Commands:
#   hubot ask <question> - search about this question in quandora
#
# Author:
#   b6

module.exports = (robot) ->
    robot.respond /ask (.+)/i, (msg) -> 
        question = msg[1]
        msg.send("you asked: " + question)