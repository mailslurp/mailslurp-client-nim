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

import ../models/model_abstract_webhook_payload
import ../models/model_create_webhook_options
import ../models/model_json_schema_dto
import ../models/model_page_webhook_projection
import ../models/model_page_webhook_result
import ../models/model_unseen_error_count_dto
import ../models/model_verify_webhook_signature_options
import ../models/model_verify_webhook_signature_results
import ../models/model_webhook_bounce_payload
import ../models/model_webhook_bounce_recipient_payload
import ../models/model_webhook_dto
import ../models/model_webhook_email_opened_payload
import ../models/model_webhook_email_read_payload
import ../models/model_webhook_headers
import ../models/model_webhook_new_attachment_payload
import ../models/model_webhook_new_contact_payload
import ../models/model_webhook_new_email_payload
import ../models/model_webhook_redrive_result
import ../models/model_webhook_result_dto
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


proc createAccountWebhook*(httpClient: HttpClient, CreateWebhookOptions: CreateWebhookOptions): (Option[WebhookDto], Response) =
  ## Attach a WebHook URL to an inbox
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & "/webhooks", $(%CreateWebhookOptions))
  constructResult[WebhookDto](response)


proc createWebhook*(httpClient: HttpClient, inboxId: string, CreateWebhookOptions: CreateWebhookOptions): (Option[WebhookDto], Response) =
  ## Attach a WebHook URL to an inbox
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & fmt"/inboxes/{inboxId}/webhooks", $(%CreateWebhookOptions))
  constructResult[WebhookDto](response)


proc createWebhookForPhoneNumber*(httpClient: HttpClient, phoneNumberId: string, CreateWebhookOptions: CreateWebhookOptions): (Option[WebhookDto], Response) =
  ## Attach a WebHook URL to a phone number
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & fmt"/phone/numbers/{phoneNumberId}/webhooks", $(%CreateWebhookOptions))
  constructResult[WebhookDto](response)


proc deleteAllWebhooks*(httpClient: HttpClient, before: string): Response =
  ## Delete all webhooks
  let query_for_api_call = encodeQuery([
    ("before", $before), # before
  ])
  httpClient.delete(basepath & "/webhooks" & "?" & query_for_api_call)


proc deleteWebhook*(httpClient: HttpClient, inboxId: string, webhookId: string): Response =
  ## Delete and disable a Webhook for an Inbox
  httpClient.delete(basepath & fmt"/inboxes/{inboxId}/webhooks/{webhookId}"fmt"/inboxes/{inboxId}/webhooks/{webhookId}")


proc deleteWebhookById*(httpClient: HttpClient, webhookId: string): Response =
  ## Delete a webhook
  httpClient.delete(basepath & fmt"/webhooks/{webhookId}")


proc getAllWebhookResults*(httpClient: HttpClient, page: int, size: int, sort: string, searchFilter: string, since: string, before: string, unseenOnly: bool): (Option[PageWebhookResult], Response) =
  ## Get results for all webhooks
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("searchFilter", $searchFilter), # Optional search filter
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
    ("unseenOnly", $unseenOnly), # Filter for unseen exceptions only
  ])

  let response = httpClient.get(basepath & "/webhooks/results" & "?" & query_for_api_call)
  constructResult[PageWebhookResult](response)


proc getAllWebhooks*(httpClient: HttpClient, page: int, size: int, sort: string, searchFilter: string, since: string, inboxId: string, phoneId: string, before: string): (Option[PageWebhookProjection], Response) =
  ## List Webhooks Paginated
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("size", $size), # Optional page size for paginated result list.
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("searchFilter", $searchFilter), # Optional search filter
    ("since", $since), # Filter by created at after the given timestamp
    ("inboxId", $inboxId), # Filter by inboxId
    ("phoneId", $phoneId), # Filter by phoneId
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & "/webhooks/paginated" & "?" & query_for_api_call)
  constructResult[PageWebhookProjection](response)


proc getInboxWebhooksPaginated*(httpClient: HttpClient, inboxId: string, page: int, size: int, sort: string, searchFilter: string, since: string, before: string): (Option[PageWebhookProjection], Response) =
  ## Get paginated webhooks for an Inbox
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("searchFilter", $searchFilter), # Optional search filter
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/webhooks/paginated" & "?" & query_for_api_call)
  constructResult[PageWebhookProjection](response)


proc getJsonSchemaForWebhookEvent*(httpClient: HttpClient, event: string): (Option[JSONSchemaDto], Response) =
  ## 
  let query_for_api_call = encodeQuery([
    ("event", $event), # 
  ])

  let response = httpClient.post(basepath & "/webhooks/schema" & "?" & query_for_api_call)
  constructResult[JSONSchemaDto](response)


proc getJsonSchemaForWebhookPayload*(httpClient: HttpClient, webhookId: string): (Option[JSONSchemaDto], Response) =
  ## 

  let response = httpClient.post(basepath & fmt"/webhooks/{webhookId}/schema")
  constructResult[JSONSchemaDto](response)


