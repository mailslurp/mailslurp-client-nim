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


type `Type`* {.pure.} = enum
  A
  NS
  MD
  MF
  CNAME
  SOA
  MB
  MG
  MR
  NULL
  WKS
  PTR
  HINFO
  MINFO
  MX
  TXT
  RP
  AFSDB
  X25
  ISDN
  RT
  NSAP
  NSAPPTR
  SIG
  KEY
  PX
  GPOS
  AAAA
  LOC
  NXT
  EID
  NIMLOC
  SRV
  ATMA
  NAPTR
  KX
  CERT
  A6
  DNAME
  SINK
  OPT
  APL
  DS
  SSHFP
  IPSECKEY
  RRSIG
  NSEC
  DNSKEY
  DHCID
  NSEC3
  NSEC3PARAM
  TLSA
  SMIMEA
  HIP
  NINFO
  RKEY
  TALINK
  CDS
  CDNSKEY
  OPENPGPKEY
  CSYNC
  ZONEMD
  SVCB
  HTTPS
  SPF
  UINFO
  UID
  GID
  UNSPEC
  NID
  L32
  L64
  LP
  EUI48
  EUI64
  TKEY
  TSIG
  IXFR
  AXFR
  MAILB
  MAILA
  ANY
  URI
  CAA
  AVC
  DOA
  AMTRELAY
  TA
  DLV

type GenerateTlsReportingRecordResults* = object
  ## 
  name*: string
  `type`*: `Type` ## Domain Name Server Record Types
  ttl*: int
  value*: string

func `%`*(v: `Type`): JsonNode =
  let str = case v:
    of `Type`.A: "A"
    of `Type`.NS: "NS"
    of `Type`.MD: "MD"
    of `Type`.MF: "MF"
    of `Type`.CNAME: "CNAME"
    of `Type`.SOA: "SOA"
    of `Type`.MB: "MB"
    of `Type`.MG: "MG"
    of `Type`.MR: "MR"
    of `Type`.NULL: "NULL"
    of `Type`.WKS: "WKS"
    of `Type`.PTR: "PTR"
    of `Type`.HINFO: "HINFO"
    of `Type`.MINFO: "MINFO"
    of `Type`.MX: "MX"
    of `Type`.TXT: "TXT"
    of `Type`.RP: "RP"
    of `Type`.AFSDB: "AFSDB"
    of `Type`.X25: "X25"
    of `Type`.ISDN: "ISDN"
    of `Type`.RT: "RT"
    of `Type`.NSAP: "NSAP"
    of `Type`.NSAPPTR: "NSAP_PTR"
    of `Type`.SIG: "SIG"
    of `Type`.KEY: "KEY"
    of `Type`.PX: "PX"
    of `Type`.GPOS: "GPOS"
    of `Type`.AAAA: "AAAA"
    of `Type`.LOC: "LOC"
    of `Type`.NXT: "NXT"
    of `Type`.EID: "EID"
    of `Type`.NIMLOC: "NIMLOC"
    of `Type`.SRV: "SRV"
    of `Type`.ATMA: "ATMA"
    of `Type`.NAPTR: "NAPTR"
    of `Type`.KX: "KX"
    of `Type`.CERT: "CERT"
    of `Type`.A6: "A6"
    of `Type`.DNAME: "DNAME"
    of `Type`.SINK: "SINK"
    of `Type`.OPT: "OPT"
    of `Type`.APL: "APL"
    of `Type`.DS: "DS"
    of `Type`.SSHFP: "SSHFP"
    of `Type`.IPSECKEY: "IPSECKEY"
    of `Type`.RRSIG: "RRSIG"
    of `Type`.NSEC: "NSEC"
    of `Type`.DNSKEY: "DNSKEY"
    of `Type`.DHCID: "DHCID"
    of `Type`.NSEC3: "NSEC3"
    of `Type`.NSEC3PARAM: "NSEC3PARAM"
    of `Type`.TLSA: "TLSA"
    of `Type`.SMIMEA: "SMIMEA"
    of `Type`.HIP: "HIP"
    of `Type`.NINFO: "NINFO"
    of `Type`.RKEY: "RKEY"
    of `Type`.TALINK: "TALINK"
    of `Type`.CDS: "CDS"
    of `Type`.CDNSKEY: "CDNSKEY"
    of `Type`.OPENPGPKEY: "OPENPGPKEY"
    of `Type`.CSYNC: "CSYNC"
    of `Type`.ZONEMD: "ZONEMD"
    of `Type`.SVCB: "SVCB"
    of `Type`.HTTPS: "HTTPS"
    of `Type`.SPF: "SPF"
    of `Type`.UINFO: "UINFO"
    of `Type`.UID: "UID"
    of `Type`.GID: "GID"
    of `Type`.UNSPEC: "UNSPEC"
    of `Type`.NID: "NID"
    of `Type`.L32: "L32"
    of `Type`.L64: "L64"
    of `Type`.LP: "LP"
    of `Type`.EUI48: "EUI48"
    of `Type`.EUI64: "EUI64"
    of `Type`.TKEY: "TKEY"
    of `Type`.TSIG: "TSIG"
    of `Type`.IXFR: "IXFR"
    of `Type`.AXFR: "AXFR"
    of `Type`.MAILB: "MAILB"
    of `Type`.MAILA: "MAILA"
    of `Type`.ANY: "ANY"
    of `Type`.URI: "URI"
    of `Type`.CAA: "CAA"
    of `Type`.AVC: "AVC"
    of `Type`.DOA: "DOA"
    of `Type`.AMTRELAY: "AMTRELAY"
    of `Type`.TA: "TA"
    of `Type`.DLV: "DLV"

  JsonNode(kind: JString, str: str)

