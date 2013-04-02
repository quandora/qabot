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
#   HUBOT_QUANDORA_MATCH_ANY_QUESTION //not yet used
#   HUBOT_QUANDORA_API_URL //not yet used
#
# Commands:
#   hubot ask <question> - search about this question in quandora
#
# Author:
#   b6

api_url = "https://#{process.env.HUBOT_QUANDORA_DOMAIN}.quandora.com/m/json"
api_auth = "Basic " + new Buffer(process.env.HUBOT_QUANDORA_USER+':'+process.env.HUBOT_QUANDORA_PASSWD).toString('base64')

module.exports = (robot) ->
    robot.respond /(ask|qa|qdra) (.+)/i, (msg) -> 
        question = msg.match[2]
        msg.http(api_url + "/search")
            .headers("Authorization": api_auth)
            .query({q: question})
            .get() (err, res, body)  ->
                console.log(err)
                console.log(body)
                response = JSON.parse(body)
                if response.type == "question-search-result"
                    robot.brain.data.quandora_latests = response.data.result
                    text = ["Top Matching questions in Quandora:"]
                    i = 0
                    response.data.result.forEach (q) -> 
                        i++
                        qurl = make_qurl(q.uid)
                        text.push "#{i}. #{q.title} [re: #{q.answers}] <#{qurl}>"
                    msg.send(text.join "\n")
                else if response.type == "error"
                    msg.send("Quandora lookup error: #{response.data.message}")
 
    robot.respond /q ([0-9])/i, (msg) -> 
        i = msg.match[1] - 1
        q = robot.brain.data.quandora_latests[i] or null
        if q
            qcontent = [q.title, q.summary, "#{q.votes} votes / #{q.answers} answers",
                    make_qurl(q.uid)]
            msg.send(qcontent.join("\n"))
        else
            msg.send("Can't find question #{i + 1}")


make_qurl = (uid) ->
    app_url = "https://app.quandora.com/"
    app_url + "object/" + uid
