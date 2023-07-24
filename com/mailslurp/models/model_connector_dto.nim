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


type ConnectorType* {.pure.} = enum
  IMAP

type ConnectorAuthType* {.pure.} = enum
  PLAINTEXT

type SyncScheduleType* {.pure.} = enum
  INTERVAL

type ConnectorDto* = object
  ## 
  id*: string
  userId*: string
  connectorType*: ConnectorType
  connectorAuthType*: ConnectorAuthType
  syncEnabled*: bool
  syncScheduleType*: SyncScheduleType
  syncInterval*: int
  imapHost*: string
  imapPort*: int
  imapUsername*: string
  imapPassword*: string
  imapSsl*: bool
  createdAt*: string

func `%`*(v: ConnectorType): JsonNode =
  let str = case v:
    of ConnectorType.IMAP: "IMAP"

  JsonNode(kind: JString, str: str)

func `$`*(v: ConnectorType): string =
  result = case v:
    of ConnectorType.IMAP: "IMAP"

func `%`*(v: ConnectorAuthType): JsonNode =
  let str = case v:
    of ConnectorAuthType.PLAINTEXT: "PLAIN_TEXT"

  JsonNode(kind: JString, str: str)

func `$`*(v: ConnectorAuthType): string =
  result = case v:
    of ConnectorAuthType.PLAINTEXT: "PLAIN_TEXT"

func `%`*(v: SyncScheduleType): JsonNode =
  let str = case v:
    of SyncScheduleType.INTERVAL: "INTERVAL"

  JsonNode(kind: JString, str: str)

func `$`*(v: SyncScheduleType): string =
  result = case v:
    of SyncScheduleType.INTERVAL: "INTERVAL"
