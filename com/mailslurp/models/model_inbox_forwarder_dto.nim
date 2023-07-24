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


type Field* {.pure.} = enum
  RECIPIENTS
  SENDER
  SUBJECT
  ATTACHMENTS

type InboxForwarderDto* = object
  ## Inbox forwarder. Describes how an inbox will forward matching emails to designated recipients.
  id*: string
  inboxId*: string
  name*: string ## Name of inbox forwarder
  field*: Field ## Which field to match against
  match*: string ## Wild-card type pattern to apply to field
  forwardToRecipients*: seq[string] ## Who to send forwarded email to
  createdAt*: string

func `%`*(v: Field): JsonNode =
  let str = case v:
    of Field.RECIPIENTS: "RECIPIENTS"
    of Field.SENDER: "SENDER"
    of Field.SUBJECT: "SUBJECT"
    of Field.ATTACHMENTS: "ATTACHMENTS"

  JsonNode(kind: JString, str: str)

func `$`*(v: Field): string =
  result = case v:
    of Field.RECIPIENTS: "RECIPIENTS"
    of Field.SENDER: "SENDER"
    of Field.SUBJECT: "SUBJECT"
    of Field.ATTACHMENTS: "ATTACHMENTS"
