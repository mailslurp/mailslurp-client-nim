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

type EmergencyAddressDto* = object
  ## 
  id*: string
  address1*: string
  phoneCountry*: PhoneCountry

func `%`*(v: PhoneCountry): JsonNode =
  let str = case v:
    of PhoneCountry.US: "US"
    of PhoneCountry.GB: "GB"

  JsonNode(kind: JString, str: str)

func `$`*(v: PhoneCountry): string =
  result = case v:
    of PhoneCountry.US: "US"
    of PhoneCountry.GB: "GB"
