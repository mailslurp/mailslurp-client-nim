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


type EmailProjection* = object
  ## A compact representation of a full email. Used in list endpoints to keep response sizes low. Body and attachments are not included. To get all fields of the email use the `getEmail` method with the email projection's ID. See `EmailDto` for documentation on projection properties.
  id*: string
  `from`*: string
  subject*: string
  inboxId*: string
  createdAt*: string
  attachments*: seq[string]
  to*: seq[string]
  bcc*: seq[string]
  cc*: seq[string]
  domainId*: string
  bodyMD5Hash*: string
  read*: bool
  bodyExcerpt*: string
  teamAccess*: bool
