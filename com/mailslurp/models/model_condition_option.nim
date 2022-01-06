#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository
# The version of the OpenAPI document: 6.5.2
# Contact: contact@mailslurp.dev
# Generated by: https://openapi-generator.tech
#

import json
import tables


type Condition* {.pure.} = enum
  HASATTACHMENTS

type Value* {.pure.} = enum
  TRUE
  FALSE

type ConditionOption* = object
  ## Options for matching emails in an inbox based on a condition such as `HAS_ATTACHMENTS=TRUE`
  condition*: Condition ## Condition of an email object that can be used to filter results
  value*: Value ## Expected condition value

func `%`*(v: Condition): JsonNode =
  let str = case v:
    of Condition.HASATTACHMENTS: "HAS_ATTACHMENTS"

  JsonNode(kind: JString, str: str)

func `$`*(v: Condition): string =
  result = case v:
    of Condition.HASATTACHMENTS: "HAS_ATTACHMENTS"

func `%`*(v: Value): JsonNode =
  let str = case v:
    of Value.TRUE: "TRUE"
    of Value.FALSE: "FALSE"

  JsonNode(kind: JString, str: str)

func `$`*(v: Value): string =
  result = case v:
    of Value.TRUE: "TRUE"
    of Value.FALSE: "FALSE"
