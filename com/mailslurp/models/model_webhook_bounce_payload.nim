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

type WebhookBouncePayload* = object
  ## BOUNCE webhook payload. Sent to your webhook url endpoint via HTTP POST when an email bounced or was rejected by a recipient. Save the recipients to a ban list on your server and avoid emailing them again. It is recommended you also listen to the BOUNCE_RECIPIENT payload.
  messageId*: string ## Idempotent message ID. Store this ID locally or in a database to prevent message duplication.
  webhookId*: string ## ID of webhook entity being triggered
  eventName*: EventName ## Name of the event type webhook is being triggered for.
  webhookName*: string ## Name of the webhook being triggered
  bounceId*: string ## ID of the bounce email record. Use the ID with the bounce controller to view more information
  sentToRecipients*: seq[string]
  sender*: string
  bounceRecipients*: seq[string] ## Email addresses that resulted in a bounce or email being rejected. Please save these recipients and avoid emailing them in the future to maintain your reputation.

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