proc getPhoneNumberWebhooksPaginated*(httpClient: HttpClient, phoneId: string, page: int, size: int, sort: string, since: string, before: string): (Option[PageWebhookProjection], Response) =
  ## Get paginated webhooks for a phone number
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & fmt"/phone/numbers/{phoneId}/webhooks/paginated" & "?" & query_for_api_call)
  constructResult[PageWebhookProjection](response)


proc getTestWebhookPayload*(httpClient: HttpClient, eventName: string): (Option[AbstractWebhookPayload], Response) =
  ## 
  let query_for_api_call = encodeQuery([
    ("eventName", $eventName), # 
  ])

  let response = httpClient.get(basepath & "/webhooks/test" & "?" & query_for_api_call)
  constructResult[AbstractWebhookPayload](response)


proc getTestWebhookPayloadBounce*(httpClient: HttpClient): (Option[WebhookBouncePayload], Response) =
  ## 

  let response = httpClient.get(basepath & "/webhooks/test/email-bounce-payload")
  constructResult[WebhookBouncePayload](response)


proc getTestWebhookPayloadBounceRecipient*(httpClient: HttpClient): (Option[WebhookBounceRecipientPayload], Response) =
  ## 

  let response = httpClient.get(basepath & "/webhooks/test/email-bounce-recipient-payload")
  constructResult[WebhookBounceRecipientPayload](response)


proc getTestWebhookPayloadEmailOpened*(httpClient: HttpClient): (Option[WebhookEmailOpenedPayload], Response) =
  ## 

  let response = httpClient.get(basepath & "/webhooks/test/email-opened-payload")
  constructResult[WebhookEmailOpenedPayload](response)


proc getTestWebhookPayloadEmailRead*(httpClient: HttpClient): (Option[WebhookEmailReadPayload], Response) =
  ## 

  let response = httpClient.get(basepath & "/webhooks/test/email-read-payload")
  constructResult[WebhookEmailReadPayload](response)


proc getTestWebhookPayloadForWebhook*(httpClient: HttpClient, webhookId: string): (Option[AbstractWebhookPayload], Response) =
  ## 

  let response = httpClient.post(basepath & fmt"/webhooks/{webhookId}/example")
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
  ## Get a webhook

  let response = httpClient.get(basepath & fmt"/webhooks/{webhookId}")
  constructResult[WebhookDto](response)


proc getWebhookResult*(httpClient: HttpClient, webhookResultId: string): (Option[WebhookResultDto], Response) =
  ## Get a webhook result for a webhook

  let response = httpClient.get(basepath & fmt"/webhooks/results/{webhookResultId}")
  constructResult[WebhookResultDto](response)


proc getWebhookResults*(httpClient: HttpClient, webhookId: string, page: int, size: int, sort: string, searchFilter: string, since: string, before: string, unseenOnly: bool): (Option[PageWebhookResult], Response) =
  ## Get a webhook results for a webhook
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("searchFilter", $searchFilter), # Optional search filter
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
    ("unseenOnly", $unseenOnly), # Filter for unseen exceptions only
  ])

  let response = httpClient.get(basepath & fmt"/webhooks/{webhookId}/results" & "?" & query_for_api_call)
  constructResult[PageWebhookResult](response)


proc getWebhookResultsUnseenErrorCount*(httpClient: HttpClient): (Option[UnseenErrorCountDto], Response) =
  ## Get count of unseen webhook results with error status

  let response = httpClient.get(basepath & "/webhooks/results/unseen-count")
  constructResult[UnseenErrorCountDto](response)


proc getWebhooks*(httpClient: HttpClient, inboxId: string): (Option[seq[WebhookDto]], Response) {.deprecated.} =
  ## Get all webhooks for an Inbox

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/webhooks")
  constructResult[seq[WebhookDto]](response)


proc redriveWebhookResult*(httpClient: HttpClient, webhookResultId: string): (Option[WebhookRedriveResult], Response) =
  ## Get a webhook result and try to resend the original webhook payload

  let response = httpClient.post(basepath & fmt"/webhooks/results/{webhookResultId}/redrive")
  constructResult[WebhookRedriveResult](response)


proc sendTestData*(httpClient: HttpClient, webhookId: string): (Option[WebhookTestResult], Response) =
  ## Send webhook test data

  let response = httpClient.post(basepath & fmt"/webhooks/{webhookId}/test")
  constructResult[WebhookTestResult](response)


proc updateWebhookHeaders*(httpClient: HttpClient, webhookId: string, WebhookHeaders: WebhookHeaders): (Option[WebhookDto], Response) =
  ## Update a webhook request headers
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.put(basepath & fmt"/webhooks/{webhookId}/headers", $(%WebhookHeaders))
  constructResult[WebhookDto](response)


proc verifyWebhookSignature*(httpClient: HttpClient, VerifyWebhookSignatureOptions: VerifyWebhookSignatureOptions): (Option[VerifyWebhookSignatureResults], Response) =
  ## Verify a webhook payload signature
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & "/webhooks/verify", $(%VerifyWebhookSignatureOptions))
  constructResult[VerifyWebhookSignatureResults](response)

