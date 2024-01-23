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

import model_email_feature_version_statistics

type Platform* {.pure.} = enum
  Android
  DesktopApp
  DesktopWebmail
  Ios
  Macos
  MobileWebmail
  OutlookCom
  Webmail
  Windows
  WindowsMail

type EmailFeaturePlatformStatistics* = object
  ## 
  platform*: Platform
  versions*: seq[EmailFeatureVersionStatistics]

func `%`*(v: Platform): JsonNode =
  let str = case v:
    of Platform.Android: "android"
    of Platform.DesktopApp: "desktop-app"
    of Platform.DesktopWebmail: "desktop-webmail"
    of Platform.Ios: "ios"
    of Platform.Macos: "macos"
    of Platform.MobileWebmail: "mobile-webmail"
    of Platform.OutlookCom: "outlook-com"
    of Platform.Webmail: "webmail"
    of Platform.Windows: "windows"
    of Platform.WindowsMail: "windows-mail"

  JsonNode(kind: JString, str: str)

func `$`*(v: Platform): string =
  result = case v:
    of Platform.Android: "android"
    of Platform.DesktopApp: "desktop-app"
    of Platform.DesktopWebmail: "desktop-webmail"
    of Platform.Ios: "ios"
    of Platform.Macos: "macos"
    of Platform.MobileWebmail: "mobile-webmail"
    of Platform.OutlookCom: "outlook-com"
    of Platform.Webmail: "webmail"
    of Platform.Windows: "windows"
    of Platform.WindowsMail: "windows-mail"
