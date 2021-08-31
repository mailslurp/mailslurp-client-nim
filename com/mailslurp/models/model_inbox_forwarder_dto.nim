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


type Field* {.pure.} = enum
  RECIPIENTS
  SENDER
  SUBJECT
  ATTACHMENTS

type InboxForwarderDto* = object
  ## 
  createdAt*: string
  field*: Field
  forwardToRecipients*: seq[string]
  id*: string
  inboxId*: string
  match*: string

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
