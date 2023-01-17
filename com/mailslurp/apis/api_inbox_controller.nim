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

import ../models/model_count_dto
import ../models/model_create_inbox_dto
import ../models/model_create_inbox_ruleset_options
import ../models/model_email
import ../models/model_email_preview
import ../models/model_flush_expired_inboxes_result
import ../models/model_imap_smtp_access_details
import ../models/model_inbox_by_email_address_result
import ../models/model_inbox_by_name_result
import ../models/model_inbox_dto
import ../models/model_inbox_exists_dto
import ../models/model_inbox_ids_result
import ../models/model_inbox_ruleset_dto
import ../models/model_page_delivery_status
import ../models/model_page_email_preview
import ../models/model_page_inbox_projection
import ../models/model_page_inbox_ruleset_dto
import ../models/model_page_organization_inbox_projection
import ../models/model_page_scheduled_jobs
import ../models/model_page_sent_email_projection
import ../models/model_page_tracking_pixel_projection
import ../models/model_scheduled_job_dto
import ../models/model_send_email_options
import ../models/model_send_smtp_envelope_options
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


proc cancelScheduledJob*(httpClient: HttpClient, jobId: string): (Option[ScheduledJobDto], Response) =
  ## Cancel a scheduled email job

  let response = httpClient.delete(basepath & fmt"/inboxes/scheduled-jobs/{jobId}")
  constructResult[ScheduledJobDto](response)


proc createInbox*(httpClient: HttpClient, emailAddress: string, tags: seq[string], name: string, description: string, useDomainPool: bool, favourite: bool, expiresAt: string, expiresIn: int64, allowTeamAccess: bool, inboxType: string, virtualInbox: bool, useShortAddress: bool): (Option[InboxDto], Response) =
  ## Create an inbox email address. An inbox has a real email address and can send and receive emails. Inboxes can be either `SMTP` or `HTTP` inboxes.
  let query_for_api_call = encodeQuery([
    ("emailAddress", $emailAddress), # A custom email address to use with the inbox. Defaults to null. When null MailSlurp will assign a random email address to the inbox such as `123@mailslurp.com`. If you use the `useDomainPool` option when the email address is null it will generate an email address with a more varied domain ending such as `123@mailslurp.info` or `123@mailslurp.biz`. When a custom email address is provided the address is split into a domain and the domain is queried against your user. If you have created the domain in the MailSlurp dashboard and verified it you can use any email address that ends with the domain. Note domain types must match the inbox type - so `SMTP` inboxes will only work with `SMTP` type domains. Avoid `SMTP` inboxes if you need to send emails as they can only receive. Send an email to this address and the inbox will receive and store it for you. To retrieve the email use the Inbox and Email Controller endpoints with the inbox ID.
    ("tags", $tags.join(",")), # Tags that inbox has been tagged with. Tags can be added to inboxes to group different inboxes within an account. You can also search for inboxes by tag in the dashboard UI.
    ("name", $name), # Optional name of the inbox. Displayed in the dashboard for easier search and used as the sender name when sending emails.
    ("description", $description), # Optional description of the inbox for labelling purposes. Is shown in the dashboard and can be used with
    ("useDomainPool", $useDomainPool), # Use the MailSlurp domain name pool with this inbox when creating the email address. Defaults to null. If enabled the inbox will be an email address with a domain randomly chosen from a list of the MailSlurp domains. This is useful when the default `@mailslurp.com` email addresses used with inboxes are blocked or considered spam by a provider or receiving service. When domain pool is enabled an email address will be generated ending in `@mailslurp.{world,info,xyz,...}` . This means a TLD is randomly selecting from a list of `.biz`, `.info`, `.xyz` etc to add variance to the generated email addresses. When null or false MailSlurp uses the default behavior of `@mailslurp.com` or custom email address provided by the emailAddress field. Note this feature is only available for `HTTP` inbox types.
    ("favourite", $favourite), # Is the inbox a favorite. Marking an inbox as a favorite is typically done in the dashboard for quick access or filtering
    ("expiresAt", $expiresAt), # Optional inbox expiration date. If null then this inbox is permanent and the emails in it won't be deleted. If an expiration date is provided or is required by your plan the inbox will be closed when the expiration time is reached. Expired inboxes still contain their emails but can no longer send or receive emails. An ExpiredInboxRecord is created when an inbox and the email address and inbox ID are recorded. The expiresAt property is a timestamp string in ISO DateTime Format yyyy-MM-dd'T'HH:mm:ss.SSSXXX.
    ("expiresIn", $expiresIn), # Number of milliseconds that inbox should exist for
    ("allowTeamAccess", $allowTeamAccess), # DEPRECATED (team access is always true). Grant team access to this inbox and the emails that belong to it for team members of your organization.
    ("inboxType", $inboxType), # HTTP (default) or SMTP inbox type. HTTP inboxes are default and best solution for most cases. SMTP inboxes are more reliable for public inbound email consumption (but do not support sending emails). When using custom domains the domain type must match the inbox type. HTTP inboxes are processed by AWS SES while SMTP inboxes use a custom mail server running at `mx.mailslurp.com`.
    ("virtualInbox", $virtualInbox), # Virtual inbox prevents any outbound emails from being sent. It creates sent email records but will never send real emails to recipients. Great for testing and faking email sending.
    ("useShortAddress", $useShortAddress), # Use a shorter email address under 31 characters
  ])

  let response = httpClient.post(basepath & "/inboxes" & "?" & query_for_api_call)
  constructResult[InboxDto](response)


