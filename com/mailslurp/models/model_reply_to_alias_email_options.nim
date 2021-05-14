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

import model_object

type SendStrategy* {.pure.} = enum
  SINGLEMESSAGE

type ReplyToAliasEmailOptions* = object
  ## Options for replying to an alias email using the alias inbox
  attachments*: seq[string] ## List of uploaded attachments to send with the reply. Optional.
  body*: string ## Body of the reply email you want to send
  charset*: string ## The charset that your message should be sent with. Optional. Default is UTF-8
  isHTML*: bool ## Is the reply HTML
  sendStrategy*: SendStrategy ## When to send the email. Typically immediately
  `template`*: string ## Template ID to use instead of body. Will use template variable map to fill defined variable slots.
  templateVariables*: object ## Template variables if using a template

func `%`*(v: SendStrategy): JsonNode =
  let str = case v:
    of SendStrategy.SINGLEMESSAGE: "SINGLE_MESSAGE"

  JsonNode(kind: JString, str: str)

func `$`*(v: SendStrategy): string =
  result = case v:
    of SendStrategy.SINGLEMESSAGE: "SINGLE_MESSAGE"
