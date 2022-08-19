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

import ../models/model_bounced_email_dto
import ../models/model_bounced_recipient_dto
import ../models/model_filter_bounced_recipients_options
import ../models/model_filter_bounced_recipients_result
import ../models/model_page_bounced_email
import ../models/model_page_bounced_recipients
import ../models/model_page_complaint

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


proc filterBouncedRecipient*(httpClient: HttpClient, FilterBouncedRecipientsOptions: FilterBouncedRecipientsOptions): (Option[FilterBouncedRecipientsResult], Response) =
  ## Filter a list of email recipients and remove those who have bounced
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & "/bounce/filter-recipients", $(%FilterBouncedRecipientsOptions))
  constructResult[FilterBouncedRecipientsResult](response)


proc getBouncedEmail*(httpClient: HttpClient, id: string): (Option[BouncedEmailDto], Response) =
  ## Get a bounced email.

  let response = httpClient.get(basepath & fmt"/bounce/emails/{id}")
  constructResult[BouncedEmailDto](response)


proc getBouncedEmails*(httpClient: HttpClient, page: int, size: int, sort: string, since: string, before: string): (Option[PageBouncedEmail], Response) =
  ## Get paginated list of bounced emails.
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index
    ("size", $size), # Optional page size 
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & "/bounce/emails" & "?" & query_for_api_call)
  constructResult[PageBouncedEmail](response)


proc getBouncedRecipient*(httpClient: HttpClient, id: string): (Option[BouncedRecipientDto], Response) =
  ## Get a bounced email.

  let response = httpClient.get(basepath & fmt"/bounce/recipients/{id}")
  constructResult[BouncedRecipientDto](response)


proc getBouncedRecipients*(httpClient: HttpClient, page: int, size: int, sort: string, since: string, before: string): (Option[PageBouncedRecipients], Response) =
  ## Get paginated list of bounced recipients.
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index 
    ("size", $size), # Optional page size 
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & "/bounce/recipients" & "?" & query_for_api_call)
  constructResult[PageBouncedRecipients](response)


proc getComplaints*(httpClient: HttpClient, page: int, size: int, sort: string, since: string, before: string): (Option[PageComplaint], Response) =
  ## Get paginated list of complaints.
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index 
    ("size", $size), # Optional page size 
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & "/bounce/complaints" & "?" & query_for_api_call)
  constructResult[PageComplaint](response)