func `$`*(v: `Type`): string =
  result = case v:
    of `Type`.A: "A"
    of `Type`.NS: "NS"
    of `Type`.MD: "MD"
    of `Type`.MF: "MF"
    of `Type`.CNAME: "CNAME"
    of `Type`.SOA: "SOA"
    of `Type`.MB: "MB"
    of `Type`.MG: "MG"
    of `Type`.MR: "MR"
    of `Type`.NULL: "NULL"
    of `Type`.WKS: "WKS"
    of `Type`.PTR: "PTR"
    of `Type`.HINFO: "HINFO"
    of `Type`.MINFO: "MINFO"
    of `Type`.MX: "MX"
    of `Type`.TXT: "TXT"
    of `Type`.RP: "RP"
    of `Type`.AFSDB: "AFSDB"
    of `Type`.X25: "X25"
    of `Type`.ISDN: "ISDN"
    of `Type`.RT: "RT"
    of `Type`.NSAP: "NSAP"
    of `Type`.NSAPPTR: "NSAP_PTR"
    of `Type`.SIG: "SIG"
    of `Type`.KEY: "KEY"
    of `Type`.PX: "PX"
    of `Type`.GPOS: "GPOS"
    of `Type`.AAAA: "AAAA"
    of `Type`.LOC: "LOC"
    of `Type`.NXT: "NXT"
    of `Type`.EID: "EID"
    of `Type`.NIMLOC: "NIMLOC"
    of `Type`.SRV: "SRV"
    of `Type`.ATMA: "ATMA"
    of `Type`.NAPTR: "NAPTR"
    of `Type`.KX: "KX"
    of `Type`.CERT: "CERT"
    of `Type`.A6: "A6"
    of `Type`.DNAME: "DNAME"
    of `Type`.SINK: "SINK"
    of `Type`.OPT: "OPT"
    of `Type`.APL: "APL"
    of `Type`.DS: "DS"
    of `Type`.SSHFP: "SSHFP"
    of `Type`.IPSECKEY: "IPSECKEY"
    of `Type`.RRSIG: "RRSIG"
    of `Type`.NSEC: "NSEC"
    of `Type`.DNSKEY: "DNSKEY"
    of `Type`.DHCID: "DHCID"
    of `Type`.NSEC3: "NSEC3"
    of `Type`.NSEC3PARAM: "NSEC3PARAM"
    of `Type`.TLSA: "TLSA"
    of `Type`.SMIMEA: "SMIMEA"
    of `Type`.HIP: "HIP"
    of `Type`.NINFO: "NINFO"
    of `Type`.RKEY: "RKEY"
    of `Type`.TALINK: "TALINK"
    of `Type`.CDS: "CDS"
    of `Type`.CDNSKEY: "CDNSKEY"
    of `Type`.OPENPGPKEY: "OPENPGPKEY"
    of `Type`.CSYNC: "CSYNC"
    of `Type`.ZONEMD: "ZONEMD"
    of `Type`.SVCB: "SVCB"
    of `Type`.HTTPS: "HTTPS"
    of `Type`.SPF: "SPF"
    of `Type`.UINFO: "UINFO"
    of `Type`.UID: "UID"
    of `Type`.GID: "GID"
    of `Type`.UNSPEC: "UNSPEC"
    of `Type`.NID: "NID"
    of `Type`.L32: "L32"
    of `Type`.L64: "L64"
    of `Type`.LP: "LP"
    of `Type`.EUI48: "EUI48"
    of `Type`.EUI64: "EUI64"
    of `Type`.TKEY: "TKEY"
    of `Type`.TSIG: "TSIG"
    of `Type`.IXFR: "IXFR"
    of `Type`.AXFR: "AXFR"
    of `Type`.MAILB: "MAILB"
    of `Type`.MAILA: "MAILA"
    of `Type`.ANY: "ANY"
    of `Type`.URI: "URI"
    of `Type`.CAA: "CAA"
    of `Type`.AVC: "AVC"
    of `Type`.DOA: "DOA"
    of `Type`.AMTRELAY: "AMTRELAY"
    of `Type`.TA: "TA"
    of `Type`.DLV: "DLV"
