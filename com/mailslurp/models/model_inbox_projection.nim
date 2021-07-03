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


type InboxType* {.pure.} = enum
  HTTPINBOX
  SMTPINBOX

type InboxProjection* = object
  ## 
  createdAt*: string
  emailAddress*: string
  favourite*: bool
  id*: string
  inboxType*: InboxType
  name*: string
  tags*: seq[string]
  teamAccess*: bool

func `%`*(v: InboxType): JsonNode =
  let str = case v:
    of InboxType.HTTPINBOX: "HTTP_INBOX"
    of InboxType.SMTPINBOX: "SMTP_INBOX"

  JsonNode(kind: JString, str: str)

func `$`*(v: InboxType): string =
  result = case v:
    of InboxType.HTTPINBOX: "HTTP_INBOX"
    of InboxType.SMTPINBOX: "SMTP_INBOX"
