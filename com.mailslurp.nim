#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.  ## Resources  - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://docs.mailslurp.com/) - [Examples](https://github.com/mailslurp/examples) repository
# The version of the OpenAPI document: 6.5.2
# Contact: contact@mailslurp.dev
# Generated by: https://openapi-generator.tech
#

# Models
import com.mailslurp/models/model_abstract_webhook_payload
import com.mailslurp/models/model_alias_dto
import com.mailslurp/models/model_alias_projection
import com.mailslurp/models/model_attachment_entity
import com.mailslurp/models/model_attachment_meta_data
import com.mailslurp/models/model_attachment_projection
import com.mailslurp/models/model_basic_auth_options
import com.mailslurp/models/model_bounce_projection
import com.mailslurp/models/model_bounce_recipient
import com.mailslurp/models/model_bounced_email_dto
import com.mailslurp/models/model_bounced_recipient_dto
import com.mailslurp/models/model_bulk_send_email_options
import com.mailslurp/models/model_condition_option
import com.mailslurp/models/model_contact_dto
import com.mailslurp/models/model_contact_projection
import com.mailslurp/models/model_content_match_options
import com.mailslurp/models/model_count_dto
import com.mailslurp/models/model_create_alias_options
import com.mailslurp/models/model_create_contact_options
import com.mailslurp/models/model_create_domain_options
import com.mailslurp/models/model_create_emergency_address_options
import com.mailslurp/models/model_create_group_options
import com.mailslurp/models/model_create_inbox_dto
import com.mailslurp/models/model_create_inbox_forwarder_options
import com.mailslurp/models/model_create_inbox_ruleset_options
import com.mailslurp/models/model_create_template_options
import com.mailslurp/models/model_create_tracking_pixel_options
import com.mailslurp/models/model_create_webhook_options
import com.mailslurp/models/model_dns_lookup_options
import com.mailslurp/models/model_dns_lookup_result
import com.mailslurp/models/model_dns_lookup_results
import com.mailslurp/models/model_describe_domain_options
import com.mailslurp/models/model_describe_mail_server_domain_result
import com.mailslurp/models/model_domain_dto
import com.mailslurp/models/model_domain_name_record
import com.mailslurp/models/model_domain_preview
import com.mailslurp/models/model_download_attachment_dto
import com.mailslurp/models/model_email
import com.mailslurp/models/model_email_analysis
import com.mailslurp/models/model_email_content_match_result
import com.mailslurp/models/model_email_html_dto
import com.mailslurp/models/model_email_links_result
import com.mailslurp/models/model_email_preview
import com.mailslurp/models/model_email_preview_urls
import com.mailslurp/models/model_email_projection
import com.mailslurp/models/model_email_recipients
import com.mailslurp/models/model_email_text_lines_result
import com.mailslurp/models/model_email_validation_request
import com.mailslurp/models/model_email_verification_result
import com.mailslurp/models/model_emergency_address
import com.mailslurp/models/model_emergency_address_dto
import com.mailslurp/models/model_empty_response_dto
import com.mailslurp/models/model_expiration_defaults
import com.mailslurp/models/model_expired_inbox_dto
import com.mailslurp/models/model_expired_inbox_record_projection
import com.mailslurp/models/model_export_link
import com.mailslurp/models/model_export_options
import com.mailslurp/models/model_filter_bounced_recipients_options
import com.mailslurp/models/model_filter_bounced_recipients_result
import com.mailslurp/models/model_flush_expired_inboxes_result
import com.mailslurp/models/model_forward_email_options
import com.mailslurp/models/model_gravatar_url
import com.mailslurp/models/model_group_contacts_dto
import com.mailslurp/models/model_group_dto
import com.mailslurp/models/model_group_projection
import com.mailslurp/models/model_html_validation_result
import com.mailslurp/models/model_ip_address_result
import com.mailslurp/models/model_imap_flag_operation_options
import com.mailslurp/models/model_imap_smtp_access_details
import com.mailslurp/models/model_inbox_by_email_address_result
import com.mailslurp/models/model_inbox_dto
import com.mailslurp/models/model_inbox_exists_dto
import com.mailslurp/models/model_inbox_forwarder_dto
import com.mailslurp/models/model_inbox_forwarder_test_options
import com.mailslurp/models/model_inbox_forwarder_test_result
import com.mailslurp/models/model_inbox_id_item
import com.mailslurp/models/model_inbox_ids_result
import com.mailslurp/models/model_inbox_preview
import com.mailslurp/models/model_inbox_ruleset_dto
import com.mailslurp/models/model_inbox_ruleset_test_options
import com.mailslurp/models/model_inbox_ruleset_test_result
import com.mailslurp/models/model_inline_object
import com.mailslurp/models/model_inline_object_1
import com.mailslurp/models/model_json_schema_dto
import com.mailslurp/models/model_match_option
import com.mailslurp/models/model_match_options
import com.mailslurp/models/model_missed_email
import com.mailslurp/models/model_missed_email_projection
import com.mailslurp/models/model_name_server_record
import com.mailslurp/models/model_organization_inbox_projection
import com.mailslurp/models/model_page_alias
import com.mailslurp/models/model_page_attachment_entity
import com.mailslurp/models/model_page_bounced_email
import com.mailslurp/models/model_page_bounced_recipients
import com.mailslurp/models/model_page_contact_projection
import com.mailslurp/models/model_page_email_preview
import com.mailslurp/models/model_page_email_projection
import com.mailslurp/models/model_page_email_validation_request
import com.mailslurp/models/model_page_expired_inbox_record_projection
import com.mailslurp/models/model_page_group_projection
import com.mailslurp/models/model_page_inbox_forwarder_dto
import com.mailslurp/models/model_page_inbox_projection
import com.mailslurp/models/model_page_inbox_ruleset_dto
import com.mailslurp/models/model_page_missed_email_projection
import com.mailslurp/models/model_page_organization_inbox_projection
import com.mailslurp/models/model_page_phone_number_projection
import com.mailslurp/models/model_page_sent_email_projection
import com.mailslurp/models/model_page_sent_email_with_queue_projection
import com.mailslurp/models/model_page_sms_projection
import com.mailslurp/models/model_page_template_projection
import com.mailslurp/models/model_page_thread_projection
import com.mailslurp/models/model_page_tracking_pixel_projection
import com.mailslurp/models/model_page_unknown_missed_email_projection
import com.mailslurp/models/model_page_webhook_projection
import com.mailslurp/models/model_page_webhook_result
import com.mailslurp/models/model_pageable_object
import com.mailslurp/models/model_phone_number_dto
import com.mailslurp/models/model_phone_number_projection
import com.mailslurp/models/model_phone_plan_dto
import com.mailslurp/models/model_raw_email_json
import com.mailslurp/models/model_recipient
import com.mailslurp/models/model_reply_to_alias_email_options
import com.mailslurp/models/model_reply_to_email_options
import com.mailslurp/models/model_send_email_options
import com.mailslurp/models/model_send_smtp_envelope_options
import com.mailslurp/models/model_send_with_queue_result
import com.mailslurp/models/model_sender
import com.mailslurp/models/model_sent_email_dto
import com.mailslurp/models/model_sent_email_projection
import com.mailslurp/models/model_set_inbox_favourited_options
import com.mailslurp/models/model_simple_send_email_options
import com.mailslurp/models/model_sms_match_option
import com.mailslurp/models/model_sms_message
import com.mailslurp/models/model_sms_preview
import com.mailslurp/models/model_sms_projection
import com.mailslurp/models/model_sort
import com.mailslurp/models/model_template_dto
import com.mailslurp/models/model_template_projection
import com.mailslurp/models/model_template_variable
import com.mailslurp/models/model_test_new_inbox_forwarder_options
import com.mailslurp/models/model_test_new_inbox_ruleset_options
import com.mailslurp/models/model_thread_projection
import com.mailslurp/models/model_tracking_pixel_dto
import com.mailslurp/models/model_tracking_pixel_projection
import com.mailslurp/models/model_unknown_missed_email_projection
import com.mailslurp/models/model_unread_count
import com.mailslurp/models/model_unseen_error_count_dto
import com.mailslurp/models/model_update_alias_options
import com.mailslurp/models/model_update_domain_options
import com.mailslurp/models/model_update_group_contacts
import com.mailslurp/models/model_update_inbox_options
import com.mailslurp/models/model_upload_attachment_options
import com.mailslurp/models/model_validate_email_address_list_options
import com.mailslurp/models/model_validate_email_address_list_result
import com.mailslurp/models/model_validation_dto
import com.mailslurp/models/model_validation_message
import com.mailslurp/models/model_verify_email_address_options
import com.mailslurp/models/model_verify_webhook_signature_options
import com.mailslurp/models/model_verify_webhook_signature_results
import com.mailslurp/models/model_wait_for_conditions
import com.mailslurp/models/model_wait_for_sms_conditions
import com.mailslurp/models/model_webhook_bounce_payload
import com.mailslurp/models/model_webhook_bounce_recipient_payload
import com.mailslurp/models/model_webhook_dto
import com.mailslurp/models/model_webhook_email_opened_payload
import com.mailslurp/models/model_webhook_email_read_payload
import com.mailslurp/models/model_webhook_new_attachment_payload
import com.mailslurp/models/model_webhook_new_contact_payload
import com.mailslurp/models/model_webhook_new_email_payload
import com.mailslurp/models/model_webhook_projection
import com.mailslurp/models/model_webhook_redrive_result
import com.mailslurp/models/model_webhook_result_dto
import com.mailslurp/models/model_webhook_test_request
import com.mailslurp/models/model_webhook_test_response
import com.mailslurp/models/model_webhook_test_result

