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


type Version* {.pure.} = enum
  TLSRPTv1

type GenerateTlsReportingRecordOptions* = object
  ## 
  reportingAddresses*: seq[string]
  reportingUrl*: string
  host*: string
  version*: Version
  ttl*: int

func `%`*(v: Version): JsonNode =
  let str = case v:
    of Version.TLSRPTv1: "TLSRPTv1"

  JsonNode(kind: JString, str: str)

func `$`*(v: Version): string =
  result = case v:
    of Version.TLSRPTv1: "TLSRPTv1"
