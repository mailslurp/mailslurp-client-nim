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


type DomainType* {.pure.} = enum
  HTTPINBOX
  SMTPDOMAIN

type DomainPreview* = object
  ## Preview object for domain entity
  id*: string
  domain*: string
  catchAllInboxId*: string
  createdAt*: string
  domainType*: DomainType ## Type of domain. Dictates type of inbox that can be created with domain. HTTP means inboxes are processed using SES while SMTP inboxes use a custom SMTP mail server. SMTP does not support sending so use HTTP for sending emails.
  isVerified*: bool
  hasMissingRecords*: bool

func `%`*(v: DomainType): JsonNode =
  let str = case v:
    of DomainType.HTTPINBOX: "HTTP_INBOX"
    of DomainType.SMTPDOMAIN: "SMTP_DOMAIN"

  JsonNode(kind: JString, str: str)

func `$`*(v: DomainType): string =
  result = case v:
    of DomainType.HTTPINBOX: "HTTP_INBOX"
    of DomainType.SMTPDOMAIN: "SMTP_DOMAIN"
