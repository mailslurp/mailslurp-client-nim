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

import model_html_validation_result

type ValidationDto* = object
  ## Response object for email validation operation
  emailId*: string ## ID of the email validated
  html*: HTMLValidationResult