proc createInboxRuleset*(httpClient: HttpClient, inboxId: string, CreateInboxRulesetOptions: CreateInboxRulesetOptions): (Option[InboxRulesetDto], Response) =
  ## Create an inbox ruleset
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & fmt"/inboxes/{inboxId}/rulesets", $(%CreateInboxRulesetOptions))
  constructResult[InboxRulesetDto](response)


proc createInboxWithDefaults*(httpClient: HttpClient): (Option[InboxDto], Response) =
  ## Create an inbox with default options. Uses MailSlurp domain pool address and is private.

  let response = httpClient.post(basepath & "/inboxes/withDefaults")
  constructResult[InboxDto](response)


proc createInboxWithOptions*(httpClient: HttpClient, CreateInboxDto: CreateInboxDto): (Option[InboxDto], Response) =
  ## Create an inbox with options. Extended options for inbox creation.
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & "/inboxes/withOptions", $(%CreateInboxDto))
  constructResult[InboxDto](response)


proc deleteAllInboxEmails*(httpClient: HttpClient, inboxId: string): Response =
  ## Delete all emails in a given inboxes.
  httpClient.delete(basepath & fmt"/inboxes/{inboxId}/deleteAllInboxEmails")


proc deleteAllInboxes*(httpClient: HttpClient): Response =
  ## Delete all inboxes
  httpClient.delete(basepath & "/inboxes")


proc deleteInbox*(httpClient: HttpClient, inboxId: string): Response =
  ## Delete inbox
  httpClient.delete(basepath & fmt"/inboxes/{inboxId}")


proc doesInboxExist*(httpClient: HttpClient, emailAddress: string): (Option[InboxExistsDto], Response) =
  ## Does inbox exist
  let query_for_api_call = encodeQuery([
    ("emailAddress", $emailAddress), # Email address
  ])

  let response = httpClient.get(basepath & "/inboxes/exists" & "?" & query_for_api_call)
  constructResult[InboxExistsDto](response)


proc flushExpired*(httpClient: HttpClient, before: string): (Option[FlushExpiredInboxesResult], Response) =
  ## Remove expired inboxes
  let query_for_api_call = encodeQuery([
    ("before", $before), # Optional expired at before flag to flush expired inboxes that have expired before the given time
  ])

  let response = httpClient.delete(basepath & "/inboxes/expired" & "?" & query_for_api_call)
  constructResult[FlushExpiredInboxesResult](response)


proc getAllInboxes*(httpClient: HttpClient, page: int, size: int, sort: string, favourite: bool, search: string, tag: string, teamAccess: bool, since: string, before: string, inboxType: string, domainId: string): (Option[PageInboxProjection], Response) =
  ## List All Inboxes Paginated
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("favourite", $favourite), # Optionally filter results for favourites only
    ("search", $search), # Optionally filter by search words partial matching ID, tags, name, and email address
    ("tag", $tag), # Optionally filter by tags. Will return inboxes that include given tags
    ("teamAccess", $teamAccess), # DEPRECATED. Optionally filter by team access.
    ("since", $since), # Optional filter by created after given date time
    ("before", $before), # Optional filter by created before given date time
    ("inboxType", $inboxType), # Optional filter by inbox type
    ("domainId", $domainId), # Optional domain ID filter
  ])

  let response = httpClient.get(basepath & "/inboxes/paginated" & "?" & query_for_api_call)
  constructResult[PageInboxProjection](response)


