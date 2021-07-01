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

import ../models/model_create_inbox_dto
import ../models/model_create_inbox_ruleset_options
import ../models/model_email_preview
import ../models/model_inbox
import ../models/model_page_email_preview
import ../models/model_page_inbox_projection
import ../models/model_page_organization_inbox_projection
import ../models/model_page_sent_email_projection
import ../models/model_send_email_options
import ../models/model_sent_email_dto
import ../models/model_set_inbox_favourited_options
import ../models/model_update_inbox_options

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


proc createInbox*(httpClient: HttpClient, allowTeamAccess: bool, description: string, emailAddress: string, expiresAt: string, expiresIn: int64, favourite: bool, inboxType: string, name: string, tags: seq[string], useDomainPool: bool): (Option[Inbox], Response) =
  ## Create an inbox email address. An inbox has a real email address and can send and receive emails. Inboxes can be either `SMTP` or `HTTP` inboxes.
  let query_for_api_call = encodeQuery([
    ("allowTeamAccess", $allowTeamAccess), # Grant team access to this inbox and the emails that belong to it for team members of your organization.
    ("description", $description), # Optional description of the inbox for labelling purposes. Is shown in the dashboard and can be used with
    ("emailAddress", $emailAddress), # A custom email address to use with the inbox. Defaults to null. When null MailSlurp will assign a random email address to the inbox such as `123@mailslurp.com`. If you use the `useDomainPool` option when the email address is null it will generate an email address with a more varied domain ending such as `123@mailslurp.info` or `123@mailslurp.biz`. When a custom email address is provided the address is split into a domain and the domain is queried against your user. If you have created the domain in the MailSlurp dashboard and verified it you can use any email address that ends with the domain. Note domain types must match the inbox type - so `SMTP` inboxes will only work with `SMTP` type domains. Send an email to this address and the inbox will receive and store it for you. To retrieve the email use the Inbox and Email Controller endpoints with the inbox ID.
    ("expiresAt", $expiresAt), # Optional inbox expiration date. If null then this inbox is permanent and the emails in it won't be deleted. If an expiration date is provided or is required by your plan the inbox will be closed when the expiration time is reached. Expired inboxes still contain their emails but can no longer send or receive emails. An ExpiredInboxRecord is created when an inbox and the email address and inbox ID are recorded. The expiresAt property is a timestamp string in ISO DateTime Format yyyy-MM-dd'T'HH:mm:ss.SSSXXX.
    ("expiresIn", $expiresIn), # Number of milliseconds that inbox should exist for
    ("favourite", $favourite), # Is the inbox a favorite. Marking an inbox as a favorite is typically done in the dashboard for quick access or filtering
    ("inboxType", $inboxType), # HTTP (default) or SMTP inbox type. HTTP inboxes are best for testing while SMTP inboxes are more reliable for public inbound email consumption. When using custom domains the domain type must match the inbox type. HTTP inboxes are processed by AWS SES while SMTP inboxes use a custom mail server running at `mx.mailslurp.com`.
    ("name", $name), # Optional name of the inbox. Displayed in the dashboard for easier search and used as the sender name when sending emails.
    ("tags", $tags.join(",")), # Tags that inbox has been tagged with. Tags can be added to inboxes to group different inboxes within an account. You can also search for inboxes by tag in the dashboard UI.
    ("useDomainPool", $useDomainPool), # Use the MailSlurp domain name pool with this inbox when creating the email address. Defaults to null. If enabled the inbox will be an email address with a domain randomly chosen from a list of the MailSlurp domains. This is useful when the default `@mailslurp.com` email addresses used with inboxes are blocked or considered spam by a provider or receiving service. When domain pool is enabled an email address will be generated ending in `@mailslurp.{world,info,xyz,...}` . This means a TLD is randomly selecting from a list of `.biz`, `.info`, `.xyz` etc to add variance to the generated email addresses. When null or false MailSlurp uses the default behavior of `@mailslurp.com` or custom email address provided by the emailAddress field. Note this feature is only available for `HTTP` inbox types.
  ])

  let response = httpClient.post(basepath & "/inboxes" & "?" & query_for_api_call)
  constructResult[Inbox](response)


