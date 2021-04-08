#
# MailSlurp API
# 
# MailSlurp is an API for sending and receiving emails from dynamically allocated email addresses. It's designed for developers and QA teams to test applications, process inbound emails, send templated notifications, attachments, and more.   ## Resources - [Homepage](https://www.mailslurp.com) - Get an [API KEY](https://app.mailslurp.com/sign-up/) - Generated [SDK Clients](https://www.mailslurp.com/docs/) - [Examples](https://github.com/mailslurp/examples) repository 
# The version of the OpenAPI document: 6.5.2
# 
# Generated by: https://openapi-generator.tech
#

import json
import tables


type RecordType* {.pure.} = enum
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

type DomainNameRecord* = object
  ## DNS Record required for verification of a domain
  name*: string
  recordEntries*: seq[string]
  recordType*: RecordType
  ttl*: int64

func `%`*(v: RecordType): JsonNode =
  let str = case v:
    of RecordType.A: "A"
    of RecordType.NS: "NS"
    of RecordType.MD: "MD"
    of RecordType.MF: "MF"
    of RecordType.CNAME: "CNAME"
    of RecordType.SOA: "SOA"
    of RecordType.MB: "MB"
    of RecordType.MG: "MG"
    of RecordType.MR: "MR"
    of RecordType.NULL: "NULL"
    of RecordType.WKS: "WKS"
    of RecordType.PTR: "PTR"
    of RecordType.HINFO: "HINFO"
    of RecordType.MINFO: "MINFO"
    of RecordType.MX: "MX"
    of RecordType.TXT: "TXT"
    of RecordType.RP: "RP"
    of RecordType.AFSDB: "AFSDB"
    of RecordType.X25: "X25"
    of RecordType.ISDN: "ISDN"
    of RecordType.RT: "RT"
    of RecordType.NSAP: "NSAP"
    of RecordType.NSAPPTR: "NSAP_PTR"
    of RecordType.SIG: "SIG"
    of RecordType.KEY: "KEY"
    of RecordType.PX: "PX"
    of RecordType.GPOS: "GPOS"
    of RecordType.AAAA: "AAAA"
    of RecordType.LOC: "LOC"
    of RecordType.NXT: "NXT"
    of RecordType.EID: "EID"
    of RecordType.NIMLOC: "NIMLOC"
    of RecordType.SRV: "SRV"
    of RecordType.ATMA: "ATMA"
    of RecordType.NAPTR: "NAPTR"
    of RecordType.KX: "KX"
    of RecordType.CERT: "CERT"
    of RecordType.A6: "A6"
    of RecordType.DNAME: "DNAME"
    of RecordType.SINK: "SINK"
    of RecordType.OPT: "OPT"
    of RecordType.APL: "APL"
    of RecordType.DS: "DS"
    of RecordType.SSHFP: "SSHFP"
    of RecordType.IPSECKEY: "IPSECKEY"
    of RecordType.RRSIG: "RRSIG"
    of RecordType.NSEC: "NSEC"
    of RecordType.DNSKEY: "DNSKEY"
    of RecordType.DHCID: "DHCID"
    of RecordType.NSEC3: "NSEC3"
    of RecordType.NSEC3PARAM: "NSEC3PARAM"
    of RecordType.TLSA: "TLSA"
    of RecordType.SMIMEA: "SMIMEA"
    of RecordType.HIP: "HIP"
    of RecordType.NINFO: "NINFO"
    of RecordType.RKEY: "RKEY"
    of RecordType.TALINK: "TALINK"
    of RecordType.CDS: "CDS"
    of RecordType.CDNSKEY: "CDNSKEY"
    of RecordType.OPENPGPKEY: "OPENPGPKEY"
    of RecordType.CSYNC: "CSYNC"
    of RecordType.ZONEMD: "ZONEMD"
    of RecordType.SVCB: "SVCB"
    of RecordType.HTTPS: "HTTPS"
    of RecordType.SPF: "SPF"
    of RecordType.UINFO: "UINFO"
    of RecordType.UID: "UID"
    of RecordType.GID: "GID"
    of RecordType.UNSPEC: "UNSPEC"
    of RecordType.NID: "NID"
    of RecordType.L32: "L32"
    of RecordType.L64: "L64"
    of RecordType.LP: "LP"
    of RecordType.EUI48: "EUI48"
    of RecordType.EUI64: "EUI64"
    of RecordType.TKEY: "TKEY"
    of RecordType.TSIG: "TSIG"
    of RecordType.IXFR: "IXFR"
    of RecordType.AXFR: "AXFR"
    of RecordType.MAILB: "MAILB"
    of RecordType.MAILA: "MAILA"
    of RecordType.ANY: "ANY"
    of RecordType.URI: "URI"
    of RecordType.CAA: "CAA"
    of RecordType.AVC: "AVC"
    of RecordType.DOA: "DOA"
    of RecordType.AMTRELAY: "AMTRELAY"
    of RecordType.TA: "TA"
    of RecordType.DLV: "DLV"

  JsonNode(kind: JString, str: str)

