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

type SendStrategy* {.pure.} = enum
  SINGLEMESSAGE

type ReplyToEmailOptions* = object
  ## Options for replying to email with API
  body*: string ## Body of the reply email you want to send
  isHTML*: bool ## Is the reply HTML
  `from`*: string ## The from header that should be used. Optional
  replyTo*: string ## The replyTo header that should be used. Optional
  customHeaders*: Table[string, string] ## Optional custom headers
  charset*: string ## The charset that your message should be sent with. Optional. Default is UTF-8
  attachments*: seq[string] ## List of uploaded attachments to send with the reply. Optional.
  templateVariables*: Table[string, object] ## Template variables if using a template
  `template`*: string ## Template ID to use instead of body. Will use template variable map to fill defined variable slots.
  sendStrategy*: SendStrategy ## How an email should be sent based on its recipients
  useInboxName*: bool ## Optionally use inbox name as display name for sender email address
  html*: bool

func `%`*(v: SendStrategy): JsonNode =
  let str = case v:
    of SendStrategy.SINGLEMESSAGE: "SINGLE_MESSAGE"

  JsonNode(kind: JString, str: str)

func `$`*(v: SendStrategy): string =
  result = case v:
    of SendStrategy.SINGLEMESSAGE: "SINGLE_MESSAGE"