proc createInboxRuleset*(httpClient: HttpClient, inboxId: string, createInboxRulesetOptions: CreateInboxRulesetOptions): Response =
  ## Create an inbox ruleset
  httpClient.headers["Content-Type"] = "application/json"
  httpClient.post(basepath & fmt"/inboxes/{inboxId}/rulesets", $(%createInboxRulesetOptions))


proc createInboxWithDefaults*(httpClient: HttpClient): (Option[Inbox], Response) =
  ## Create an inbox with default options. Uses MailSlurp domain pool address and is private.

  let response = httpClient.post(basepath & "/inboxes/withDefaults")
  constructResult[Inbox](response)


proc createInboxWithOptions*(httpClient: HttpClient, createInboxDto: CreateInboxDto): (Option[Inbox], Response) =
  ## Create an inbox with options. Extended options for inbox creation.
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & "/inboxes/withOptions", $(%createInboxDto))
  constructResult[Inbox](response)


proc deleteAllInboxes*(httpClient: HttpClient): Response =
  ## Delete all inboxes
  httpClient.delete(basepath & "/inboxes")


proc deleteInbox*(httpClient: HttpClient, inboxId: string): Response =
  ## Delete inbox
  httpClient.delete(basepath & fmt"/inboxes/{inboxId}")


proc getAllInboxes*(httpClient: HttpClient, favourite: bool, page: int, search: string, size: int, sort: string, tag: string, teamAccess: bool): (Option[PageInboxProjection], Response) =
  ## List All Inboxes Paginated
  let query_for_api_call = encodeQuery([
    ("favourite", $favourite), # Optionally filter results for favourites only
    ("page", $page), # Optional page index in list pagination
    ("search", $search), # Optionally filter by search words partial matching ID, tags, name, and email address
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("tag", $tag), # Optionally filter by tags. Will return inboxes that include given tags
    ("teamAccess", $teamAccess), # Optionally filter by team access. Defaults to false so organization inboxes are not included
  ])

  let response = httpClient.get(basepath & "/inboxes/paginated" & "?" & query_for_api_call)
  constructResult[PageInboxProjection](response)


