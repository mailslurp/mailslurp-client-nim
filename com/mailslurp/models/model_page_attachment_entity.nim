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

import model_attachment_projection
import model_pageable
import model_sort

type PageAttachmentEntity* = object
  ## Paginated attachment entity results. Page index starts at zero. Projection results may omit larger entity fields. For fetching a full entity use the projection ID with individual method calls.
  content*: seq[AttachmentProjection]
  pageable*: Pageable
  totalElements*: int64
  totalPages*: int
  last*: bool
  size*: int
  number*: int
  sort*: Sort
  numberOfElements*: int
  first*: bool
  empty*: bool
