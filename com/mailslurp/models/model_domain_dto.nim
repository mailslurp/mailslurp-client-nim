#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository
# The version of the OpenAPI document: 6.5.2
# Contact: contact@mailslurp.dev
# Generated by: https://openapi-generator.tech
#

import json
import tables

import model_domain_name_record

type DomainType* {.pure.} = enum
  HTTPINBOX
  SMTPDOMAIN

type DomainDto* = object
  ## Domain plus verification records and status
  id*: string
  userId*: string
  domain*: string ## Custom domain name
  verificationToken*: string ## Verification tokens
  dkimTokens*: seq[string] ## Unique token DKIM tokens
  domainNameRecords*: seq[DomainNameRecord] ## List of DNS domain name records (C, MX, TXT) etc that you must add to the DNS server associated with your domain provider.
  catchAllInboxId*: string ## The optional catch all inbox that will receive emails sent to the domain that cannot be matched.
  createdAt*: string
  updatedAt*: string
  domainType*: DomainType ## Type of domain. Dictates type of inbox that can be created with domain. HTTP means inboxes are processed using SES while SMTP inboxes use a custom SMTP mail server. SMTP does not support sending so use HTTP for sending emails.
  verified*: bool

func `%`*(v: DomainType): JsonNode =
  let str = case v:
    of DomainType.HTTPINBOX: "HTTP_INBOX"
    of DomainType.SMTPDOMAIN: "SMTP_DOMAIN"

  JsonNode(kind: JString, str: str)

func `$`*(v: DomainType): string =
  result = case v:
    of DomainType.HTTPINBOX: "HTTP_INBOX"
    of DomainType.SMTPDOMAIN: "SMTP_DOMAIN"
