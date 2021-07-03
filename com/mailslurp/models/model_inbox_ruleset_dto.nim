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


type Action* {.pure.} = enum
  BLOCK
  ALLOW
  FILTERREMOVE

type Handler* {.pure.} = enum
  EXCEPTION

type Scope* {.pure.} = enum
  RECEIVINGEMAILS
  SENDINGEMAILS

type InboxRulesetDto* = object
  ## 
  action*: Action
  createdAt*: string
  handler*: Handler
  id*: string
  inboxId*: string
  scope*: Scope
  target*: string

func `%`*(v: Action): JsonNode =
  let str = case v:
    of Action.BLOCK: "BLOCK"
    of Action.ALLOW: "ALLOW"
    of Action.FILTERREMOVE: "FILTER_REMOVE"

  JsonNode(kind: JString, str: str)

func `$`*(v: Action): string =
  result = case v:
    of Action.BLOCK: "BLOCK"
    of Action.ALLOW: "ALLOW"
    of Action.FILTERREMOVE: "FILTER_REMOVE"

func `%`*(v: Handler): JsonNode =
  let str = case v:
    of Handler.EXCEPTION: "EXCEPTION"

  JsonNode(kind: JString, str: str)

func `$`*(v: Handler): string =
  result = case v:
    of Handler.EXCEPTION: "EXCEPTION"

func `%`*(v: Scope): JsonNode =
  let str = case v:
    of Scope.RECEIVINGEMAILS: "RECEIVING_EMAILS"
    of Scope.SENDINGEMAILS: "SENDING_EMAILS"

  JsonNode(kind: JString, str: str)

func `$`*(v: Scope): string =
  result = case v:
    of Scope.RECEIVINGEMAILS: "RECEIVING_EMAILS"
    of Scope.SENDINGEMAILS: "SENDING_EMAILS"