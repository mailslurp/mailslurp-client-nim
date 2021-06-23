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

import ../models/model_abstract_webhook_payload
import ../models/model_create_webhook_options
import ../models/model_page_webhook_projection
import ../models/model_page_webhook_result
import ../models/model_webhook_dto
import ../models/model_webhook_new_attachment_payload
import ../models/model_webhook_new_contact_payload
import ../models/model_webhook_new_email_payload
import ../models/model_webhook_result_entity
import ../models/model_webhook_test_result

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


proc createWebhook*(httpClient: HttpClient, inboxId: string, webhookOptions: CreateWebhookOptions): (Option[WebhookDto], Response) =
  ## Attach a WebHook URL to an inbox
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & fmt"/inboxes/{inboxId}/webhooks", $(%webhookOptions))
  constructResult[WebhookDto](response)


proc deleteWebhook*(httpClient: HttpClient, inboxId: string, webhookId: string): Response =
  ## Delete and disable a Webhook for an Inbox
  httpClient.delete(basepath & fmt"/inboxes/{inboxId}/webhooks/{webhookId}"fmt"/inboxes/{inboxId}/webhooks/{webhookId}")


proc getAllWebhookResults*(httpClient: HttpClient, page: int, searchFilter: string, size: int, sort: string): (Option[PageWebhookResult], Response) =
  ## Get results for all webhooks
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("searchFilter", $searchFilter), # Optional search filter
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & "/webhooks/results" & "?" & query_for_api_call)
  constructResult[PageWebhookResult](response)


proc getAllWebhooks*(httpClient: HttpClient, page: int, searchFilter: string, size: int, sort: string): (Option[PageWebhookProjection], Response) =
  ## List Webhooks Paginated
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("searchFilter", $searchFilter), # Optional search filter
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & "/webhooks/paginated" & "?" & query_for_api_call)
  constructResult[PageWebhookProjection](response)


proc getInboxWebhooksPaginated*(httpClient: HttpClient, inboxId: string, page: int, searchFilter: string, size: int, sort: string): (Option[PageWebhookProjection], Response) =
  ## Get paginated webhooks for an Inbox
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("searchFilter", $searchFilter), # Optional search filter
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/webhooks/paginated" & "?" & query_for_api_call)
  constructResult[PageWebhookProjection](response)


proc getTestWebhookPayload*(httpClient: HttpClient, eventName: string): (Option[AbstractWebhookPayload], Response) =
  ## Get test webhook payload example. Response content depends on eventName passed. Uses `EMAIL_RECEIVED` as default.
  let query_for_api_call = encodeQuery([
    ("eventName", $eventName), # eventName
  ])

  let response = httpClient.get(basepath & "/webhooks/test" & "?" & query_for_api_call)
  constructResult[AbstractWebhookPayload](response)


proc getTestWebhookPayloadNewAttachment*(httpClient: HttpClient): (Option[WebhookNewAttachmentPayload], Response) =
  ## Get webhook test payload for new attachment event

  let response = httpClient.get(basepath & "/webhooks/test/new-attachment-payload")
  constructResult[WebhookNewAttachmentPayload](response)


proc getTestWebhookPayloadNewContact*(httpClient: HttpClient): (Option[WebhookNewContactPayload], Response) =
  ## Get webhook test payload for new contact event

  let response = httpClient.get(basepath & "/webhooks/test/new-contact-payload")
  constructResult[WebhookNewContactPayload](response)


proc getTestWebhookPayloadNewEmail*(httpClient: HttpClient): (Option[WebhookNewEmailPayload], Response) =
  ## Get webhook test payload for new email event

  let response = httpClient.get(basepath & "/webhooks/test/new-email-payload")
  constructResult[WebhookNewEmailPayload](response)


proc getWebhook*(httpClient: HttpClient, webhookId: string): (Option[WebhookDto], Response) =
  ## Get a webhook for an Inbox

  let response = httpClient.get(basepath & fmt"/webhooks/{webhookId}")
  constructResult[WebhookDto](response)


proc getWebhookResult*(httpClient: HttpClient, webhookResultId: string): (Option[WebhookResultEntity], Response) =
  ## Get a webhook result for a webhook

  let response = httpClient.get(basepath & fmt"/webhooks/results/{webhookResultId}")
  constructResult[WebhookResultEntity](response)


proc getWebhookResults*(httpClient: HttpClient, webhookId: string, page: int, searchFilter: string, size: int, sort: string): (Option[PageWebhookResult], Response) =
  ## Get a webhook results for a webhook
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("searchFilter", $searchFilter), # Optional search filter
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & fmt"/webhooks/{webhookId}/results" & "?" & query_for_api_call)
  constructResult[PageWebhookResult](response)


proc getWebhooks*(httpClient: HttpClient, inboxId: string): (Option[seq[WebhookDto]], Response) =
  ## Get all webhooks for an Inbox

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/webhooks")
  constructResult[seq[WebhookDto]](response)


proc sendTestData*(httpClient: HttpClient, webhookId: string): (Option[WebhookTestResult], Response) =
  ## Send webhook test data

  let response = httpClient.post(basepath & fmt"/webhooks/{webhookId}/test")
  constructResult[WebhookTestResult](response)

