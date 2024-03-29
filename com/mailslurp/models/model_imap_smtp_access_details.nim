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


type ImapSmtpAccessDetails* = object
  ## Access details for inbox using SMTP or IMAP
  secureSmtpServerHost*: string ## Secure TLS SMTP server host domain
  secureSmtpServerPort*: int ## Secure TLS SMTP server host port
  secureSmtpUsername*: string ## Secure TLS SMTP username for login
  secureSmtpPassword*: string ## Secure TLS SMTP password for login
  smtpServerHost*: string ## SMTP server host domain
  smtpServerPort*: int ## SMTP server host port
  smtpUsername*: string ## SMTP username for login
  smtpPassword*: string ## SMTP password for login
  imapServerHost*: string ## IMAP server host domain
  imapServerPort*: int ## IMAP server host port
  imapUsername*: string ## IMAP username for login
  imapPassword*: string ## IMAP password for login
