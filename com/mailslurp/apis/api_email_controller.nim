#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.   ## Resources - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository 
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

import ../models/model_attachment_meta_data
import ../models/model_byte_array
import ../models/model_content_match_options
import ../models/model_download_attachment_dto
import ../models/model_email
import ../models/model_email_content_match_result
import ../models/model_email_text_lines_result
import ../models/model_forward_email_options
import ../models/model_page_email_projection
import ../models/model_raw_email_json
import ../models/model_reply_to_email_options
import ../models/model_sent_email_dto
import ../models/model_unread_count
import ../models/model_validation_dto

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


proc deleteAllEmails*(httpClient: HttpClient): Response =
  ## Delete all emails
  httpClient.delete(basepath & "/emails")


proc deleteEmail*(httpClient: HttpClient, emailId: string): Response =
  ## Delete an email
  httpClient.delete(basepath & fmt"/emails/{emailId}")


proc downloadAttachment*(httpClient: HttpClient, attachmentId: string, emailId: string, apiKey: string): (Option[ByteArray], Response) =
  ## Get email attachment bytes. If you have trouble with byte responses try the `downloadAttachmentBase64` response endpoints.
  let query_for_api_call = encodeQuery([
    ("apiKey", $apiKey), # Can pass apiKey in url for this request if you wish to download the file in a browser. Content type will be set to original content type of the attachment file. This is so that browsers can download the file correctly.
  ])

  let response = httpClient.get(basepath & fmt"/emails/{emailId}/attachments/{attachmentId}"fmt"/emails/{emailId}/attachments/{attachmentId}" & "?" & query_for_api_call)
  constructResult[ByteArray](response)


proc downloadAttachmentBase64*(httpClient: HttpClient, attachmentId: string, emailId: string): (Option[DownloadAttachmentDto], Response) =
  ## Get email attachment as base64 encoded string (alternative to binary responses)

  let response = httpClient.get(basepath & fmt"/emails/{emailId}/attachments/{attachmentId}/base64"fmt"/emails/{emailId}/attachments/{attachmentId}/base64")
  constructResult[DownloadAttachmentDto](response)


proc forwardEmail*(httpClient: HttpClient, emailId: string, forwardEmailOptions: ForwardEmailOptions): Response =
  ## Forward email
  httpClient.headers["Content-Type"] = "application/json"
  httpClient.post(basepath & fmt"/emails/{emailId}/forward", $(%forwardEmailOptions))


proc getAttachmentMetaData*(httpClient: HttpClient, attachmentId: string, emailId: string): (Option[AttachmentMetaData], Response) =
  ## Get email attachment metadata

  let response = httpClient.get(basepath & fmt"/emails/{emailId}/attachments/{attachmentId}/metadata"fmt"/emails/{emailId}/attachments/{attachmentId}/metadata")
  constructResult[AttachmentMetaData](response)


proc getAttachments*(httpClient: HttpClient, emailId: string): (Option[seq[AttachmentMetaData]], Response) =
  ## Get all email attachment metadata

  let response = httpClient.get(basepath & fmt"/emails/{emailId}/attachments")
  constructResult[seq[AttachmentMetaData]](response)


proc getEmail*(httpClient: HttpClient, emailId: string, decode: bool): (Option[Email], Response) =
  ## Get email content
  let query_for_api_call = encodeQuery([
    ("decode", $decode), # Decode email body quoted-printable encoding to plain text. SMTP servers often encode text using quoted-printable format (for instance `=D7`). This can be a pain for testing
  ])

  let response = httpClient.get(basepath & fmt"/emails/{emailId}" & "?" & query_for_api_call)
  constructResult[Email](response)


proc getEmailContentMatch*(httpClient: HttpClient, emailId: string, contentMatchOptions: ContentMatchOptions): (Option[EmailContentMatchResult], Response) =
  ## Get email content regex pattern match results. Runs regex against email body and returns match groups.
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & fmt"/emails/{emailId}/contentMatch", $(%contentMatchOptions))
  constructResult[EmailContentMatchResult](response)


proc getEmailHTML*(httpClient: HttpClient, emailId: string, decode: bool): (Option[string], Response) =
  ## Get email content as HTML
  let query_for_api_call = encodeQuery([
    ("decode", $decode), # decode
  ])

  let response = httpClient.get(basepath & fmt"/emails/{emailId}/html" & "?" & query_for_api_call)
  constructResult[string](response)


