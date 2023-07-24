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
  SUBMITTED
  COMPLETED
  FAILED
  CANCELLED

type ScheduledJob* = object
  ## 
  id*: string
  userId*: string
  inboxId*: string
  jobId*: string
  groupId*: string
  triggerId*: string
  status*: Status
  sendAtTimestamp*: string
  createdAt*: string
  updatedAt*: string

func `%`*(v: Status): JsonNode =
  let str = case v:
    of Status.SUBMITTED: "SUBMITTED"
    of Status.COMPLETED: "COMPLETED"
    of Status.FAILED: "FAILED"
    of Status.CANCELLED: "CANCELLED"

  JsonNode(kind: JString, str: str)

func `$`*(v: Status): string =
  result = case v:
    of Status.SUBMITTED: "SUBMITTED"
    of Status.COMPLETED: "COMPLETED"
    of Status.FAILED: "FAILED"
    of Status.CANCELLED: "CANCELLED"
