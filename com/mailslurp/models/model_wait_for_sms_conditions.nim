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

import model_sms_match_option

type CountType* {.pure.} = enum
  EXACTLY
  ATLEAST

type SortDirection* {.pure.} = enum
  ASC
  DESC

type WaitForSmsConditions* = object
  ## Conditions to apply to emails that you are waiting for
  phoneNumberId*: string ## ID of phone number to search within and apply conditions to. Essentially filtering the SMS found to give a count.
  limit*: int ## Limit results
  count*: int64 ## Number of results that should match conditions. Either exactly or at least this amount based on the `countType`. If count condition is not met and the timeout has not been reached the `waitFor` method will retry the operation.
  delayTimeout*: int64 ## Max time in milliseconds to wait between retries if a `timeout` is specified.
  timeout*: int64 ## Max time in milliseconds to retry the `waitFor` operation until conditions are met.
  unreadOnly*: bool ## Apply conditions only to **unread** SMS. All SMS messages begin with `read=false`. An SMS is marked `read=true` when an `SMS` has been returned to the user at least once. For example you have called `getSms` or `waitForSms` etc., or you have viewed the SMS in the dashboard.
  countType*: CountType ## How result size should be compared with the expected size. Exactly or at-least matching result?
  matches*: seq[SmsMatchOption] ## Conditions that should be matched for an SMS to qualify for results. Each condition will be applied in order to each SMS within a phone number to filter a result list of matching SMSs you are waiting for.
  sortDirection*: SortDirection ## Direction to sort matching SMSs by created time
  since*: string ## ISO Date Time earliest time of SMS to consider. Filter for matching SMSs that were received after this date
  before*: string ## ISO Date Time latest time of SMS to consider. Filter for matching SMSs that were received before this date

func `%`*(v: CountType): JsonNode =
  let str = case v:
    of CountType.EXACTLY: "EXACTLY"
    of CountType.ATLEAST: "ATLEAST"

  JsonNode(kind: JString, str: str)

func `$`*(v: CountType): string =
  result = case v:
    of CountType.EXACTLY: "EXACTLY"
    of CountType.ATLEAST: "ATLEAST"

func `%`*(v: SortDirection): JsonNode =
  let str = case v:
    of SortDirection.ASC: "ASC"
    of SortDirection.DESC: "DESC"

  JsonNode(kind: JString, str: str)

func `$`*(v: SortDirection): string =
  result = case v:
    of SortDirection.ASC: "ASC"
    of SortDirection.DESC: "DESC"
