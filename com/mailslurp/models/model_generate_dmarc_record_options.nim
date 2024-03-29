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
  DMARC1

type Policy* {.pure.} = enum
  NONE
  QUARANTINE
  REJECT

type SubdomainPolicy* {.pure.} = enum
  NONE
  QUARANTINE
  REJECT

type ReportFormat* {.pure.} = enum
  AFRF

type Adkim* {.pure.} = enum
  STRICT
  RELAXED

type Aspf* {.pure.} = enum
  STRICT
  RELAXED

type Fo* {.pure.} = enum
  `0`
  `1`
  D
  S

type GenerateDmarcRecordOptions* = object
  ## 
  domain*: string
  version*: Version
  policy*: Policy
  subdomainPolicy*: SubdomainPolicy
  reportEmailAddress*: seq[string]
  forensicEmailAddress*: seq[string]
  percentage*: int
  reportFormat*: ReportFormat
  secondsBetweenReports*: int
  adkim*: Adkim
  aspf*: Aspf
  fo*: Fo

func `%`*(v: Version): JsonNode =
  let str = case v:
    of Version.DMARC1: "DMARC1"

  JsonNode(kind: JString, str: str)

func `$`*(v: Version): string =
  result = case v:
    of Version.DMARC1: "DMARC1"

func `%`*(v: Policy): JsonNode =
  let str = case v:
    of Policy.NONE: "NONE"
    of Policy.QUARANTINE: "QUARANTINE"
    of Policy.REJECT: "REJECT"

  JsonNode(kind: JString, str: str)

func `$`*(v: Policy): string =
  result = case v:
    of Policy.NONE: "NONE"
    of Policy.QUARANTINE: "QUARANTINE"
    of Policy.REJECT: "REJECT"

func `%`*(v: SubdomainPolicy): JsonNode =
  let str = case v:
    of SubdomainPolicy.NONE: "NONE"
    of SubdomainPolicy.QUARANTINE: "QUARANTINE"
    of SubdomainPolicy.REJECT: "REJECT"

  JsonNode(kind: JString, str: str)

func `$`*(v: SubdomainPolicy): string =
  result = case v:
    of SubdomainPolicy.NONE: "NONE"
    of SubdomainPolicy.QUARANTINE: "QUARANTINE"
    of SubdomainPolicy.REJECT: "REJECT"

func `%`*(v: ReportFormat): JsonNode =
  let str = case v:
    of ReportFormat.AFRF: "AFRF"

  JsonNode(kind: JString, str: str)

func `$`*(v: ReportFormat): string =
  result = case v:
    of ReportFormat.AFRF: "AFRF"

func `%`*(v: Adkim): JsonNode =
  let str = case v:
    of Adkim.STRICT: "STRICT"
    of Adkim.RELAXED: "RELAXED"

  JsonNode(kind: JString, str: str)

func `$`*(v: Adkim): string =
  result = case v:
    of Adkim.STRICT: "STRICT"
    of Adkim.RELAXED: "RELAXED"

func `%`*(v: Aspf): JsonNode =
  let str = case v:
    of Aspf.STRICT: "STRICT"
    of Aspf.RELAXED: "RELAXED"

  JsonNode(kind: JString, str: str)

func `$`*(v: Aspf): string =
  result = case v:
    of Aspf.STRICT: "STRICT"
    of Aspf.RELAXED: "RELAXED"

func `%`*(v: Fo): JsonNode =
  let str = case v:
    of Fo.`0`: "FO_0"
    of Fo.`1`: "FO_1"
    of Fo.D: "FO_D"
    of Fo.S: "FO_S"

  JsonNode(kind: JString, str: str)

func `$`*(v: Fo): string =
  result = case v:
    of Fo.`0`: "FO_0"
    of Fo.`1`: "FO_1"
    of Fo.D: "FO_D"
    of Fo.S: "FO_S"
