#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://docs.mailslurp.com/) - [Examples](https://github.com/mailslurp/examples) repository
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

import ../models/model_create_emergency_address_options
import ../models/model_emergency_address
import ../models/model_emergency_address_dto
import ../models/model_empty_response_dto
import ../models/model_page_phone_number_projection
import ../models/model_phone_number_dto
import ../models/model_phone_plan_dto
import ../models/model_test_phone_number_options

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


proc createEmergencyAddress*(httpClient: HttpClient, CreateEmergencyAddressOptions: CreateEmergencyAddressOptions): (Option[EmergencyAddress], Response) =
  ## 
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & "/phone/emergency-addresses", $(%CreateEmergencyAddressOptions))
  constructResult[EmergencyAddress](response)


proc deleteEmergencyAddress*(httpClient: HttpClient, addressId: string): (Option[EmptyResponseDto], Response) =
  ## 

  let response = httpClient.delete(basepath & fmt"/phone/emergency-addresses/{addressId}")
  constructResult[EmptyResponseDto](response)


proc deletePhoneNumber*(httpClient: HttpClient, phoneNumberId: string): Response =
  ## 
  httpClient.delete(basepath & fmt"/phone/numbers/{phoneNumberId}")


proc getEmergencyAddress*(httpClient: HttpClient, addressId: string): (Option[EmergencyAddress], Response) =
  ## 

  let response = httpClient.get(basepath & fmt"/phone/emergency-addresses/{addressId}")
  constructResult[EmergencyAddress](response)


proc getEmergencyAddresses*(httpClient: HttpClient): (Option[seq[EmergencyAddressDto]], Response) =
  ## 

  let response = httpClient.get(basepath & "/phone/emergency-addresses")
  constructResult[seq[EmergencyAddressDto]](response)


proc getPhoneNumber*(httpClient: HttpClient, phoneNumberId: string): (Option[PhoneNumberDto], Response) =
  ## 

  let response = httpClient.get(basepath & fmt"/phone/numbers/{phoneNumberId}")
  constructResult[PhoneNumberDto](response)


proc getPhoneNumbers*(httpClient: HttpClient, page: int, size: int, sort: string, since: string, before: string): (Option[PagePhoneNumberProjection], Response) =
  ## 
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index for list pagination
    ("size", $size), # Optional page size for list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & "/phone/numbers" & "?" & query_for_api_call)
  constructResult[PagePhoneNumberProjection](response)


proc getPhonePlans*(httpClient: HttpClient): (Option[seq[PhonePlanDto]], Response) =
  ## 

  let response = httpClient.get(basepath & "/phone/plans")
  constructResult[seq[PhonePlanDto]](response)


proc testPhoneNumberSendSms*(httpClient: HttpClient, phoneNumberId: string, TestPhoneNumberOptions: TestPhoneNumberOptions): Response =
  ## 
  httpClient.headers["Content-Type"] = "application/json"
  httpClient.post(basepath & fmt"/phone/numbers/{phoneNumberId}/test", $(%TestPhoneNumberOptions))