proc getEmailHTMLQuery*(httpClient: HttpClient, emailId: string, htmlSelector: string): (Option[EmailTextLinesResult], Response) =
  ## Parse and return text from an email, stripping HTML and decoding encoded characters
  let query_for_api_call = encodeQuery([
    ("htmlSelector", $htmlSelector), # HTML selector to search for. Uses JQuery/JSoup/CSS style selector like '.my-div' to match content. See https://jsoup.org/apidocs/org/jsoup/select/Selector.html for more information.
  ])

  let response = httpClient.get(basepath & fmt"/emails/{emailId}/htmlQuery" & "?" & query_for_api_call)
  constructResult[EmailTextLinesResult](response)


proc getEmailTextLines*(httpClient: HttpClient, emailId: string, decodeHtmlEntities: bool, lineSeparator: string): (Option[EmailTextLinesResult], Response) =
  ## Parse and return text from an email, stripping HTML and decoding encoded characters
  let query_for_api_call = encodeQuery([
    ("decodeHtmlEntities", $decodeHtmlEntities), # Decode HTML entities
    ("lineSeparator", $lineSeparator), # Line separator character
  ])

  let response = httpClient.get(basepath & fmt"/emails/{emailId}/textLines" & "?" & query_for_api_call)
  constructResult[EmailTextLinesResult](response)


proc getEmailsPaginated*(httpClient: HttpClient, inboxId: seq[string], page: int, size: int, sort: string, unreadOnly: bool): (Option[PageEmailProjection], Response) =
  ## Get all emails
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId.join(",")), # Optional inbox ids to filter by. Can be repeated. By default will use all inboxes belonging to your account.
    ("page", $page), # Optional page index in email list pagination
    ("size", $size), # Optional page size in email list pagination. Maximum size is 100. Use page index and sort to page through larger results
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("unreadOnly", $unreadOnly), # Optional filter for unread emails only. All emails are considered unread until they are viewed in the dashboard or requested directly
  ])

  let response = httpClient.get(basepath & "/emails" & "?" & query_for_api_call)
  constructResult[PageEmailProjection](response)


proc getLatestEmail*(httpClient: HttpClient, inboxIds: seq[string]): (Option[Email], Response) =
  ## Get latest email
  let query_for_api_call = encodeQuery([
    ("inboxIds", $inboxIds.join(",")), # Optional set of inboxes to filter by. Only get the latest email from these inbox IDs
  ])

  let response = httpClient.get(basepath & "/emails/latest" & "?" & query_for_api_call)
  constructResult[Email](response)


proc getLatestEmailInInbox*(httpClient: HttpClient, inboxId: string): (Option[Email], Response) =
  ## Get latest email
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId), # ID of the inbox you want to get the latest email from
  ])

  let response = httpClient.get(basepath & "/emails/latestIn" & "?" & query_for_api_call)
  constructResult[Email](response)


proc getOrganizationEmailsPaginated*(httpClient: HttpClient, inboxId: seq[string], page: int, size: int, sort: string, unreadOnly: bool): (Option[PageEmailProjection], Response) =
  ## Get all organization emails
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId.join(",")), # Optional inbox ids to filter by. Can be repeated. By default will use all inboxes belonging to your account.
    ("page", $page), # Optional page index in email list pagination
    ("size", $size), # Optional page size in email list pagination. Maximum size is 100. Use page index and sort to page through larger results
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("unreadOnly", $unreadOnly), # Optional filter for unread emails only. All emails are considered unread until they are viewed in the dashboard or requested directly
  ])

  let response = httpClient.get(basepath & "/emails/organization" & "?" & query_for_api_call)
  constructResult[PageEmailProjection](response)


proc getRawEmailContents*(httpClient: HttpClient, emailId: string): (Option[string], Response) =
  ## Get raw email string

  let response = httpClient.get(basepath & fmt"/emails/{emailId}/raw")
  constructResult[string](response)


proc getRawEmailJson*(httpClient: HttpClient, emailId: string): (Option[RawEmailJson], Response) =
  ## Get raw email in JSON

  let response = httpClient.get(basepath & fmt"/emails/{emailId}/raw/json")
  constructResult[RawEmailJson](response)


proc getUnreadEmailCount*(httpClient: HttpClient): (Option[UnreadCount], Response) =
  ## Get unread email count

  let response = httpClient.get(basepath & "/emails/unreadCount")
  constructResult[UnreadCount](response)


proc replyToEmail*(httpClient: HttpClient, emailId: string, replyToEmailOptions: ReplyToEmailOptions): (Option[SentEmailDto], Response) =
  ## Reply to an email
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.put(basepath & fmt"/emails/{emailId}", $(%replyToEmailOptions))
  constructResult[SentEmailDto](response)


proc validateEmail*(httpClient: HttpClient, emailId: string): (Option[ValidationDto], Response) =
  ## Validate email

  let response = httpClient.post(basepath & fmt"/emails/{emailId}/validate")
  constructResult[ValidationDto](response)