export model_abstract_webhook_payload
export model_alias_dto
export model_alias_projection
export model_attachment_entity
export model_attachment_meta_data
export model_attachment_projection
export model_basic_auth_options
export model_bounce_projection
export model_bounce_recipient
export model_bounced_email_dto
export model_bounced_recipient_dto
export model_bulk_send_email_options
export model_condition_option
export model_contact_dto
export model_contact_projection
export model_content_match_options
export model_count_dto
export model_create_alias_options
export model_create_contact_options
export model_create_domain_options
export model_create_emergency_address_options
export model_create_group_options
export model_create_inbox_dto
export model_create_inbox_forwarder_options
export model_create_inbox_ruleset_options
export model_create_template_options
export model_create_tracking_pixel_options
export model_create_webhook_options
export model_dns_lookup_options
export model_dns_lookup_result
export model_dns_lookup_results
export model_describe_domain_options
export model_describe_mail_server_domain_result
export model_domain_dto
export model_domain_name_record
export model_domain_preview
export model_download_attachment_dto
export model_email
export model_email_analysis
export model_email_content_match_result
export model_email_html_dto
export model_email_links_result
export model_email_preview
export model_email_preview_urls
export model_email_projection
export model_email_recipients
export model_email_text_lines_result
export model_email_validation_request
export model_email_verification_result
export model_emergency_address
export model_emergency_address_dto
export model_empty_response_dto
export model_expiration_defaults
export model_expired_inbox_dto
export model_expired_inbox_record_projection
export model_export_link
export model_export_options
export model_filter_bounced_recipients_options
export model_filter_bounced_recipients_result
export model_flush_expired_inboxes_result
export model_forward_email_options
export model_gravatar_url
export model_group_contacts_dto
export model_group_dto
export model_group_projection
export model_html_validation_result
export model_ip_address_result
export model_imap_flag_operation_options
export model_imap_smtp_access_details
export model_inbox_by_email_address_result
export model_inbox_dto
export model_inbox_exists_dto
export model_inbox_forwarder_dto
export model_inbox_forwarder_test_options
export model_inbox_forwarder_test_result
export model_inbox_id_item
export model_inbox_ids_result
export model_inbox_preview
export model_inbox_ruleset_dto
export model_inbox_ruleset_test_options
export model_inbox_ruleset_test_result
export model_inline_object
export model_inline_object_1
export model_json_schema_dto
export model_match_option
export model_match_options
export model_missed_email
export model_missed_email_projection
export model_name_server_record
export model_organization_inbox_projection
export model_page_alias
export model_page_attachment_entity
export model_page_bounced_email
export model_page_bounced_recipients
export model_page_contact_projection
export model_page_email_preview
export model_page_email_projection
export model_page_email_validation_request
export model_page_expired_inbox_record_projection
export model_page_group_projection
export model_page_inbox_forwarder_dto
export model_page_inbox_projection
export model_page_inbox_ruleset_dto
export model_page_missed_email_projection
export model_page_organization_inbox_projection
export model_page_phone_number_projection
export model_page_sent_email_projection
export model_page_sent_email_with_queue_projection
export model_page_sms_projection
export model_page_template_projection
export model_page_thread_projection
export model_page_tracking_pixel_projection
export model_page_unknown_missed_email_projection
export model_page_webhook_projection
export model_page_webhook_result
export model_pageable_object
export model_phone_number_dto
export model_phone_number_projection
export model_phone_plan_dto
export model_raw_email_json
export model_recipient
export model_reply_to_alias_email_options
export model_reply_to_email_options
export model_send_email_options
export model_send_smtp_envelope_options
export model_send_with_queue_result
export model_sender
export model_sent_email_dto
export model_sent_email_projection
export model_set_inbox_favourited_options
export model_simple_send_email_options
export model_sms_match_option
export model_sms_message
export model_sms_preview
export model_sms_projection
export model_sort
export model_template_dto
export model_template_projection
export model_template_variable
export model_test_new_inbox_forwarder_options
export model_test_new_inbox_ruleset_options
export model_thread_projection
export model_tracking_pixel_dto
export model_tracking_pixel_projection
export model_unknown_missed_email_projection
export model_unread_count
export model_unseen_error_count_dto
export model_update_alias_options
export model_update_domain_options
export model_update_group_contacts
export model_update_inbox_options
export model_upload_attachment_options
export model_validate_email_address_list_options
export model_validate_email_address_list_result
export model_validation_dto
export model_validation_message
export model_verify_email_address_options
export model_verify_webhook_signature_options
export model_verify_webhook_signature_results
export model_wait_for_conditions
export model_wait_for_sms_conditions
export model_webhook_bounce_payload
export model_webhook_bounce_recipient_payload
export model_webhook_dto
export model_webhook_email_opened_payload
export model_webhook_email_read_payload
export model_webhook_new_attachment_payload
export model_webhook_new_contact_payload
export model_webhook_new_email_payload
export model_webhook_projection
export model_webhook_redrive_result
export model_webhook_result_dto
export model_webhook_test_request
export model_webhook_test_response
export model_webhook_test_result

