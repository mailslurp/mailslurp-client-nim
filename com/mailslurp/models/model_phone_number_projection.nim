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


type PhoneCountry* {.pure.} = enum
  US
  GB
  AU

type PhoneNumberProjection* = object
  ## Phone number projection
  userId*: string
  createdAt*: string
  phoneNumber*: string
  phoneCountry*: PhoneCountry
  id*: string

func `%`*(v: PhoneCountry): JsonNode =
  let str = case v:
    of PhoneCountry.US: "US"
    of PhoneCountry.GB: "GB"
    of PhoneCountry.AU: "AU"

  JsonNode(kind: JString, str: str)

func `$`*(v: PhoneCountry): string =
  result = case v:
    of PhoneCountry.US: "US"
    of PhoneCountry.GB: "GB"
    of PhoneCountry.AU: "AU"
