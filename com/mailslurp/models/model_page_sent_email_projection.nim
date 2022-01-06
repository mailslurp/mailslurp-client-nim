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

import model_pageable
import model_sent_email_projection
import model_sort

type PageSentEmailProjection* = object
  ## Paginated sent email results. Page index starts at zero. Projection results may omit larger entity fields. For fetching a full sent email entity use the projection ID with individual method calls.
  content*: seq[SentEmailProjection] ## Collection of items
  pageable*: Pageable
  size*: int ## Size of page requested
  number*: int ## Page number starting at 0
  numberOfElements*: int ## Number of items returned
  totalElements*: int64 ## Total number of items available for querying
  totalPages*: int ## Total number of pages available
  last*: bool
  sort*: Sort
  first*: bool
  empty*: bool
