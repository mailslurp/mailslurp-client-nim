#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository 
# The version of the OpenAPI document: 6.5.2
# 
# Generated by: https://openapi-generator.tech
#

import json
import tables


type HttpMethod* {.pure.} = enum
  GET
  HEAD
  POST
  PUT
  PATCH
  DELETE
  OPTIONS
  TRACE

type WebhookEvent* {.pure.} = enum
  EMAILRECEIVED
  NEWEMAIL
  NEWCONTACT
  NEWATTACHMENT

type WebhookResultEntity* = object
  ## 
  createdAt*: string
  httpMethod*: HttpMethod
  id*: string
  inboxId*: string
  messageId*: string
  responseBodyExtract*: string
  responseStatus*: int
  responseTimeMillis*: int64
  updatedAt*: string
  userId*: string
  webhookEvent*: WebhookEvent
  webhookId*: string
  webhookUrl*: string

func `%`*(v: HttpMethod): JsonNode =
  let str = case v:
    of HttpMethod.GET: "GET"
    of HttpMethod.HEAD: "HEAD"
    of HttpMethod.POST: "POST"
    of HttpMethod.PUT: "PUT"
    of HttpMethod.PATCH: "PATCH"
    of HttpMethod.DELETE: "DELETE"
    of HttpMethod.OPTIONS: "OPTIONS"
    of HttpMethod.TRACE: "TRACE"

  JsonNode(kind: JString, str: str)

func `$`*(v: HttpMethod): string =
  result = case v:
    of HttpMethod.GET: "GET"
    of HttpMethod.HEAD: "HEAD"
    of HttpMethod.POST: "POST"
    of HttpMethod.PUT: "PUT"
    of HttpMethod.PATCH: "PATCH"
    of HttpMethod.DELETE: "DELETE"
    of HttpMethod.OPTIONS: "OPTIONS"
    of HttpMethod.TRACE: "TRACE"

func `%`*(v: WebhookEvent): JsonNode =
  let str = case v:
    of WebhookEvent.EMAILRECEIVED: "EMAIL_RECEIVED"
    of WebhookEvent.NEWEMAIL: "NEW_EMAIL"
    of WebhookEvent.NEWCONTACT: "NEW_CONTACT"
    of WebhookEvent.NEWATTACHMENT: "NEW_ATTACHMENT"

  JsonNode(kind: JString, str: str)

func `$`*(v: WebhookEvent): string =
  result = case v:
    of WebhookEvent.EMAILRECEIVED: "EMAIL_RECEIVED"
    of WebhookEvent.NEWEMAIL: "NEW_EMAIL"
    of WebhookEvent.NEWCONTACT: "NEW_CONTACT"
    of WebhookEvent.NEWATTACHMENT: "NEW_ATTACHMENT"