proc getAllScheduledJobs*(httpClient: HttpClient, page: int, size: int, sort: string, since: string, before: string): (Option[PageScheduledJobs], Response) =
  ## Get all scheduled email sending jobs for account
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in scheduled job list pagination
    ("size", $size), # Optional page size in scheduled job list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & "/inboxes/scheduled-jobs" & "?" & query_for_api_call)
  constructResult[PageScheduledJobs](response)


proc getDeliveryStatusesByInboxId*(httpClient: HttpClient, inboxId: string, page: int, size: int, sort: string, since: string, before: string): (Option[PageDeliveryStatus], Response) =
  ## 
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in delivery status list pagination
    ("size", $size), # Optional page size in delivery status list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/delivery-status" & "?" & query_for_api_call)
  constructResult[PageDeliveryStatus](response)


proc getEmails*(httpClient: HttpClient, inboxId: string, size: int, limit: int, sort: string, retryTimeout: int64, delayTimeout: int64, minCount: int64, unreadOnly: bool, before: string, since: string): (Option[seq[EmailPreview]], Response) =
  ## Get emails in an Inbox. This method is not idempotent as it allows retries and waits if you want certain conditions to be met before returning. For simple listing and sorting of known emails use the email controller instead.
  let query_for_api_call = encodeQuery([
    ("size", $size), # Alias for limit. Assessed first before assessing any passed limit.
    ("limit", $limit), # Limit the result set, ordered by received date time sort direction. Maximum 100. For more listing options see the email controller
    ("sort", $sort), # Sort the results by received date and direction ASC or DESC
    ("retryTimeout", $retryTimeout), # Maximum milliseconds to spend retrying inbox database until minCount emails are returned
    ("delayTimeout", $delayTimeout), # 
    ("minCount", $minCount), # Minimum acceptable email count. Will cause request to hang (and retry) until minCount is satisfied or retryTimeout is reached.
    ("unreadOnly", $unreadOnly), # 
    ("before", $before), # Exclude emails received after this ISO 8601 date time
    ("since", $since), # Exclude emails received before this ISO 8601 date time
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/emails" & "?" & query_for_api_call)
  constructResult[seq[EmailPreview]](response)


proc getImapSmtpAccess*(httpClient: HttpClient, inboxId: string): (Option[ImapSmtpAccessDetails], Response) =
  ## 
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId), # Inbox ID
  ])

  let response = httpClient.get(basepath & "/inboxes/imap-smtp-access" & "?" & query_for_api_call)
  constructResult[ImapSmtpAccessDetails](response)


proc getInbox*(httpClient: HttpClient, inboxId: string): (Option[InboxDto], Response) =
  ## Get Inbox. Returns properties of an inbox.

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}")
  constructResult[InboxDto](response)


proc getInboxByEmailAddress*(httpClient: HttpClient, emailAddress: string): (Option[InboxByEmailAddressResult], Response) =
  ## Search for an inbox with the provided email address
  let query_for_api_call = encodeQuery([
    ("emailAddress", $emailAddress), # 
  ])

  let response = httpClient.get(basepath & "/inboxes/byEmailAddress" & "?" & query_for_api_call)
  constructResult[InboxByEmailAddressResult](response)


proc getInboxByName*(httpClient: HttpClient, name: string): (Option[InboxByNameResult], Response) =
  ## Search for an inbox with the given name
  let query_for_api_call = encodeQuery([
    ("name", $name), # 
  ])

  let response = httpClient.get(basepath & "/inboxes/byName" & "?" & query_for_api_call)
  constructResult[InboxByNameResult](response)


proc getInboxCount*(httpClient: HttpClient): (Option[CountDto], Response) =
  ## Get total inbox count

  let response = httpClient.get(basepath & "/inboxes/count")
  constructResult[CountDto](response)


proc getInboxEmailCount*(httpClient: HttpClient, inboxId: string): (Option[CountDto], Response) =
  ## Get email count in inbox

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/emails/count")
  constructResult[CountDto](response)


proc getInboxEmailsPaginated*(httpClient: HttpClient, inboxId: string, page: int, size: int, sort: string, since: string, before: string): (Option[PageEmailPreview], Response) =
  ## Get inbox emails paginated
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in inbox emails list pagination
    ("size", $size), # Optional page size in inbox emails list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Optional filter by received after given date time
    ("before", $before), # Optional filter by received before given date time
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/emails/paginated" & "?" & query_for_api_call)
  constructResult[PageEmailPreview](response)


