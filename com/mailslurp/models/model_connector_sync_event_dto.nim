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


type SyncStatus* {.pure.} = enum
  SUCCESS
  INTERNALERROR
  SUBSCRIPTIONERROR
  CONNECTIONERROR
  NOTFOUND

type ConnectorSyncEventDto* = object
  ## 
  id*: string
  connectorId*: string
  syncStatus*: SyncStatus
  syncCount*: int64
  message*: string
  createdAt*: string

func `%`*(v: SyncStatus): JsonNode =
  let str = case v:
    of SyncStatus.SUCCESS: "SUCCESS"
    of SyncStatus.INTERNALERROR: "INTERNAL_ERROR"
    of SyncStatus.SUBSCRIPTIONERROR: "SUBSCRIPTION_ERROR"
    of SyncStatus.CONNECTIONERROR: "CONNECTION_ERROR"
    of SyncStatus.NOTFOUND: "NOT_FOUND"

  JsonNode(kind: JString, str: str)

func `$`*(v: SyncStatus): string =
  result = case v:
    of SyncStatus.SUCCESS: "SUCCESS"
    of SyncStatus.INTERNALERROR: "INTERNAL_ERROR"
    of SyncStatus.SUBSCRIPTIONERROR: "SUBSCRIPTION_ERROR"
    of SyncStatus.CONNECTIONERROR: "CONNECTION_ERROR"
    of SyncStatus.NOTFOUND: "NOT_FOUND"
