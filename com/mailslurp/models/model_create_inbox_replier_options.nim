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

import model_map
import model_object

type Field* {.pure.} = enum
  RECIPIENTS
  SENDER
  SUBJECT
  ATTACHMENTS

type CreateInboxReplierOptions* = object
  ## Options for creating an inbox replier. Repliers can be attached to inboxes and send automated responses when an inbound email matches given criteria.
  inboxId*: string ## Inbox ID to attach replier to
  name*: string ## Name for replier
  field*: Field ## Field to match against to trigger inbox replier for inbound email
  match*: string ## String or wildcard style match for field specified when evaluating reply rules. Use `*` to match anything.
  replyTo*: string ## Reply-to email address when sending replying
  subject*: string ## Subject override when replying to email
  `from`*: string ## Send email from address
  charset*: string ## Email reply charset
  ignoreReplyTo*: bool ## Ignore sender replyTo when responding. Send directly to the sender if enabled.
  isHTML*: bool ## Send HTML email
  body*: string ## Email body for reply
  templateId*: string ## ID of template to use when sending a reply
  templateVariables*: Table[string, object] ## Template variable values

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