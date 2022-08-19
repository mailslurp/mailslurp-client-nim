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

import model_group_projection
import model_pageable_object
import model_sort

type PageGroupProjection* = object
  ## Paginated missed email results. Page index starts at zero. Projection results may omit larger entity fields. For fetching a full entity use the projection ID with individual method calls.
  content*: seq[GroupProjection]
  pageable*: PageableObject
  total*: int64
  last*: bool
  totalElements*: int64
  totalPages*: int
  size*: int
  number*: int
  sort*: Sort
  first*: bool
  numberOfElements*: int
  empty*: bool