proc getEmails*(httpClient: HttpClient, inboxId: string, limit: int, minCount: int64, retryTimeout: int64, since: string, size: int, sort: string): (Option[seq[EmailPreview]], Response) =
  ## Get emails in an Inbox. This method is not idempotent as it allows retries and waits if you want certain conditions to be met before returning. For simple listing and sorting of known emails use the email controller instead.
  let query_for_api_call = encodeQuery([
    ("limit", $limit), # Limit the result set, ordered by received date time sort direction. Maximum 100. For more listing options see the email controller
    ("minCount", $minCount), # Minimum acceptable email count. Will cause request to hang (and retry) until minCount is satisfied or retryTimeout is reached.
    ("retryTimeout", $retryTimeout), # Maximum milliseconds to spend retrying inbox database until minCount emails are returned
    ("since", $since), # Exclude emails received before this ISO 8601 date time
    ("size", $size), # Alias for limit. Assessed first before assessing any passed limit.
    ("sort", $sort), # Sort the results by received date and direction ASC or DESC
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/emails" & "?" & query_for_api_call)
  constructResult[seq[EmailPreview]](response)


proc getInbox*(httpClient: HttpClient, inboxId: string): (Option[Inbox], Response) =
  ## Get Inbox. Returns properties of an inbox.

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}")
  constructResult[Inbox](response)


proc getInboxEmailsPaginated*(httpClient: HttpClient, inboxId: string, page: int, size: int, sort: string): (Option[PageEmailPreview], Response) =
  ## Get inbox emails paginated
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in inbox emails list pagination
    ("size", $size), # Optional page size in inbox emails list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/emails/paginated" & "?" & query_for_api_call)
  constructResult[PageEmailPreview](response)


proc getInboxSentEmails*(httpClient: HttpClient, inboxId: string, page: int, searchFilter: string, size: int, sort: string): (Option[PageSentEmailProjection], Response) =
  ## Get Inbox Sent Emails
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in inbox sent email list pagination
    ("searchFilter", $searchFilter), # Optional sent email search
    ("size", $size), # Optional page size in inbox sent email list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/sent" & "?" & query_for_api_call)
  constructResult[PageSentEmailProjection](response)


proc getInboxTags*(httpClient: HttpClient): (Option[seq[string]], Response) =
  ## Get inbox tags

  let response = httpClient.get(basepath & "/inboxes/tags")
  constructResult[seq[string]](response)


proc getInboxes*(httpClient: HttpClient, size: int, sort: string): (Option[seq[Inbox]], Response) =
  ## List Inboxes and email eddresses
  let query_for_api_call = encodeQuery([
    ("size", $size), # Optional result size limit. Note an automatic limit of 100 results is applied. See the paginated `getAllEmails` for larger queries.
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & "/inboxes" & "?" & query_for_api_call)
  constructResult[seq[Inbox]](response)


proc getOrganizationInboxes*(httpClient: HttpClient, page: int, searchFilter: string, size: int, sort: string): (Option[PageOrganizationInboxProjection], Response) =
  ## List Organization Inboxes Paginated
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("searchFilter", $searchFilter), # Optional search filter
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])

  let response = httpClient.get(basepath & "/inboxes/organization" & "?" & query_for_api_call)
  constructResult[PageOrganizationInboxProjection](response)


proc listInboxRulesets*(httpClient: HttpClient, inboxId: string, page: int, searchFilter: string, size: int, sort: string): Response =
  ## List inbox rulesets
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in inbox ruleset list pagination
    ("searchFilter", $searchFilter), # Optional search filter
    ("size", $size), # Optional page size in inbox ruleset list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
  ])
  httpClient.get(basepath & fmt"/inboxes/{inboxId}/rulesets" & "?" & query_for_api_call)


proc sendEmail*(httpClient: HttpClient, inboxId: string, sendEmailOptions: SendEmailOptions): Response =
  ## Send Email
  httpClient.headers["Content-Type"] = "application/json"
  httpClient.post(basepath & fmt"/inboxes/{inboxId}", $(%sendEmailOptions))


proc sendEmailAndConfirm*(httpClient: HttpClient, inboxId: string, sendEmailOptions: SendEmailOptions): (Option[SentEmailDto], Response) =
  ## Send email and return sent confirmation
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & fmt"/inboxes/{inboxId}/confirm", $(%sendEmailOptions))
  constructResult[SentEmailDto](response)


proc sendTestEmail*(httpClient: HttpClient, inboxId: string): Response =
  ## Send a test email to inbox
  httpClient.post(basepath & fmt"/inboxes/{inboxId}/send-test-email")


proc setInboxFavourited*(httpClient: HttpClient, inboxId: string, setInboxFavouritedOptions: SetInboxFavouritedOptions): (Option[Inbox], Response) =
  ## Set inbox favourited state
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.put(basepath & fmt"/inboxes/{inboxId}/favourite", $(%setInboxFavouritedOptions))
  constructResult[Inbox](response)


proc updateInbox*(httpClient: HttpClient, inboxId: string, updateInboxOptions: UpdateInboxOptions): (Option[Inbox], Response) =
  ## Update Inbox. Change name and description. Email address is not editable.
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.patch(basepath & fmt"/inboxes/{inboxId}", $(%updateInboxOptions))
  constructResult[Inbox](response)

