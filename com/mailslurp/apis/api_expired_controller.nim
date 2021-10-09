#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository
# The version of the OpenAPI document: 6.5.2
# 
# Generated by: https://openapi-generator.tech
#

import httpclient
import json
import logging
import marshal
import options
import strformat
import strutils
import tables
import typetraits
import uri

import ../models/model_expiration_defaults
import ../models/model_expired_inbox_dto
import ../models/model_page_expired_inbox_record_projection

const basepath = "https://api.mailslurp.com"

template constructResult[T](response: Response): untyped =
  if response.code in {Http200, Http201, Http202, Http204, Http206}:
    try:
      when name(stripGenericParams(T.typedesc).typedesc) == name(Table):
        (some(json.to(parseJson(response.body), T.typedesc)), response)
      else:
        (some(marshal.to[T](response.body)), response)
    except JsonParsingError:
      # The server returned a malformed response though the response code is 2XX
      # TODO: need better error handling
      error("JsonParsingError")
      (none(T.typedesc), response)
  else:
    (none(T.typedesc), response)


proc getExpirationDefaults*(httpClient: HttpClient): (Option[ExpirationDefaults], Response) =
  ## Get default expiration settings

  let response = httpClient.get(basepath & "/expired/defaults")
  constructResult[ExpirationDefaults](response)


proc getExpiredInboxByInboxId*(httpClient: HttpClient, inboxId: string): (Option[ExpiredInboxDto], Response) =
  ## Get expired inbox record for a previously existing inbox

  let response = httpClient.get(basepath & fmt"/expired/inbox/{inboxId}")
  constructResult[ExpiredInboxDto](response)


proc getExpiredInboxRecord*(httpClient: HttpClient, expiredId: string): (Option[ExpiredInboxDto], Response) =
  ## Get an expired inbox record

  let response = httpClient.get(basepath & fmt"/expired/{expiredId}")
  constructResult[ExpiredInboxDto](response)


proc getExpiredInboxes*(httpClient: HttpClient, before: string, page: int, since: string, size: int, sort: string): (Option[PageExpiredInboxRecordProjection], Response) =
  ## List records of expired inboxes
  let query_for_api_call = encodeQuery([
    ("before", $before), # Filter by created at before the given timestamp
    ("page", $page), # Optional page index in inbox sent email list pagination
    ("since", $since), # Filter by created at after the given timestamp
    ("size", $size), # Optional page size in inbox sent email list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & "/expired" & "?" & query_for_api_call)
  constructResult[PageExpiredInboxRecordProjection](response)

