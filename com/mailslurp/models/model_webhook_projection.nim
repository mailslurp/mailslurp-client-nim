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


type EventName* {.pure.} = enum
  EMAILRECEIVED
  NEWEMAIL
  NEWCONTACT
  NEWATTACHMENT
  EMAILOPENED
  EMAILREAD

type WebhookProjection* = object
  ## Representation of a webhook
  createdAt*: string
  eventName*: EventName
  id*: string
  inboxId*: string
  name*: string
  updatedAt*: string
  url*: string

func `%`*(v: EventName): JsonNode =
  let str = case v:
    of EventName.EMAILRECEIVED: "EMAIL_RECEIVED"
    of EventName.NEWEMAIL: "NEW_EMAIL"
    of EventName.NEWCONTACT: "NEW_CONTACT"
    of EventName.NEWATTACHMENT: "NEW_ATTACHMENT"
    of EventName.EMAILOPENED: "EMAIL_OPENED"
    of EventName.EMAILREAD: "EMAIL_READ"

  JsonNode(kind: JString, str: str)

func `$`*(v: EventName): string =
  result = case v:
    of EventName.EMAILRECEIVED: "EMAIL_RECEIVED"
    of EventName.NEWEMAIL: "NEW_EMAIL"
    of EventName.NEWCONTACT: "NEW_CONTACT"
    of EventName.NEWATTACHMENT: "NEW_ATTACHMENT"
    of EventName.EMAILOPENED: "EMAIL_OPENED"
    of EventName.EMAILREAD: "EMAIL_READ"
