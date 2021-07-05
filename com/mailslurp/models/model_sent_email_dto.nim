#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository 
# The version of the OpenAPI document: 6.5.2
# 
# Generated by: https://openapi-generator.tech
#

import json
import tables


type SentEmailDto* = object
  ## Sent email details
  attachments*: seq[string] ## Array of IDs of attachments that were sent with this email
  bcc*: seq[string]
  body*: string
  bodyMD5Hash*: string ## MD5 Hash
  cc*: seq[string]
  charset*: string
  `from`*: string
  id*: string ## ID of sent email
  inboxId*: string ## Inbox ID email was sent from
  isHTML*: bool
  pixelIds*: seq[string]
  replyTo*: string
  sentAt*: string
  subject*: string
  to*: seq[string] ## Recipients email was sent to
  userId*: string ## User ID