proc getInboxIds*(httpClient: HttpClient): (Option[InboxIdsResult], Response) =
  ## Get all inbox IDs

  let response = httpClient.get(basepath & "/inboxes/ids")
  constructResult[InboxIdsResult](response)


proc getInboxSentEmails*(httpClient: HttpClient, inboxId: string, page: int, size: int, sort: string, searchFilter: string, since: string, before: string): (Option[PageSentEmailProjection], Response) =
  ## Get Inbox Sent Emails
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in inbox sent email list pagination
    ("size", $size), # Optional page size in inbox sent email list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("searchFilter", $searchFilter), # Optional sent email search
    ("since", $since), # Optional filter by sent after given date time
    ("before", $before), # Optional filter by sent before given date time
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/sent" & "?" & query_for_api_call)
  constructResult[PageSentEmailProjection](response)


proc getInboxTags*(httpClient: HttpClient): (Option[seq[string]], Response) =
  ## Get inbox tags

  let response = httpClient.get(basepath & "/inboxes/tags")
  constructResult[seq[string]](response)


proc getInboxes*(httpClient: HttpClient, size: int, sort: string, since: string, before: string): (Option[seq[InboxDto]], Response) {.deprecated.} =
  ## List Inboxes and email addresses
  let query_for_api_call = encodeQuery([
    ("size", $size), # Optional result size limit. Note an automatic limit of 100 results is applied. See the paginated `getAllEmails` for larger queries.
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Optional filter by created after given date time
    ("before", $before), # Optional filter by created before given date time
  ])

  let response = httpClient.get(basepath & "/inboxes" & "?" & query_for_api_call)
  constructResult[seq[InboxDto]](response)


proc getLatestEmailInInbox*(httpClient: HttpClient, inboxId: string, timeoutMillis: int64): (Option[Email], Response) =
  ## Get latest email in an inbox. Use `WaitForController` to get emails that may not have arrived yet.
  let query_for_api_call = encodeQuery([
    ("inboxId", $inboxId), # ID of the inbox you want to get the latest email from
    ("timeoutMillis", $timeoutMillis), # Timeout milliseconds to wait for latest email
  ])

  let response = httpClient.get(basepath & "/inboxes/getLatestEmail" & "?" & query_for_api_call)
  constructResult[Email](response)


proc getOrganizationInboxes*(httpClient: HttpClient, page: int, size: int, sort: string, searchFilter: string, since: string, before: string): (Option[PageOrganizationInboxProjection], Response) =
  ## List Organization Inboxes Paginated
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in list pagination
    ("size", $size), # Optional page size in list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("searchFilter", $searchFilter), # Optional search filter
    ("since", $since), # Optional filter by created after given date time
    ("before", $before), # Optional filter by created before given date time
  ])

  let response = httpClient.get(basepath & "/inboxes/organization" & "?" & query_for_api_call)
  constructResult[PageOrganizationInboxProjection](response)


proc getScheduledJob*(httpClient: HttpClient, jobId: string): (Option[ScheduledJobDto], Response) =
  ## Get a scheduled email job

  let response = httpClient.get(basepath & fmt"/inboxes/scheduled-jobs/{jobId}")
  constructResult[ScheduledJobDto](response)


proc getScheduledJobsByInboxId*(httpClient: HttpClient, inboxId: string, page: int, size: int, sort: string, since: string, before: string): (Option[PageScheduledJobs], Response) =
  ## Get all scheduled email sending jobs for the inbox
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in scheduled job list pagination
    ("size", $size), # Optional page size in scheduled job list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("since", $since), # Filter by created at after the given timestamp
    ("before", $before), # Filter by created at before the given timestamp
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/scheduled-jobs" & "?" & query_for_api_call)
  constructResult[PageScheduledJobs](response)


proc listInboxRulesets*(httpClient: HttpClient, inboxId: string, page: int, size: int, sort: string, searchFilter: string, since: string, before: string): (Option[PageInboxRulesetDto], Response) =
  ## List inbox rulesets
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in inbox ruleset list pagination
    ("size", $size), # Optional page size in inbox ruleset list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("searchFilter", $searchFilter), # Optional search filter
    ("since", $since), # Optional filter by created after given date time
    ("before", $before), # Optional filter by created before given date time
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/rulesets" & "?" & query_for_api_call)
  constructResult[PageInboxRulesetDto](response)


