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

import model_map
import model_object

type SentEmailDto* = object
  ## Sent email details
  id*: string ## ID of sent email
  userId*: string ## User ID
  inboxId*: string ## Inbox ID email was sent from
  domainId*: string ## Domain ID
  to*: seq[string] ## Recipients email was sent to
  `from`*: string ## Sent from address
  replyTo*: string
  cc*: seq[string]
  bcc*: seq[string]
  attachments*: seq[string] ## Array of IDs of attachments that were sent with this email
  subject*: string
  bodyMD5Hash*: string ## MD5 Hash
  body*: string ## Sent email body
  toContacts*: seq[string]
  toGroup*: string
  charset*: string
  isHTML*: bool
  sentAt*: string
  pixelIds*: seq[string]
  messageId*: string
  messageIds*: seq[string]
  virtualSend*: bool
  templateId*: string
  templateVariables*: Table[string, object]
  headers*: Table[string, string]
  html*: bool
