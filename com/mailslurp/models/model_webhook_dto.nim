#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://docs.mailslurp.com/) - [Examples](https://github.com/mailslurp/examples) repository
# The version of the OpenAPI document: 6.5.2
# Contact: contact@mailslurp.dev
# Generated by: https://openapi-generator.tech
#

import json
import tables


type `Method`* {.pure.} = enum
  GET
  HEAD
  POST
  PUT
  PATCH
  DELETE
  OPTIONS
  TRACE

type EventName* {.pure.} = enum
  EMAILRECEIVED
  NEWEMAIL
  NEWCONTACT
  NEWATTACHMENT
  EMAILOPENED
  EMAILREAD
  BOUNCE
  BOUNCERECIPIENT
  NEWSMS

type WebhookDto* = object
  ## Representation of a webhook for an inbox. The URL specified will be using by MailSlurp whenever an email is received by the attached inbox. A webhook entity should have a URL that points to your server. Your server should accept HTTP/S POST requests and return a success 200. MailSlurp will retry your webhooks if they fail. See https://api.mailslurp.com/schemas/webhook-payload for the payload schema.
  id*: string ## ID of the Webhook
  userId*: string ## User ID of the Webhook
  basicAuth*: bool ## Does webhook expect basic authentication? If true it means you created this webhook with a username and password. MailSlurp will use these in the URL to authenticate itself.
  name*: string ## Name of the webhook
  inboxId*: string ## The inbox that the Webhook will be triggered by. If null then webhook triggered at account level
  url*: string ## URL of your server that the webhook will be sent to. The schema of the JSON that is sent is described by the payloadJsonSchema.
  `method`*: `Method` ## HTTP method that your server endpoint must listen for
  payloadJsonSchema*: string ## Deprecated. Fetch JSON Schema for webhook using the getJsonSchemaForWebhookPayload method
  createdAt*: string ## When the webhook was created
  updatedAt*: string
  eventName*: EventName

func `%`*(v: `Method`): JsonNode =
  let str = case v:
    of `Method`.GET: "GET"
    of `Method`.HEAD: "HEAD"
    of `Method`.POST: "POST"
    of `Method`.PUT: "PUT"
    of `Method`.PATCH: "PATCH"
    of `Method`.DELETE: "DELETE"
    of `Method`.OPTIONS: "OPTIONS"
    of `Method`.TRACE: "TRACE"

  JsonNode(kind: JString, str: str)

func `$`*(v: `Method`): string =
  result = case v:
    of `Method`.GET: "GET"
    of `Method`.HEAD: "HEAD"
    of `Method`.POST: "POST"
    of `Method`.PUT: "PUT"
    of `Method`.PATCH: "PATCH"
    of `Method`.DELETE: "DELETE"
    of `Method`.OPTIONS: "OPTIONS"
    of `Method`.TRACE: "TRACE"

func `%`*(v: EventName): JsonNode =
  let str = case v:
    of EventName.EMAILRECEIVED: "EMAIL_RECEIVED"
    of EventName.NEWEMAIL: "NEW_EMAIL"
    of EventName.NEWCONTACT: "NEW_CONTACT"
    of EventName.NEWATTACHMENT: "NEW_ATTACHMENT"
    of EventName.EMAILOPENED: "EMAIL_OPENED"
    of EventName.EMAILREAD: "EMAIL_READ"
    of EventName.BOUNCE: "BOUNCE"
    of EventName.BOUNCERECIPIENT: "BOUNCE_RECIPIENT"
    of EventName.NEWSMS: "NEW_SMS"

  JsonNode(kind: JString, str: str)

func `$`*(v: EventName): string =
  result = case v:
    of EventName.EMAILRECEIVED: "EMAIL_RECEIVED"
    of EventName.NEWEMAIL: "NEW_EMAIL"
    of EventName.NEWCONTACT: "NEW_CONTACT"
    of EventName.NEWATTACHMENT: "NEW_ATTACHMENT"
    of EventName.EMAILOPENED: "EMAIL_OPENED"
    of EventName.EMAILREAD: "EMAIL_READ"
    of EventName.BOUNCE: "BOUNCE"
    of EventName.BOUNCERECIPIENT: "BOUNCE_RECIPIENT"
    of EventName.NEWSMS: "NEW_SMS"
