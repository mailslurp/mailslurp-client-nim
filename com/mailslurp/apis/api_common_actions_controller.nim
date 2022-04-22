#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://docs.mailslurp.com/) - [Examples](https://github.com/mailslurp/examples) repository
# The version of the OpenAPI document: 6.5.2
# Contact: contact@mailslurp.dev
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

import ../models/model_inbox_dto
import ../models/model_simple_send_email_options

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


proc createNewEmailAddress*(httpClient: HttpClient, allowTeamAccess: bool, useDomainPool: bool, expiresAt: string, expiresIn: int64, emailAddress: string, inboxType: string, description: string, name: string, tags: seq[string], favourite: bool): (Option[InboxDto], Response) =
  ## Create new random inbox
  let query_for_api_call = encodeQuery([
    ("allowTeamAccess", $allowTeamAccess), # 
    ("useDomainPool", $useDomainPool), # 
    ("expiresAt", $expiresAt), # 
    ("expiresIn", $expiresIn), # 
    ("emailAddress", $emailAddress), # 
    ("inboxType", $inboxType), # 
    ("description", $description), # 
    ("name", $name), # 
    ("tags", $tags.join(",")), # 
    ("favourite", $favourite), # 
  ])

  let response = httpClient.post(basepath & "/newEmailAddress" & "?" & query_for_api_call)
  constructResult[InboxDto](response)


proc createRandomInbox*(httpClient: HttpClient, allowTeamAccess: bool, useDomainPool: bool, expiresAt: string, expiresIn: int64, emailAddress: string, inboxType: string, description: string, name: string, tags: seq[string], favourite: bool): (Option[InboxDto], Response) =
  ## Create new random inbox
  let query_for_api_call = encodeQuery([
    ("allowTeamAccess", $allowTeamAccess), # 
    ("useDomainPool", $useDomainPool), # 
    ("expiresAt", $expiresAt), # 
    ("expiresIn", $expiresIn), # 
    ("emailAddress", $emailAddress), # 
    ("inboxType", $inboxType), # 
    ("description", $description), # 
    ("name", $name), # 
    ("tags", $tags.join(",")), # 
    ("favourite", $favourite), # 
  ])

  let response = httpClient.post(basepath & "/createInbox" & "?" & query_for_api_call)
  constructResult[InboxDto](response)


proc deleteEmailAddress*(httpClient: HttpClient, inboxId: string): Response =
  ## Delete inbox email address by inbox id
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId), # 
  ])
  httpClient.delete(basepath & "/deleteEmailAddress" & "?" & query_for_api_call)


proc emptyInbox*(httpClient: HttpClient, inboxId: string): Response =
  ## Delete all emails in an inbox
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId), # 
  ])
  httpClient.delete(basepath & "/emptyInbox" & "?" & query_for_api_call)


proc sendEmailSimple*(httpClient: HttpClient, SimpleSendEmailOptions: SimpleSendEmailOptions): Response =
  ## Send an email
  httpClient.headers["Content-Type"] = "application/json"
  httpClient.post(basepath & "/sendEmail", $(%SimpleSendEmailOptions))

