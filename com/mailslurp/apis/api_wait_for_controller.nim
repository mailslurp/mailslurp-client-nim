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

import ../models/model_email
import ../models/model_email_preview
import ../models/model_match_options
import ../models/model_wait_for_conditions

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


proc waitFor*(httpClient: HttpClient, waitForConditions: WaitForConditions): (Option[seq[EmailPreview]], Response) =
  ## Wait for an email to match the provided filter conditions such as subject contains keyword.
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & "/waitFor", $(%waitForConditions))
  constructResult[seq[EmailPreview]](response)


proc waitForEmailCount*(httpClient: HttpClient, count: int, inboxId: string, timeout: int64, unreadOnly: bool): (Option[seq[EmailPreview]], Response) =
  ## Wait for and return count number of emails. Hold connection until inbox count matches expected or timeout occurs
  let query_for_api_call = encodeQuery([
    ("count", $count), # Number of emails to wait for. Must be greater that 1
    ("inboxId", $inboxId), # Id of the inbox we are fetching emails from
    ("timeout", $timeout), # Max milliseconds to wait
    ("unreadOnly", $unreadOnly), # Optional filter for unread only
  ])

  let response = httpClient.get(basepath & "/waitForEmailCount" & "?" & query_for_api_call)
  constructResult[seq[EmailPreview]](response)


proc waitForLatestEmail*(httpClient: HttpClient, inboxId: string, timeout: int64, unreadOnly: bool): (Option[Email], Response) =
  ## Fetch inbox's latest email or if empty wait for an email to arrive
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId), # Id of the inbox we are fetching emails from
    ("timeout", $timeout), # Max milliseconds to wait
    ("unreadOnly", $unreadOnly), # Optional filter for unread only.
  ])

  let response = httpClient.get(basepath & "/waitForLatestEmail" & "?" & query_for_api_call)
  constructResult[Email](response)


proc waitForMatchingEmail*(httpClient: HttpClient, matchOptions: MatchOptions, count: int, inboxId: string, timeout: int64, unreadOnly: bool): (Option[seq[EmailPreview]], Response) =
  ## Wait or return list of emails that match simple matching patterns
  httpClient.headers["Content-Type"] = "application/json"
  let query_for_api_call = encodeQuery([
    ("count", $count), # Number of emails to wait for. Must be greater that 1
    ("inboxId", $inboxId), # Id of the inbox we are fetching emails from
    ("timeout", $timeout), # Max milliseconds to wait
    ("unreadOnly", $unreadOnly), # Optional filter for unread only
  ])

  let response = httpClient.post(basepath & "/waitForMatchingEmails" & "?" & query_for_api_call, $(%matchOptions))
  constructResult[seq[EmailPreview]](response)


proc waitForMatchingFirstEmail*(httpClient: HttpClient, matchOptions: MatchOptions, inboxId: string, timeout: int64, unreadOnly: bool): (Option[Email], Response) =
  ## Wait for or return the first email that matches proved MatchOptions array
  httpClient.headers["Content-Type"] = "application/json"
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId), # Id of the inbox we are matching an email for
    ("timeout", $timeout), # Max milliseconds to wait
    ("unreadOnly", $unreadOnly), # Optional filter for unread only
  ])

  let response = httpClient.post(basepath & "/waitForMatchingFirstEmail" & "?" & query_for_api_call, $(%matchOptions))
  constructResult[Email](response)


proc waitForNthEmail*(httpClient: HttpClient, inboxId: string, index: int, timeout: int64, unreadOnly: bool): (Option[Email], Response) =
  ## Wait for or fetch the email with a given index in the inbox specified. IF indx doesn't exist waits for it to exist or timeout to occur.
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId), # Id of the inbox you are fetching emails from
    ("index", $index), # Zero based index of the email to wait for. If an inbox has 1 email already and you want to wait for the 2nd email pass index=1
    ("timeout", $timeout), # Max milliseconds to wait for the nth email if not already present
    ("unreadOnly", $unreadOnly), # Optional filter for unread only
  ])

  let response = httpClient.get(basepath & "/waitForNthEmail" & "?" & query_for_api_call)
  constructResult[Email](response)

