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

import model_object

type CreateContactOptions* = object
  ## 
  firstName*: string
  lastName*: string
  company*: string
  emailAddresses*: seq[string] ## Set of email addresses belonging to the contact
  tags*: seq[string] ## Tags that can be used to search and group contacts
  metaData*: object
  optOut*: bool ## Has the user explicitly or implicitly opted out of being contacted? If so MailSlurp will ignore them in all actions.
  groupId*: string ## Group IDs that contact belongs to
