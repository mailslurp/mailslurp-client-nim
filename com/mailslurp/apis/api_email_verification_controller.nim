#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository
# The version of the OpenAPI document: 6.5.2
# Contact: contact@mailslurp.dev
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

import ../models/model_page_email_validation_request
import ../models/model_validate_email_address_list_options
import ../models/model_validate_email_address_list_result

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


proc getValidationRequests*(httpClient: HttpClient, page: int, size: int, sort: string, searchFilter: string, since: string, before: string, isValid: bool): (Option[PageEmailValidationRequest], Response) =
  ## Validate a list of email addresses. Per unit billing. See your plan for pricing.
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("size", $size), # Optional page size for paginated result list.
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("searchFilter", $searchFilter), # Optional search filter
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
    ("isValid", $isValid), # Filter where email is valid is true or false
  ])

  let response = httpClient.get(basepath & "/email-verification/validation-requests" & "?" & query_for_api_call)
  constructResult[PageEmailValidationRequest](response)


proc validateEmailAddressList*(httpClient: HttpClient, ValidateEmailAddressListOptions: ValidateEmailAddressListOptions): (Option[ValidateEmailAddressListResult], Response) =
  ## Validate a list of email addresses. Per unit billing. See your plan for pricing.
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & "/email-verification/email-address-list", $(%ValidateEmailAddressListOptions))
  constructResult[ValidateEmailAddressListResult](response)
