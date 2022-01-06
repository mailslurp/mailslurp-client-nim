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


type ForwardEmailOptions* = object
  ## Options for forwarding an email
  to*: seq[string] ## To recipients for forwarded email
  subject*: string ## Subject for forwarded email
  cc*: seq[string] ## Optional cc recipients
  bcc*: seq[string] ## Optional bcc recipients
  `from`*: string ## Optional from override
  useInboxName*: bool ## Optionally use inbox name as display name for sender email address
