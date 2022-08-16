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


type EmailPreview* = object
  ## Preview of an email message. For full message (including body and attachments) call the `getEmail` or other email endpoints with the provided email ID.
  id*: string ## ID of the email entity
  domainId*: string ## ID of the domain that received the email
  subject*: string ## The subject line of the email message as specified by SMTP subject header
  to*: seq[string] ## List of `To` recipient email addresses that the email was addressed to. See recipients object for names.
  `from`*: string ## Who the email was sent from. An email address - see fromName for the sender name.
  bcc*: seq[string] ## List of `BCC` recipients email addresses that the email was addressed to. See recipients object for names.
  cc*: seq[string] ## List of `CC` recipients email addresses that the email was addressed to. See recipients object for names.
  createdAt*: string ## When was the email received by MailSlurp
  read*: bool ## Read flag. Has the email ever been viewed in the dashboard or fetched via the API with a hydrated body? If so the email is marked as read. Paginated results do not affect read status. Read status is different to email opened event as it depends on your own account accessing the email. Email opened is determined by tracking pixels sent to other uses if enable during sending. You can listened for both email read and email opened events using webhooks.
  attachments*: seq[string] ## List of IDs of attachments found in the email. Use these IDs with the Inbox and Email Controllers to download attachments and attachment meta data such as filesize, name, extension.
