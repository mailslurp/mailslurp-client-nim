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

import ../models/model_alias_dto
import ../models/model_create_alias_options
import ../models/model_page_alias
import ../models/model_page_email_projection
import ../models/model_page_thread_projection
import ../models/model_reply_to_alias_email_options
import ../models/model_send_email_options
import ../models/model_sent_email_dto
import ../models/model_thread_projection
import ../models/model_update_alias_options

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


proc createAlias*(httpClient: HttpClient, CreateAliasOptions: CreateAliasOptions): (Option[AliasDto], Response) =
  ## Create an email alias. Must be verified by clicking link inside verification email that will be sent to the address. Once verified the alias will be active.
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & "/aliases", $(%CreateAliasOptions))
  constructResult[AliasDto](response)


proc deleteAlias*(httpClient: HttpClient, aliasId: string): Response =
  ## Delete an email alias
  httpClient.delete(basepath & fmt"/aliases/{aliasId}")


proc getAlias*(httpClient: HttpClient, aliasId: string): (Option[AliasDto], Response) =
  ## Get an email alias

  let response = httpClient.get(basepath & fmt"/aliases/{aliasId}")
  constructResult[AliasDto](response)


proc getAliasEmails*(httpClient: HttpClient, aliasId: string, page: int, size: int, sort: string, since: string, before: string): (Option[PageEmailProjection], Response) =
  ## Get emails for an alias
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index alias email list pagination
    ("size", $size), # Optional page size alias email list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Optional filter by sent after given date time
    ("before", $before), # Optional filter by sent before given date time
  ])

  let response = httpClient.get(basepath & fmt"/aliases/{aliasId}/emails" & "?" & query_for_api_call)
  constructResult[PageEmailProjection](response)


proc getAliasThreads*(httpClient: HttpClient, aliasId: string, page: int, size: int, sort: string, since: string, before: string): (Option[PageThreadProjection], Response) =
  ## Get threads created for an alias
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in thread list pagination
    ("size", $size), # Optional page size in thread list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Optional filter by sent after given date time
    ("before", $before), # Optional filter by sent before given date time
  ])

  let response = httpClient.get(basepath & fmt"/aliases/{aliasId}/threads" & "?" & query_for_api_call)
  constructResult[PageThreadProjection](response)


proc getAliases*(httpClient: HttpClient, search: string, page: int, size: int, sort: string, since: string, before: string): (Option[PageAlias], Response) =
  ## Get all email aliases you have created
  let query_for_api_call = encodeQuery([
    ("search", $search), # Optional search term
    ("page", $page), # Optional page index in alias list pagination
    ("size", $size), # Optional page size in alias list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & "/aliases" & "?" & query_for_api_call)
  constructResult[PageAlias](response)


proc getThread*(httpClient: HttpClient, threadId: string): (Option[ThreadProjection], Response) =
  ## Get a thread

  let response = httpClient.get(basepath & fmt"/aliases/threads/{threadId}")
  constructResult[ThreadProjection](response)


proc getThreadsPaginated*(httpClient: HttpClient, page: int, size: int, sort: string, since: string, before: string): (Option[PageThreadProjection], Response) =
  ## Get all threads
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in thread list pagination
    ("size", $size), # Optional page size in thread list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Optional filter by sent after given date time
    ("before", $before), # Optional filter by sent before given date time
  ])

  let response = httpClient.get(basepath & "/aliases/threads" & "?" & query_for_api_call)
  constructResult[PageThreadProjection](response)


proc replyToAliasEmail*(httpClient: HttpClient, aliasId: string, emailId: string, ReplyToAliasEmailOptions: ReplyToAliasEmailOptions): (Option[SentEmailDto], Response) =
  ## Reply to an email
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.put(basepath & fmt"/aliases/{aliasId}/emails/{emailId}"fmt"/aliases/{aliasId}/emails/{emailId}", $(%ReplyToAliasEmailOptions))
  constructResult[SentEmailDto](response)


proc sendAliasEmail*(httpClient: HttpClient, aliasId: string, SendEmailOptions: SendEmailOptions): (Option[SentEmailDto], Response) =
  ## Send an email from an alias inbox
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & fmt"/aliases/{aliasId}/emails", $(%SendEmailOptions))
  constructResult[SentEmailDto](response)


proc updateAlias*(httpClient: HttpClient, aliasId: string, UpdateAliasOptions: UpdateAliasOptions): (Option[AliasDto], Response) =
  ## Update an email alias
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.put(basepath & fmt"/aliases/{aliasId}", $(%UpdateAliasOptions))
  constructResult[AliasDto](response)