proc listInboxTrackingPixels*(httpClient: HttpClient, inboxId: string, page: int, size: int, sort: string, searchFilter: string, since: string, before: string): (Option[PageTrackingPixelProjection], Response) =
  ## List inbox tracking pixels
  let query_for_api_call = encodeQuery([
    ("page", $page), # Optional page index in inbox tracking pixel list pagination
    ("size", $size), # Optional page size in inbox tracking pixel list pagination
    ("sort", $sort), # Optional createdAt sort direction ASC or DESC
    ("searchFilter", $searchFilter), # Optional search filter
    ("since", $since), # Optional filter by created after given date time
    ("before", $before), # Optional filter by created before given date time
  ])

  let response = httpClient.get(basepath & fmt"/inboxes/{inboxId}/tracking-pixels" & "?" & query_for_api_call)
  constructResult[PageTrackingPixelProjection](response)


proc sendEmail*(httpClient: HttpClient, inboxId: string, SendEmailOptions: SendEmailOptions): Response =
  ## Send Email
  httpClient.headers["Content-Type"] = "application/json"
  httpClient.post(basepath & fmt"/inboxes/{inboxId}", $(%SendEmailOptions))


proc sendEmailAndConfirm*(httpClient: HttpClient, inboxId: string, SendEmailOptions: SendEmailOptions): (Option[SentEmailDto], Response) =
  ## Send email and return sent confirmation
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & fmt"/inboxes/{inboxId}/confirm", $(%SendEmailOptions))
  constructResult[SentEmailDto](response)


proc sendEmailWithQueue*(httpClient: HttpClient, inboxId: string, validateBeforeEnqueue: bool, SendEmailOptions: SendEmailOptions): Response =
  ## Send email with queue
  httpClient.headers["Content-Type"] = "application/json"
  let query_for_api_call = encodeQuery([
    ("validateBeforeEnqueue", $validateBeforeEnqueue), # Validate before adding to queue
  ])
  httpClient.post(basepath & fmt"/inboxes/{inboxId}/with-queue" & "?" & query_for_api_call, $(%SendEmailOptions))


proc sendSmtpEnvelope*(httpClient: HttpClient, inboxId: string, SendSMTPEnvelopeOptions: SendSMTPEnvelopeOptions): (Option[SentEmailDto], Response) =
  ## Send email using an SMTP mail envelope and message body and return sent confirmation
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.post(basepath & fmt"/inboxes/{inboxId}/smtp-envelope", $(%SendSMTPEnvelopeOptions))
  constructResult[SentEmailDto](response)


proc sendTestEmail*(httpClient: HttpClient, inboxId: string): Response =
  ## Send a test email to inbox
  httpClient.post(basepath & fmt"/inboxes/{inboxId}/send-test-email")


proc sendWithSchedule*(httpClient: HttpClient, inboxId: string, SendEmailOptions: SendEmailOptions, sendAtTimestamp: string, sendAtNowPlusSeconds: int64, validateBeforeEnqueue: bool): (Option[ScheduledJobDto], Response) =
  ## Send email with with delay or schedule
  httpClient.headers["Content-Type"] = "application/json"
  let query_for_api_call = encodeQuery([
    ("sendAtTimestamp", $sendAtTimestamp), # Sending timestamp
    ("sendAtNowPlusSeconds", $sendAtNowPlusSeconds), # Send after n seconds
    ("validateBeforeEnqueue", $validateBeforeEnqueue), # Validate before adding to queue
  ])

  let response = httpClient.post(basepath & fmt"/inboxes/{inboxId}/with-schedule" & "?" & query_for_api_call, $(%SendEmailOptions))
  constructResult[ScheduledJobDto](response)


proc setInboxFavourited*(httpClient: HttpClient, inboxId: string, SetInboxFavouritedOptions: SetInboxFavouritedOptions): (Option[InboxDto], Response) =
  ## Set inbox favourited state
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.put(basepath & fmt"/inboxes/{inboxId}/favourite", $(%SetInboxFavouritedOptions))
  constructResult[InboxDto](response)


proc updateInbox*(httpClient: HttpClient, inboxId: string, UpdateInboxOptions: UpdateInboxOptions): (Option[InboxDto], Response) =
  ## Update Inbox. Change name and description. Email address is not editable.
  httpClient.headers["Content-Type"] = "application/json"

  let response = httpClient.patch(basepath & fmt"/inboxes/{inboxId}", $(%UpdateInboxOptions))
  constructResult[InboxDto](response)

