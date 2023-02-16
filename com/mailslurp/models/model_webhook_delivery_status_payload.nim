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
  DELIVERYSTATUS
  BOUNCE
  BOUNCERECIPIENT
  NEWSMS

type WebhookDeliveryStatusPayload* = object
  ## DELIVERY_STATUS webhook payload. Sent to your webhook url endpoint via HTTP POST when an email delivery status is created. This could be a successful delivery or a delivery failure.
  messageId*: string ## Idempotent message ID. Store this ID locally or in a database to prevent message duplication.
  webhookId*: string ## ID of webhook entity being triggered
  eventName*: EventName ## Name of the event type webhook is being triggered for.
  webhookName*: string ## Name of the webhook being triggered
  id*: string ## ID of delivery status
  userId*: string ## User ID of event
  sentId*: string ## ID of sent email
  remoteMtaIp*: string ## IP address of the remote Mail Transfer Agent
  inboxId*: string ## Id of the inbox
  reportingMta*: string ## Mail Transfer Agent reporting delivery status
  recipients*: seq[string] ## Recipients for delivery
  smtpResponse*: string ## SMTP server response message
  smtpStatusCode*: int ## SMTP server status
  processingTimeMillis*: int64 ## Time in milliseconds for delivery processing
  received*: string ## Time event was received
  subject*: string ## Email subject

func `%`*(v: EventName): JsonNode =
  let str = case v:
    of EventName.EMAILRECEIVED: "EMAIL_RECEIVED"
    of EventName.NEWEMAIL: "NEW_EMAIL"
    of EventName.NEWCONTACT: "NEW_CONTACT"
    of EventName.NEWATTACHMENT: "NEW_ATTACHMENT"
    of EventName.EMAILOPENED: "EMAIL_OPENED"
    of EventName.EMAILREAD: "EMAIL_READ"
    of EventName.DELIVERYSTATUS: "DELIVERY_STATUS"
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
    of EventName.DELIVERYSTATUS: "DELIVERY_STATUS"
    of EventName.BOUNCE: "BOUNCE"
    of EventName.BOUNCERECIPIENT: "BOUNCE_RECIPIENT"
    of EventName.NEWSMS: "NEW_SMS"
