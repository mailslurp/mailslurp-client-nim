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

import model_object

type ContactDto* = object
  ## 
  id*: string
  groupId*: string
  firstName*: string
  lastName*: string
  company*: string
  emailAddresses*: seq[string]
  primaryEmailAddress*: string
  tags*: seq[string]
  metaData*: object
  optOut*: bool
  createdAt*: string
