#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository
# The version of the OpenAPI document: 6.5.2
# 
# Generated by: https://openapi-generator.tech
#

import httpclient
import json
import logging
import marshal
import options
import strformat
import strutils
import tables
import typetraits
import uri

import ../models/model_byte_array
import ../models/model_export_link
import ../models/model_export_options

const basepath = "https://api.mailslurp.com"

template constructResult[T](response: Response): untyped =
  if response.code in {Http200, Http201, Http202, Http204, Http206}:
    try:
      when name(stripGenericParams(T.typedesc).typedesc) == name(Table):
        (some(json.to(parseJson(response.body), T.typedesc)), response)
      else:
        (some(marshal.to[T](response.body)), response)
    except JsonParsingError:
      # The server returned a malformed response though the response code is 2XX
      # TODO: need better error handling
      error("JsonParsingError")
      (none(T.typedesc), response)
  else:
    (none(T.typedesc), response)


proc exportEntities*(httpClient: HttpClient, apiKey: string, exportType: string, outputFormat: string, createdEarliestTime: string, createdOldestTime: string, excludePreviouslyExported: bool, filter: string, listSeparatorToken: string): (Option[ByteArray], Response) =
  ## Export inboxes link callable via browser
  let query_for_api_call = encodeQuery([
    ("apiKey", $apiKey), # apiKey
    ("createdEarliestTime", $createdEarliestTime), # createdEarliestTime
    ("createdOldestTime", $createdOldestTime), # createdOldestTime
    ("excludePreviouslyExported", $excludePreviouslyExported), # excludePreviouslyExported
    ("exportType", $exportType), # exportType
    ("filter", $filter), # filter
    ("listSeparatorToken", $listSeparatorToken), # listSeparatorToken
    ("outputFormat", $outputFormat), # outputFormat
  ])

  let response = httpClient.get(basepath & "/export" & "?" & query_for_api_call)
  constructResult[ByteArray](response)


proc getExportLink*(httpClient: HttpClient, exportType: string, exportOptions: ExportOptions, apiKey: string): (Option[ExportLink], Response) =
  ## Get export link
  httpClient.headers["Content-Type"] = "application/json"
  let query_for_api_call = encodeQuery([
    ("apiKey", $apiKey), # apiKey
    ("exportType", $exportType), # exportType
  ])

  let response = httpClient.post(basepath & "/export" & "?" & query_for_api_call, $(%exportOptions))
  constructResult[ExportLink](response)