func `$`*(v: RecordType): string =
  result = case v:
    of RecordType.A: "A"
    of RecordType.NS: "NS"
    of RecordType.MD: "MD"
    of RecordType.MF: "MF"
    of RecordType.CNAME: "CNAME"
    of RecordType.SOA: "SOA"
    of RecordType.MB: "MB"
    of RecordType.MG: "MG"
    of RecordType.MR: "MR"
    of RecordType.NULL: "NULL"
    of RecordType.WKS: "WKS"
    of RecordType.PTR: "PTR"
    of RecordType.HINFO: "HINFO"
    of RecordType.MINFO: "MINFO"
    of RecordType.MX: "MX"
    of RecordType.TXT: "TXT"
    of RecordType.RP: "RP"
    of RecordType.AFSDB: "AFSDB"
    of RecordType.X25: "X25"
    of RecordType.ISDN: "ISDN"
    of RecordType.RT: "RT"
    of RecordType.NSAP: "NSAP"
    of RecordType.NSAPPTR: "NSAP_PTR"
    of RecordType.SIG: "SIG"
    of RecordType.KEY: "KEY"
    of RecordType.PX: "PX"
    of RecordType.GPOS: "GPOS"
    of RecordType.AAAA: "AAAA"
    of RecordType.LOC: "LOC"
    of RecordType.NXT: "NXT"
    of RecordType.EID: "EID"
    of RecordType.NIMLOC: "NIMLOC"
    of RecordType.SRV: "SRV"
    of RecordType.ATMA: "ATMA"
    of RecordType.NAPTR: "NAPTR"
    of RecordType.KX: "KX"
    of RecordType.CERT: "CERT"
    of RecordType.A6: "A6"
    of RecordType.DNAME: "DNAME"
    of RecordType.SINK: "SINK"
    of RecordType.OPT: "OPT"
    of RecordType.APL: "APL"
    of RecordType.DS: "DS"
    of RecordType.SSHFP: "SSHFP"
    of RecordType.IPSECKEY: "IPSECKEY"
    of RecordType.RRSIG: "RRSIG"
    of RecordType.NSEC: "NSEC"
    of RecordType.DNSKEY: "DNSKEY"
    of RecordType.DHCID: "DHCID"
    of RecordType.NSEC3: "NSEC3"
    of RecordType.NSEC3PARAM: "NSEC3PARAM"
    of RecordType.TLSA: "TLSA"
    of RecordType.SMIMEA: "SMIMEA"
    of RecordType.HIP: "HIP"
    of RecordType.NINFO: "NINFO"
    of RecordType.RKEY: "RKEY"
    of RecordType.TALINK: "TALINK"
    of RecordType.CDS: "CDS"
    of RecordType.CDNSKEY: "CDNSKEY"
    of RecordType.OPENPGPKEY: "OPENPGPKEY"
    of RecordType.CSYNC: "CSYNC"
    of RecordType.ZONEMD: "ZONEMD"
    of RecordType.SVCB: "SVCB"
    of RecordType.HTTPS: "HTTPS"
    of RecordType.SPF: "SPF"
    of RecordType.UINFO: "UINFO"
    of RecordType.UID: "UID"
    of RecordType.GID: "GID"
    of RecordType.UNSPEC: "UNSPEC"
    of RecordType.NID: "NID"
    of RecordType.L32: "L32"
    of RecordType.L64: "L64"
    of RecordType.LP: "LP"
    of RecordType.EUI48: "EUI48"
    of RecordType.EUI64: "EUI64"
    of RecordType.TKEY: "TKEY"
    of RecordType.TSIG: "TSIG"
    of RecordType.IXFR: "IXFR"
    of RecordType.AXFR: "AXFR"
    of RecordType.MAILB: "MAILB"
    of RecordType.MAILA: "MAILA"
    of RecordType.ANY: "ANY"
    of RecordType.URI: "URI"
    of RecordType.CAA: "CAA"
    of RecordType.AVC: "AVC"
    of RecordType.DOA: "DOA"
    of RecordType.AMTRELAY: "AMTRELAY"
    of RecordType.TA: "TA"
    of RecordType.DLV: "DLV"
