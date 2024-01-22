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


type HttpMethod* {.pure.} = enum
  POST
  DELETE
  GET
  PUT
  PATCH
  HEAD
  OPTIONS
  TRACE

type WebhookEvent* {.pure.} = enum
  EMAILRECEIVED
  NEWEMAIL
  NEWCONTACT
  NEWATTACHMENT
  EMAILOPENED
  EMAILREAD
  DELIVERYSTATUS
  BOUNCE
  BOUNCERECIPIENT
  NEWSMS

type ResultType* {.pure.} = enum
  BADRESPONSE
  EXCEPTION
  SUCCESS

type WebhookResultDto* = object
  ## Result of a webhook notification
  id*: string
  userId*: string
  inboxId*: string
  webhookId*: string
  webhookUrl*: string
  messageId*: string
  redriveId*: string
  httpMethod*: HttpMethod
  webhookEvent*: WebhookEvent
  responseStatus*: int
  responseTimeMillis*: int64
  responseBodyExtract*: string
  resultType*: ResultType
  createdAt*: string
  updatedAt*: string
  seen*: bool

func `%`*(v: HttpMethod): JsonNode =
  let str = case v:
    of HttpMethod.POST: "POST"
    of HttpMethod.DELETE: "DELETE"
    of HttpMethod.GET: "GET"
    of HttpMethod.PUT: "PUT"
    of HttpMethod.PATCH: "PATCH"
    of HttpMethod.HEAD: "HEAD"
    of HttpMethod.OPTIONS: "OPTIONS"
    of HttpMethod.TRACE: "TRACE"

  JsonNode(kind: JString, str: str)

func `$`*(v: HttpMethod): string =
  result = case v:
    of HttpMethod.POST: "POST"
    of HttpMethod.DELETE: "DELETE"
    of HttpMethod.GET: "GET"
    of HttpMethod.PUT: "PUT"
    of HttpMethod.PATCH: "PATCH"
    of HttpMethod.HEAD: "HEAD"
    of HttpMethod.OPTIONS: "OPTIONS"
    of HttpMethod.TRACE: "TRACE"

func `%`*(v: WebhookEvent): JsonNode =
  let str = case v:
    of WebhookEvent.EMAILRECEIVED: "EMAIL_RECEIVED"
    of WebhookEvent.NEWEMAIL: "NEW_EMAIL"
    of WebhookEvent.NEWCONTACT: "NEW_CONTACT"
    of WebhookEvent.NEWATTACHMENT: "NEW_ATTACHMENT"
    of WebhookEvent.EMAILOPENED: "EMAIL_OPENED"
    of WebhookEvent.EMAILREAD: "EMAIL_READ"
    of WebhookEvent.DELIVERYSTATUS: "DELIVERY_STATUS"
    of WebhookEvent.BOUNCE: "BOUNCE"
    of WebhookEvent.BOUNCERECIPIENT: "BOUNCE_RECIPIENT"
    of WebhookEvent.NEWSMS: "NEW_SMS"

  JsonNode(kind: JString, str: str)

func `$`*(v: WebhookEvent): string =
  result = case v:
    of WebhookEvent.EMAILRECEIVED: "EMAIL_RECEIVED"
    of WebhookEvent.NEWEMAIL: "NEW_EMAIL"
    of WebhookEvent.NEWCONTACT: "NEW_CONTACT"
    of WebhookEvent.NEWATTACHMENT: "NEW_ATTACHMENT"
    of WebhookEvent.EMAILOPENED: "EMAIL_OPENED"
    of WebhookEvent.EMAILREAD: "EMAIL_READ"
    of WebhookEvent.DELIVERYSTATUS: "DELIVERY_STATUS"
    of WebhookEvent.BOUNCE: "BOUNCE"
    of WebhookEvent.BOUNCERECIPIENT: "BOUNCE_RECIPIENT"
    of WebhookEvent.NEWSMS: "NEW_SMS"

func `%`*(v: ResultType): JsonNode =
  let str = case v:
    of ResultType.BADRESPONSE: "BAD_RESPONSE"
    of ResultType.EXCEPTION: "EXCEPTION"
    of ResultType.SUCCESS: "SUCCESS"

  JsonNode(kind: JString, str: str)

func `$`*(v: ResultType): string =
  result = case v:
    of ResultType.BADRESPONSE: "BAD_RESPONSE"
    of ResultType.EXCEPTION: "EXCEPTION"
    of ResultType.SUCCESS: "SUCCESS"
