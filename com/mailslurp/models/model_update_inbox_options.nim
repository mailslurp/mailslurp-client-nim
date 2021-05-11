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


type UpdateInboxOptions* = object
  ## Options for updating inbox properties
  description*: string ## Description of an inbox for labelling and searching purposes
  expiresAt*: string ## Inbox expiration time. When, if ever, the inbox should expire and be deleted. If null then this inbox is permanent and the emails in it won't be deleted. This is the default behavior unless expiration date is set. If an expiration date is set and the time is reached MailSlurp will expire the inbox and move it to an expired inbox entity. You can still access the emails belonging to it but it can no longer send or receive email.
  favourite*: bool ## Is the inbox favorited. Favouriting inboxes is typically done in the dashboard for quick access or filtering
  name*: string ## Name of the inbox. Displayed in the dashboard for easier search
  tags*: seq[string] ## Tags that inbox has been tagged with. Tags can be added to inboxes to group different inboxes within an account. You can also search for inboxes by tag in the dashboard UI.
