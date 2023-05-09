(map (lambda (x) (hash-ref x 'name)) 
     (hash-ref (response-json (get "https://api.kinopio.club/space/TBn3RkhMIs7ksoX64sYWu"))
	       'cards))

Kinopio space needs authorization, or, needs to be shared

Kinopio API https://help.kinopio.club/api/

model code for simple access: https://github.com/bentsai/kinopio-to-markdown

```
> res
'#hasheq((background . "")
         (backgroundTint . "")
         (boxes . ())
         (cards
          .
          (#hasheq((backgroundColor . null)
                   (createdAt . "2023-05-07T13:07:20.305Z")
                   (frameId . 0)
                   (id . "0Oqc7lt0Wz7PaHYejSVD2")
                   (isComment . #f)
                   (isCreatedThroughPublicApi . #f)
                   (isLocked . #f)
                   (isRemoved . #f)
                   (linkToSpaceId . null)
                   (name . "command2")
                   (nameUpdatedAt . "2023-05-07T13:07:24.244Z")
                   (nameUpdatedByUserId . "5My83_-9fXJKx6a3cuq8s")
                   (resizeWidth . null)
                   (shouldHideUrlPreviewImage . #f)
                   (shouldHideUrlPreviewInfo . #f)
                   (shouldUpdateUrlPreview . #f)
                   (spaceId . "TBn3RkhMIs7ksoX64sYWu")
                   (updatedAt . "2023-05-07T13:07:24.244Z")
                   (urlPreviewDescription . null)
                   (urlPreviewErrorUrl . null)
                   (urlPreviewFavicon . null)
                   (urlPreviewImage . null)
                   (urlPreviewIsVisible . #t)
                   (urlPreviewTitle . null)
                   (urlPreviewUrl . null)
                   (userId . "5My83_-9fXJKx6a3cuq8s")
                   (x . 318)
                   (y . 180)
                   (z . 4))
           #hasheq((backgroundColor . null)
                   (createdAt . "2023-05-07T13:07:10.324Z")
                   (frameId . 0)
                   (id . "m_HP763y9wwm4vpdXjB0s")
                   (isComment . #f)
                   (isCreatedThroughPublicApi . #f)
                   (isLocked . #f)
                   (isRemoved . #f)
                   (linkToSpaceId . null)
                   (name . "command1")
                   (nameUpdatedAt . "2023-05-07T13:07:17.338Z")
                   (nameUpdatedByUserId . "5My83_-9fXJKx6a3cuq8s")
                   (resizeWidth . null)
                   (shouldHideUrlPreviewImage . #f)
                   (shouldHideUrlPreviewInfo . #f)
                   (shouldUpdateUrlPreview . #f)
                   (spaceId . "TBn3RkhMIs7ksoX64sYWu")
                   (updatedAt . "2023-05-07T13:07:17.339Z")
                   (urlPreviewDescription . null)
                   (urlPreviewErrorUrl . null)
                   (urlPreviewFavicon . null)
                   (urlPreviewImage . null)
                   (urlPreviewIsVisible . #t)
                   (urlPreviewTitle . null)
                   (urlPreviewUrl . null)
                   (userId . "5My83_-9fXJKx6a3cuq8s")
                   (x . 123)
                   (y . 157)
                   (z . 3))
           #hasheq((backgroundColor . null)
                   (createdAt . "2023-05-07T09:21:05.153Z")
                   (frameId . 0)
                   (id . "nYOXovJc-64TQdOS4quig")
                   (isComment . #f)
                   (isCreatedThroughPublicApi . #f)
                   (isLocked . #f)
                   (isRemoved . #f)
                   (linkToSpaceId . null)
                   (name . "card A - content")
                   (nameUpdatedAt . "2023-05-07T12:17:59.328Z")
                   (nameUpdatedByUserId . "5My83_-9fXJKx6a3cuq8s")
                   (resizeWidth . null)
                   (shouldHideUrlPreviewImage . #f)
                   (shouldHideUrlPreviewInfo . #f)
                   (shouldUpdateUrlPreview . #f)
                   (spaceId . "TBn3RkhMIs7ksoX64sYWu")
                   (updatedAt . "2023-05-07T12:17:59.329Z")
                   (urlPreviewDescription . null)
                   (urlPreviewErrorUrl . null)
                   (urlPreviewFavicon . null)
                   (urlPreviewImage . null)
                   (urlPreviewIsVisible . #t)
                   (urlPreviewTitle . null)
                   (urlPreviewUrl . null)
                   (userId . "5My83_-9fXJKx6a3cuq8s")
                   (x . 205)
                   (y . 83)
                   (z . 2))))
         (collaborators . ())
         (connectionTypes
          .
          (#hasheq((color . "rgb(249, 161, 129)")
                   (createdAt . "2023-05-07T12:17:46.129Z")
                   (id . "PBgZ7dhV83SlL-E52UDTa")
                   (name . "Across")
                   (spaceId . "TBn3RkhMIs7ksoX64sYWu")
                   (updatedAt . "2023-05-07T13:17:48.284Z"))))
         (connections
          .
          (#hasheq((connectionTypeId . "PBgZ7dhV83SlL-E52UDTa")
                   (controlPoint . "q00,00")
                   (createdAt . "2023-05-07T13:07:27.729Z")
                   (directionIsVisible . #t)
                   (endCardId . "0Oqc7lt0Wz7PaHYejSVD2")
                   (id . "BZYk4rVTROYRoAL7qRBrI")
                   (labelIsVisible . #f)
                   (path . "m222,173 q00,00 195,23")
                   (spaceId . "TBn3RkhMIs7ksoX64sYWu")
                   (startCardId . "m_HP763y9wwm4vpdXjB0s")
                   (updatedAt . "2023-05-07T13:15:34.714Z")
                   (userId . "5My83_-9fXJKx6a3cuq8s"))))
         (createdAt . "2023-05-07T09:20:48.898Z")
         (editedAt . "2023-05-07T13:07:24.244Z")
         (editedByUserId . "5My83_-9fXJKx6a3cuq8s")
         (id . "TBn3RkhMIs7ksoX64sYWu")
         (isFromTweet . #f)
         (isHidden . #f)
         (isRemoved . #f)
         (isTemplate . #f)
         (moonPhase . "")
         (name . "pttest")
         (originSpaceId . "")
         (privacy . "closed")
         (proposedShowInExplore . #f)
         (removedByUserId . null)
         (showInExplore . #f)
         (showInExploreUpdatedAt . "2023-05-01T07:50:47.866Z")
         (tags . ())
         (updateHash . "b1cED6ZuVmhj17STedDS-")
         (updatedAt . "2023-05-07T13:07:27.729Z")
         (url . "pttest-TBn3RkhMIs7ksoX64sYWu")
         (userId . "5My83_-9fXJKx6a3cuq8s")
         (users
          .
          (#hasheq((color . "#ffc1f3")
                   (description . null)
                   (id . "5My83_-9fXJKx6a3cuq8s")
                   (isDonor . null)
                   (isGuideMaker . #f)
                   (isModerator . #f)
                   (isUpgraded . #t)
                   (name . "Paul")
                   (website . null))))
         (visits . 11))
>
```

Slides

https://guitarvydas.github.io/slider/#WyJLaW5vcGlvIFRvIFJhY2tldFxuUGF1bCBUYXJ2eWRhcyBNYXkgOSwgMjAyMyIsIlN0YXJ0IFNtYWxsXG4qIHVzZSBhbiBleGlzdGluZyBleGFtcGxlIGFzIGEgZ3VpZGVcbiogd3JpdGUgc2ltcGxlIFJhY2tldCBjb2RlIHRvIGZldGNoIEtpbm9waW8gXCJTcGFjZVwiIFxuKiAoYSBLaW5vcGlvIFwiU3BhY2VcIiBpcyBhIHdlYnBhZ2UgY29udGFpbmluZyBpbmZvIGFuZCBsaW5rcyB0byBvdGhlciBwYWdlcykiLCJFeGlzdGluZyBFeGFtcGxlXG5odHRwczovL2dpdGh1Yi5jb20vYmVudHNhaS9raW5vcGlvLXRvLW1hcmtkb3duIiwiTWFpbiBTdGVwcyBJbiBFeGlzdGluZyBFeGFtcGxlXG4qIGZldGNoIFNwYWNlIGFzIEpTT05cbiogZXh0cmFjdCBmaWVsZHNcbiogZGlzY2FyZCB1bm5lZWRlZCBmaWVsZHMiLCJGZXRjaCBTcGFjZSBhcyBKU09OXG4qIGN1cmwgLUggXCJBdXRob3JpemF0aW9uOiAkMlwiIGh0dHBzOi8vYXBpLmtpbm9waW8uY2x1Yi9zcGFjZS8kMSA+IGtpbm9waW8udG1wXG4qICQxIGlzIHRoZSBTcGFjZSBOYW1lXG4qIGUuZy4gXCJodHRwczovL2tpbm9waW8uY2x1Yi9mcm9tLWRpbEhnN25ldW1rbXM0TVZLbEFpaFwiIGlzIHRoZSBmdWxsIFVSTFxuKiBuYW1lIGlzIFwiZGlsSGc3bmV1bWttczRNVktsQWloXCJcbiogJDIgaXMgYXV0aG9yaXphdGlvbiBBUEkgS2V5IC0gcHJpdmF0ZSBLZXkgb3IgZW1wdHlcbiogYXV0aG9yaXphdGlvbiBuZWVkZWQgb25seSBpZiBTcGFjZSBpcyBub3Qgc2hhcmVkXG4qIG91dHB1dCBpcyBhIEpTT04gc3RyaW5nIChzYXZlZCBpbnRvIGZpbGUga2lub3Bpby50bXApIiwiQm9pbGVycGxhdGVcbiogY3JlYXRlIGZyb250IG1hdHRlclxuKiB1c2luZyBcImVjaG9cIiBzaGVsbCBjb21tYW5kc1xuKiBjYXQga2lub3Bpby50bXAgfCBqcSAubmFtZVxuKiBcImpxXCIgc2hlbGwgY29tbWFuZCBpcyB1c2VkIHRvIGV4dHJhY3QgdGhlIG5hbWUgb2YgdGhlIFNwYWNlXG4qIC4uLlxuIiwiRXh0cmFjdCBGaWVsZHMgRnJvbSBDYXJkc1xuKiBjYXQga2lub3Bpby50bXAgfCBqcSAtciAnLmNhcmRzIHwgc29ydF9ieSgueSkgfCBzb3J0X2J5KC54KSB8IC5bXSB8IC5uYW1lICsgXCJcXG5cIidcbiogZXh0cmFjdHMgXCJjYXJkc1wiIGZpZWxkIGZyb20gSlNPTlxuKiBzb3J0cyBjYXJkc1xuKiBpdGVyYXRlcyB0aHJvdWdoIGV2ZXJ5IGNhcmQgYW5kIGV4dHJhY3RzIFwibmFtZVwiIGZpZWxkXG4qIFwibmFtZVwiIGZpZWxkIGNvbnRhaW5zIF9fYWxsX18gY29udGVudCBpbiBjYXJkXG4iLCJSYWNrZXQgLSBGZXRjaCBTcGFjZSBhcyBKU09OXG4qIChyZXNwb25zZS1qc29uIChnZXQgXCJodHRwczovL2FwaS5raW5vcGlvLmNsdWIvc3BhY2UvVEJuM1JraE1Jczdrc29YNjRzWVd1XCIpKVxuKiBcImdldFwiIGZldGNoZXMgU3BhY2VcbiogXCJyZXNwb25zZS1qc29uXCIgY29udmVydHMgZmV0Y2hlZCBkYXRhIHRvIEpTT05cblxuIiwiUmFja2V0IC0gSXRlcmF0ZSBPdmVyIEV2ZXJ5IENhcmRcbiogKG1hcCAobGFtYmRhICh4KSAoaGFzaC1yZWYgeCAnbmFtZSkpIChoYXNoLXJlZiAocmVzcG9uc2UtanNvbiAuLi4pICdjYXJkcykpXG4qIChoYXNoLXJlZiAocmUuLi4pICdjYXJkcykgZXh0cmFjdHMgXCJjYXJkc1wiIGZpZWxkIChsaXN0IG9mIGNhcmQpXG4qIChsYW1iZGEgKHgpIChoYXNoLXJlZiB4ICduYW1lKSkgaXMgYW4gYW5vbnltb3VzIGZ1bmN0aW9uIHRoYXQgZXh0cmFjdHMgdGhlIFwibmFtZVwiIGZpZWxkIGZyb20gXCJ4XCIgKGEgY2FyZClcbiogKG1hcCBfX2Z1bmN0aW9uX18gX19saXN0X18pIGFwcGxpZXMgdGhlIGZ1bmN0aW9uIHRvIGV2ZXJ5IGl0ZW0gaW4gdGhlIGxpc3RcbiogaS5lLiBtYXAgLT4gaXRlcmF0ZXMgb3ZlciBldmVyeSBjYXJkXG4iXQ==

---
Kinopio To Racket
Paul Tarvydas May 9, 2023
---
Start Small
* use an existing example as a guide
* write simple Racket code to fetch Kinopio "Space" 
* (a Kinopio "Space" is a webpage containing info and links to other pages)
---
Existing Example
https://github.com/bentsai/kinopio-to-markdown
---
Main Steps In Existing Example
* fetch Space as JSON
* extract fields
* discard unneeded fields
---
Fetch Space as JSON
* curl -H "Authorization: $2" https://api.kinopio.club/space/$1 > kinopio.tmp
* $1 is the Space Name
* e.g. "https://kinopio.club/from-dilHg7neumkms4MVKlAih" is the full URL
* name is "dilHg7neumkms4MVKlAih"
* $2 is authorization API Key - private Key or empty
* authorization needed only if Space is not shared
* output is a JSON string (saved into file kinopio.tmp)
---
Boilerplate
* create front matter
* using "echo" shell commands
* cat kinopio.tmp | jq .name
* "jq" shell command is used to extract the name of the Space
* ...

---
Extract Fields From Cards
* cat kinopio.tmp | jq -r '.cards | sort_by(.y) | sort_by(.x) | .[] | .name + "\n"'
* extracts "cards" field from JSON
* sorts cards
* iterates through every card and extracts "name" field
* "name" field contains __all__ content in card
---
Racket - Fetch Space as JSON
* (response-json (get "https://api.kinopio.club/space/TBn3RkhMIs7ksoX64sYWu"))
* "get" fetches Space
* "response-json" converts fetched data to JSON


---
Racket - Iterate Over Every Card
* (map (lambda (x) (hash-ref x 'name)) (hash-ref (response-json ...) 'cards))
* (hash-ref (re...) 'cards) extracts "cards" field (list of card)
* (lambda (x) (hash-ref x 'name)) is an anonymous function that extracts the "name" field from "x" (a card)
* (map __function__ __list__) applies the function to every item in the list
* i.e. map -> iterates over every card
