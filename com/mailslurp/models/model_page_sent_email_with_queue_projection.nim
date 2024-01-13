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

import model_pageable_object
import model_send_with_queue_result
import model_sort_object

type PageSentEmailWithQueueProjection* = object
  ## Paginated sent email results for emails sent with queue. Page index starts at zero. Projection results may omit larger entity fields. For fetching a full sent email entity use the projection ID with individual method calls.
  content*: seq[SendWithQueueResult] ## Collection of items
  pageable*: PageableObject
  total*: int64
  numberOfElements*: int ## Number of items returned
  totalElements*: int64 ## Total number of items available for querying
  totalPages*: int ## Total number of pages available
  size*: int ## Size of page requested
  number*: int ## Page number starting at 0
  last*: bool
  first*: bool
  sort*: SortObject
  empty*: bool
