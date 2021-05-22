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

import ../models/model_page_sent_email_projection
import ../models/model_sent_email_dto

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


proc getSentEmail*(httpClient: HttpClient, id: string): (Option[SentEmailDto], Response) =
  ## Get sent email receipt

  let response = httpClient.get(basepath & fmt"/sent/{id}")
  constructResult[SentEmailDto](response)


proc getSentEmails*(httpClient: HttpClient, inboxId: string, page: int, size: int, sort: string): (Option[PageSentEmailProjection], Response) =
  ## Get all sent emails in paginated form
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId), # Optional inboxId to filter sender of sent emails by
    ("page", $page), # Optional page index in inbox sent email list pagination
    ("size", $size), # Optional page size in inbox sent email list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & "/sent" & "?" & query_for_api_call)
  constructResult[PageSentEmailProjection](response)


proc getSentOrganizationEmails*(httpClient: HttpClient, inboxId: string, page: int, size: int, sort: string): (Option[PageSentEmailProjection], Response) =
  ## Get all sent organization emails in paginated form
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId), # Optional inboxId to filter sender of sent emails by
    ("page", $page), # Optional page index in inbox sent email list pagination
    ("size", $size), # Optional page size in inbox sent email list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & "/sent/organization" & "?" & query_for_api_call)
  constructResult[PageSentEmailProjection](response)

