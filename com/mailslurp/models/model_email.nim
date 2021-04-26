#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.   ## Resources - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository 
# The version of the OpenAPI document: 6.5.2
# 
# Generated by: https://openapi-generator.tech
#

import json
import tables

import model_email_analysis
import model_map

type Email* = object
  ## Email model (also referred to as EmailDto). Represents an email that was received by an inbox. If you want the original SMTP message see the `getRawEmail` endpoint.
  analysis*: EmailAnalysis
  attachments*: seq[string] ## List of IDs of attachments found in the email. Use these IDs with the Inbox and Email Controllers to download attachments and attachment meta data such as filesize, name, extension.
  bcc*: seq[string] ## List of `BCC` recipients email was addressed to
  body*: string ## The body of the email message
  bodyMD5Hash*: string ## A hash signature of the email message
  cc*: seq[string] ## List of `CC` recipients email was addressed to
  charset*: string ## Detected character set of the email body such as UTF-8
  createdAt*: string ## When was the email received by MailSlurp
  `from`*: string ## Who the email was sent from
  headers*: Table[string, string]
  id*: string ## ID of the email
  inboxId*: string ## ID of the inbox that received the email
  isHTML*: bool ## Was HTML sent in the email body
  read*: bool ## Has the email been viewed ever. This means viewed in the dashboard or requested via the full email entity endpoints
  replyTo*: string ## The replyTo field on the received email
  subject*: string ## The subject line of the email message
  teamAccess*: bool ## Can the email be accessed by organization team members
  to*: seq[string] ## List of `To` recipients email was addressed to
  updatedAt*: string ## When was the email last updated
  userId*: string ## ID of user that email belongs
