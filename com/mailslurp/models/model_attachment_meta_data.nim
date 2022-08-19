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


type AttachmentMetaData* = object
  ## Meta data associated with an attachment. Attachments are stored as byte blobs so the meta data is stored separately.
  name*: string ## Name of attachment if given
  contentType*: string ## Content type of attachment such as `image/png`
  contentLength*: int64 ## Size of attachment in bytes
  id*: string ## ID of attachment. Can be used to with attachment controller endpoints to download attachment or with sending methods to attach to an email.
