
import httpclient

type PushService = ref object
    token : string

proc newPushService*(init_token:string) : PushService = 
    result = PushService(token: init_token)

proc send*(service: PushService, message:string, title: string = "", url: string = ""): string = 
    var data = newMultipartData()
    if url != "":
        data["type"] = "link"
        data["url"] = url
    else: 
        data["type"] = "note"
    data["title"] = title
    data["body"] = message
    let auth = "Authorization: Bearer " & service.token

    result = postContent("https://api.pushbullet.com/v2/pushes", multipart=data, extraHeaders = auth)
