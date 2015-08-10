# pbn

**P**ush**B**ullet module for **N**im 

Build:

```
nim c -d:ssl pbm.nim
```

Usage:

```
import pbn

let pushService = newPushService("PUT_YOUR_API_KEY_HERE")
echo pushService.send("Pushbullet is cool!", url = "http://pushbullet.com")
```


