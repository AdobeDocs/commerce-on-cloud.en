---
title: Metrics and Signals Reference
description: Learn about the volume metrics, HTTP status distribution, cache metrics, geolocation, and Fastly Next-Gen WAF signals reused across Traffic Insights widgets.
feature: Cloud, Observability
role: Admin
---
# Metrics and signals reference

Many New Relic widgets reuse the same metrics and Fastly Next-Gen WAF signals. These metrics are defined in the [widget reference](widget-reference.md), which describes how to read them in context.

## Volume metrics

- **Bandwidth (BW)** — Total bytes the CDN served for the matching requests, counting both response headers and body. The headline cost metric that counts against the contract allowance.
- **Requests (Req.)** — The number of distinct requests, deduplicated across shield hops, a close approximation with a ~5% margin of error.
  - For more information on how the deduplication works, see [How the data is measured](understanding-the-app.md#how-the-data-is-measured).
- **IPs** — The number of distinct client IP addresses.
- **URLs** — The number of distinct URLs.
- **Requests per minute (RPM)** — The average request rate, in requests per minute, over the selected period. A high RPM concentrated on a single IP or bot points to automated hammering.
- **Req. / IPs** — Average requests per unique IP. A high ratio means a few addresses are making many requests each, which is a hallmark of automation. Conversely, a low ratio means the traffic is spread across many distinct clients.
- **Avg Size** — The average response size, including headers and body, per request. Large values point to heavy resources, such as big files or uncached error pages.

## HTTP status distribution

Where a table breaks down requests by response status, the columns are the percentage of that row's requests ending in each class: 

- **2xx** — success
- **3xx** — redirects
- **403** — forbidden
- **404** — not found
- **Other 4xx** — client errors other than `403` or `404`
- **5xx** — server errors.

A skew toward `404` or `4xx` suggests probing, broken links, or scraping. A rise in `5xx` points to origin trouble.

## Request-quality signals

- **HTTP/2 percent** — The share of a row's requests negotiated over [HTTP/2](https://www.fastly.com/documentation/reference/vcl/variables/client-connection/fastly-info-is-h2/). Modern browsers negotiate `HTTP/2`, while many scripts and simpler bots still use `HTTP/1.1`, so a low `HTTP/2` percent for an IP or user-agent can hint at automation. Treat this as a soft signal, not as proof.
- **Empty Referer percent** — The share of requests sent with no `Referer` header. Automated and direct traffic often omits the referrer. While the referrer is not a definitive indicator, it can help scope simpler, less sophisticated attacks.
- **GET ?params** — The share of requests with a URL query string (`?…`). Unnecessary query strings can fragment or bust the cache, so a high value on cacheable content is worth reviewing.

## Cache and Full Page Cache

- **Cache Age or Median Age** — The Fastly cache [**Age**](https://www.fastly.com/documentation/reference/http/http-headers/Age/) indicates how long (in seconds) the object served has been sitting in cache when it is returned. The **Median Age** is the typical age of the served cached copies. Consistently short ages on high-traffic content indicate frequent cache invalidation or short TTLs. See Fastly's [HTTP caching semantics](https://www.fastly.com/documentation/guides/concepts/cache/cache-freshness/).
- **FPC Hit percent** — Of Full-Page-Cache-eligible requests, this is the share served from cache (`HIT`) rather than fetched from the origin (`MISS`). Higher is better.
- **404 BW** — The bandwidth consumed specifically by `404` responses. If an [!DNL Adobe Commerce] `404` page is heavy (often ~1.5 MB) and non-cacheable, repeated `404`s can generate an abnormal volume of traffic.
- **Media BW percent** — The share of a row's bandwidth coming from `/media/` URLs.

## WAF signals

These come from Fastly's Next-Gen WAF and are read from the request's signal tags from the the comma-separated `Sigsci_Tags` field. They are described in Fastly's official [system signals documentation](https://www.fastly.com/documentation/guides/next-gen-waf/signals/using-system-signals/). The app does not add its own detection logic.

- **WAF Attacks** — The share of requests carrying an active attack signal, such as cross-site scripting (XSS), SQL injection (SQLI), command execution, path traversal, Log4j-JNDI, SSRF, or backdoor.
- **WAF Anomalies** — The share carrying an anomaly or suspicious-behavior signal, such as scanners, malformed data, abnormal paths, or already-blocked requests.
- **SUSPECTED-BAD-BOT** — A request suspected of being a bad bot.
- **AI-CRAWLER** — A request suspected of being an AI or LLM crawler, generally used for building AI models or indexes.
- **DATACENTER** — A request originating from a known cloud, hosting, or data-center network. This can include legitimate uses such as a VPN, so consider these requests as worth investigating before coming to a determination.
- **SITE-FLAGGED-IP** — A request from an IP flagged for exceeding the site's attack thresholds. The WAF labels an IP with this up to a threshold before it starts blocking it automatically.
- **VERIFIED-BOT.\*** — A verified bot per Fastly's system signals, such as search-engine crawlers, AI fetchers or crawlers, accessibility tools, and similar bots. Use this information to distinguish legitimate crawlers from impostors. See the [system signals documentation](https://www.fastly.com/documentation/guides/next-gen-waf/signals/using-system-signals/).
- **Sus. Requests** — A combined suspiciousness indicator. These requests are flagged by any attack, anomaly, suspected-bad-bot, or site-flagged-IP signal, or those coming from a datacenter network without being a verified bot.

## Geolocation

Country and region are derived by Fastly from the client IP:

- **country** uses [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1#Codes) two-letter codes from [client.geo.country_code](https://www.fastly.com/documentation/reference/vcl/variables/geolocation/client-geo-country-code/)
- **region** uses [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2#Current_codes) from [client.geo.region](https://www.fastly.com/documentation/reference/vcl/variables/geolocation/client-geo-region/)