# APIs
import com.mailslurp/apis/api_alias_controller
import com.mailslurp/apis/api_attachment_controller
import com.mailslurp/apis/api_bounce_controller
import com.mailslurp/apis/api_bulk_actions_controller
import com.mailslurp/apis/api_common_actions_controller
import com.mailslurp/apis/api_contact_controller
import com.mailslurp/apis/api_domain_controller
import com.mailslurp/apis/api_email_controller
import com.mailslurp/apis/api_email_verification_controller
import com.mailslurp/apis/api_expired_controller
import com.mailslurp/apis/api_export_controller
import com.mailslurp/apis/api_form_controller
import com.mailslurp/apis/api_group_controller
import com.mailslurp/apis/api_inbox_controller
import com.mailslurp/apis/api_inbox_forwarder_controller
import com.mailslurp/apis/api_inbox_ruleset_controller
import com.mailslurp/apis/api_mail_server_controller
import com.mailslurp/apis/api_missed_email_controller
import com.mailslurp/apis/api_phone_controller
import com.mailslurp/apis/api_sent_emails_controller
import com.mailslurp/apis/api_sms_controller
import com.mailslurp/apis/api_template_controller
import com.mailslurp/apis/api_tracking_controller
import com.mailslurp/apis/api_wait_for_controller
import com.mailslurp/apis/api_webhook_controller

export api_alias_controller
export api_attachment_controller
export api_bounce_controller
export api_bulk_actions_controller
export api_common_actions_controller
export api_contact_controller
export api_domain_controller
export api_email_controller
export api_email_verification_controller
export api_expired_controller
export api_export_controller
export api_form_controller
export api_group_controller
export api_inbox_controller
export api_inbox_forwarder_controller
export api_inbox_ruleset_controller
export api_mail_server_controller
export api_missed_email_controller
export api_phone_controller
export api_sent_emails_controller
export api_sms_controller
export api_template_controller
export api_tracking_controller
export api_wait_for_controller
export api_webhook_controller
