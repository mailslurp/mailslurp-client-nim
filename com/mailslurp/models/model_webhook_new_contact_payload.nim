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

import model_object

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

type WebhookNewContactPayload* = object
  ## NEW_CONTACT webhook payload. Sent to your webhook url endpoint via HTTP POST when an email is received by the inbox that your webhook is attached to that contains a recipient that has not been saved as a contact.
  messageId*: string ## Idempotent message ID. Store this ID locally or in a database to prevent message duplication.
  webhookId*: string ## ID of webhook entity being triggered
  webhookName*: string ## Name of the webhook being triggered
  eventName*: EventName ## Name of the event type webhook is being triggered for.
  contactId*: string
  groupId*: string
  firstName*: string
  lastName*: string
  company*: string
  primaryEmailAddress*: string
  emailAddresses*: seq[string]
  tags*: seq[string]
  metaData*: object
  optOut*: bool
  createdAt*: string

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
