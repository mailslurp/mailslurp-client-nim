#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.   ## Resources - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository 
# The version of the OpenAPI document: 6.5.2
# 
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

type WebhookDto* = object
  ## Representation of a webhook for an inbox. The URL specified will be using by MailSlurp whenever an email is received by the attached inbox.
  basicAuth*: bool ## Does webhook expect basic authentication? If true it means you created this webhook with a username and password. MailSlurp will use these in the URL to authenticate itself.
  createdAt*: string ## When the webhook was created
  id*: string ## ID of the Webhook
  inboxId*: string ## The inbox that the Webhook will be triggered by
  `method`*: `Method` ## HTTP method that your server endpoint must listen for
  name*: string ## Name of the webhook
  payloadJsonSchema*: string ## JSON Schema for the payload that will be sent to your URL via the HTTP method described.
  updatedAt*: string
  url*: string ## URL of your server that the webhook will be sent to. The schema of the JSON that is sent is described by the payloadJsonSchema.

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
