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


type Status* {.pure.} = enum
  SUCCESS
  FAILURE

type InboxForwarderEventProjection* = object
  ## Inbox forwarder event
  message*: string
  id*: string
  status*: Status
  forwarderId*: string
  emailId*: string
  inboxId*: string
  userId*: string
  createdAt*: string

func `%`*(v: Status): JsonNode =
  let str = case v:
    of Status.SUCCESS: "SUCCESS"
    of Status.FAILURE: "FAILURE"

  JsonNode(kind: JString, str: str)

func `$`*(v: Status): string =
  result = case v:
    of Status.SUCCESS: "SUCCESS"
    of Status.FAILURE: "FAILURE"
