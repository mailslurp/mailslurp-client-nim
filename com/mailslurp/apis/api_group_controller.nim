#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.   ## Resources - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository 
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

import ../models/model_create_group_options
import ../models/model_group_contacts_dto
import ../models/model_group_dto
import ../models/model_group_projection
import ../models/model_page_contact_projection
import ../models/model_page_group_projection
import ../models/model_update_group_contacts

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


proc addContactsToGroup*(httpClient: HttpClient, groupId: string, updateGroupContactsOption: UpdateGroupContacts): (Option[GroupContactsDto], Response) =
  ## Add contacts to a group
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.put(basepath & fmt"/groups/{groupId}/contacts", $(%updateGroupContactsOption))
  constructResult[GroupContactsDto](response)


proc createGroup*(httpClient: HttpClient, createGroupOptions: CreateGroupOptions): (Option[GroupDto], Response) =
  ## Create a group
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & "/groups", $(%createGroupOptions))
  constructResult[GroupDto](response)


proc deleteGroup*(httpClient: HttpClient, groupId: string): Response =
  ## Delete group
  httpClient.delete(basepath & fmt"/groups/{groupId}")


proc getAllGroups*(httpClient: HttpClient, page: int, size: int, sort: string): (Option[PageGroupProjection], Response) =
  ## Get all Contact Groups in paginated format
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in inbox list pagination
    ("size", $size), # Optional page size in inbox list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & "/groups/paginated" & "?" & query_for_api_call)
  constructResult[PageGroupProjection](response)


proc getGroup*(httpClient: HttpClient, groupId: string): (Option[GroupDto], Response) =
  ## Get group

  let response = httpClient.get(basepath & fmt"/groups/{groupId}")
  constructResult[GroupDto](response)


proc getGroupWithContacts*(httpClient: HttpClient, groupId: string): (Option[GroupContactsDto], Response) =
  ## Get group and contacts belonging to it

  let response = httpClient.get(basepath & fmt"/groups/{groupId}/contacts")
  constructResult[GroupContactsDto](response)


proc getGroupWithContactsPaginated*(httpClient: HttpClient, groupId: string, page: int, size: int, sort: string): (Option[PageContactProjection], Response) =
  ## Get group and paginated contacts belonging to it
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in group contact pagination
    ("size", $size), # Optional page size in group contact pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & fmt"/groups/{groupId}/contacts-paginated" & "?" & query_for_api_call)
  constructResult[PageContactProjection](response)


proc getGroups*(httpClient: HttpClient): (Option[seq[GroupProjection]], Response) =
  ## Get all groups

  let response = httpClient.get(basepath & "/groups")
  constructResult[seq[GroupProjection]](response)


proc removeContactsFromGroup*(httpClient: HttpClient, groupId: string, updateGroupContactsOption: UpdateGroupContacts): (Option[GroupContactsDto], Response) =
  ## Remove contacts from a group
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.delete(basepath & fmt"/groups/{groupId}/contacts", $(%updateGroupContactsOption))
  constructResult[GroupContactsDto](response)

