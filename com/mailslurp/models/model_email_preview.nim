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


type EmailPreview* = object
  ## Preview of an email message. For full message (including body and attachments) call the `getEmail` or other email endpoints with the provided email ID.
  attachments*: seq[string] ## List of IDs of attachments found in the email. Use these IDs with the Inbox and Email Controllers to download attachments and attachment meta data such as filesize, name, extension.
  bcc*: seq[string] ## List of `BCC` recipients email was addressed to
  cc*: seq[string] ## List of `CC` recipients email was addressed to
  createdAt*: string ## When was the email received by MailSlurp
  `from`*: string ## Who the email was sent from
  id*: string ## ID of the email entity
  read*: bool ## Read flag. Has the email ever been viewed in the dashboard or fetched via the API? If so the email is marked as read.
  subject*: string ## The subject line of the email message
  to*: seq[string] ## List of `To` recipients that email was addressed to
