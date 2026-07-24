---
title: Widget Reference
description: Learn about every widget in the Bandwidth, Full Page Cache Performance, and Bots Activity and Requests Analysis tabs of Adobe Commerce Traffic Insights.
feature: Cloud, Observability
role: Admin
---
# Widget reference

The widget reference describes every chart in the three tabs of [!DNL Adobe Commerce Traffic Insights]. Each widget is described in context, with its columns and series explained. For a reference of the metrics and Fastly Next-Gen WAF signals used across the app, see [Metrics and signals reference](metrics-signals-reference.md).

## Bandwidth

Shows the overall picture of web traffic bandwidth distribution across the project's domains and resource types over time.

### Total Bandwidth

A single headline figure: the total CDN bandwidth served over the selected period. Use it as the top-line number to compare against the contract allowance. When it trends high, the [bandwidth-overage playbook](investigation-playbook.md#cdn-bandwidth-overage) walks through attributing it.

### Bandwidth By Domain Details

Total bandwidth per domain, broken out so you can see not just which domains are heaviest but what kind of content drives each one's usage. Click a domain to filter the rest of the app to it.

Columns:

- **Total** — The domain's total bandwidth.
- **404** — Bandwidth served as 404 "not found" responses for that domain (heavy, non-cacheable error pages).
- **Media** — Bandwidth from `/media/` URLs (catalog images and other media).
- **Static** — Bandwidth from `/static/` URLs (theme CSS, JS, fonts, and other static assets).
- **REST API** — Bandwidth from REST API endpoints (`/rest/…`).
- **GraphQL** — Bandwidth from GraphQL endpoints (`/graphql`).

### CDN Network Segment Bandwidth

Splits total bandwidth into two network segments: **internal CDN traffic** — traffic between Fastly's internal [shield](https://www.fastly.com/documentation/guides/concepts/shielding/) and its edge [POPs](https://www.fastly.com/documentation/guides/getting-started/concepts/using-fastlys-global-pop-network/) — and **end-client network traffic**, the delivery from the edge POP out to the visitor. Because internal shield-to-POP traffic is [not compressed](https://www.fastly.com/documentation/guides/concepts/compression/#compression-at-the-edge), a low cache hit ratio inflates the internal segment: uncached content must be pulled across the shield repeatedly (see the [low-FPC-hit-ratio playbook](investigation-playbook.md#low-fpc-hit-ratio)).

### Bandwidth By Domain Timeseries

Bandwidth per domain over time. Use it to spot a spike and attribute it to a specific domain.

### Bandwidth By Content Type

Bandwidth split by content-type bucket, the quickest way to see whether media, static assets, or error pages dominate consumption. Buckets:

- **HTTP 404** — 404 error responses.
- **Media** — `/media/` URLs.
- **Static** — `/static/` URLs.
- **GraphQL** — `/graphql` endpoints.
- **REST API** — `/rest/…` endpoints.
- **Misc files** — Binary or other file types that are not HTML, plain text, JSON, or JavaScript.
- **Other traffic** — Everything else, effectively dynamic HTML/JSON/JS pages.

### Bandwidth By Content Type Timeseries

The same content-type breakdown plotted over time.

### Requests By Content Type

Request counts (rather than bytes) across the same content-type buckets as above. Comparing this with *Bandwidth By Content Type* reveals content types that are request-heavy but lightweight, or few-but-heavy.

### Requests By Content Type Timeseries

Content-type request counts over time.

### Bandwidth By Project ID

Bandwidth per Adobe Commerce Cloud project. In multi-project accounts this attributes usage to a specific project or environment.

### Bandwidth By Project ID Timeseries

Per-project bandwidth over time.

## Full Page Cache Performance tab

Metrics here cover only dynamic storefront HTML pages eligible for Full Page Cache (FPC) — successful (`200`) `text/html` responses that are not AJAX, excluding `static/`, `media/`, checkout, customer account, sitemaps, robots.txt, and other non-cacheable paths. The focus is cache efficiency for the dynamic content (PDP, PLP, CMS) that most affects performance, origin load, and bandwidth. See the [documentation on cache invalidation](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-29631) and root-cause research.

### FPC Coverage

Of the cacheable HTML requests, the share that is **Covered** (goes through the cache — a `HIT` or `MISS`) versus **Passed** (bypasses the cache — a `PASS`). Coverage tells you whether pages that *could* be cached actually are; it can be affected by conversion rate, pages-per-visit, and custom endpoints.

### FPC Hit Ratio

Of FPC-eligible requests, the **HIT** versus **MISS** split — how often a cached copy was served instead of fetching from origin. A low hit ratio drives higher origin load and bandwidth (see *CDN Network Segment Bandwidth* above and the [low-FPC-hit-ratio playbook](investigation-playbook.md#low-fpc-hit-ratio)).

### FPC Stats By Domain

Per-domain FPC performance, so you can see which domains cache well and which do not. Columns:

- **Cacheable Req.** — The number of FPC-eligible requests for the domain.
- **Median Age** — The median cache Age of served copies (see the metrics reference); low values suggest content is being invalidated or expiring quickly.
- **Hit %** — The share of those requests served from cache.

### FPC Hit % & Coverage % Timeseries

Hit % and Coverage % trends drawn together, so you can correlate cache-performance changes with deploys, cache invalidations, or traffic shifts.

## Cache Invalidation By Tags

[Documentation: Fastly Cache Invalidation by Tags](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-29631). This section reads production cache-log events rather than access logs.

### Cache Invalidation By Tags (Production)

Counts of Full Page Cache invalidation events over time, grouped by the cache tag that triggered them. Frequent broad invalidations flush large swaths of cache at once and are a common cause of low hit ratios and response-time degradation. This widget covers the production environment only. Series:

- **cat_p** — All product cache tags.
- **cat_p_%** — A specific product's tag (invalidations targeting one product).
- **cat_c** — All category cache tags.
- **cat_c_%** — A specific category's tag.
- **FPC** — The general Full Page Cache tag.

### FPC Age By Top URLs

The top HTML URLs ranked by how long their cached copies live — the place to find pages whose cache is being churned. Columns:

- **Requests** — Distinct requests for the URL.
- **IPs** — Distinct client IPs that requested it.
- **Hit %** — The share served from cache.
- **Median Age** — The median cache Age of served copies.
- **Cache-age distribution** — The share of served copies whose Age falls in each band: **< 5min**, **5min – 1h**, **1h – 2h**, **2h – 8h**, and **8h+**. A distribution weighted toward the short bands on a high-traffic URL points to over-aggressive invalidation or short TTLs.

## Bots Activity and Requests Analysis tab

Aggregates traffic by known bot agents, geolocation, most active IPs/subnets, URLs, and WAF signals — a holistic view of traffic structure. [Filter](https://docs.newrelic.com/docs/query-your-data/explore-query-data/dashboards/filter-new-relic-one-dashboards-facets/#example-use) by any facet (a specific bot, IP, or region) to investigate one slice in detail. Bots are identified primarily by signature values in the request's user-agent header; less frequent bots are grouped under "Other bots," and non-browser tooling appears as **Misc scripts** (curl, wget, Apache-HttpClient, and similar) or **API Clients** (Postman, RestSharp). Many widgets also surface Fastly [Next-Gen WAF](https://docs.fastly.com/products/fastly-next-gen-waf) signals (see the WAF signals reference above).

## Known Bots Stats

### Bandwidth Structure

The orientation chart for the whole tab: a high-level breakdown of how much bandwidth is automated versus organic, using WAF signals and known headers. Buckets:

- **iCloud Private Relay** — Traffic from Apple's iCloud Private Relay egress ranges (legitimate proxied user traffic).
- **SUSPECTED-BAD-BOT | WAF** — Traffic the WAF flags as a suspected bad bot.
- **AI-CRAWLER | WAF** — Traffic the WAF flags as an AI/LLM crawler.
- **\*-BOT | WAF** — Traffic carrying other WAF bot signals.
- **Other With Known Bots Headers** — Requests whose user-agent matches a known bot/tool signature but without a WAF bot flag.
- **DATACENTER | WAF** — Traffic from datacenter/hosting networks per the WAF.
- **Other traffic** — Everything else (largely organic human traffic).

### Known Bots By Bandwidth

Bandwidth attributed to each individually identified bot (Google, Bing, Amazon, Ahrefs, Semrush, GPT, Claude, and many more), with **Other WAF detected bots** and **Other traffic** buckets so the chart accounts for all traffic. Pinpoints which named bots consume the most bandwidth — the starting point for the [crawler-restriction playbook](investigation-playbook.md#search-bots--crawlers).

### Known Bots Impact Details

The most detailed per-bot view, one row per identified bot — use it to judge whether a bot is well-behaved or abusive. Columns:

- **BW** — Bandwidth attributed to the bot.
- **Requests** — Distinct requests from the bot.
- **Urls** — Distinct URLs it touched.
- **IPs** — Distinct IPs it used.
- **Rpm** — Its average requests per minute.
- **GET ?params** — The share of its requests carrying a query string.
- **FPC Hit** — The share of its cacheable page requests served from cache; a well-behaved crawler should hit cache often.
- **2xx / 3xx / 403 / 404 / Other 4xx / 5xx** — Its HTTP status distribution (see the metrics reference). Many 404s suggest the bot is following broken or endless links.
- **Unique user_agent** — How many distinct user-agent strings share this bot identity.
- **Latest request_user_agent** — The most recent full user-agent string seen for it.

### Top Known Bots By Bandwidth Timeseries

Bandwidth of the busiest bots over time — surfaces when a particular crawler ramped up.

### Top Known Bots By Requests Count Timeseries

Request counts of the busiest bots over time.

## Requests Generic Stats

### Requests By Response Status

Request distribution by HTTP status code — a quick read on error rates versus successful responses.

### Requests By Response Status Timeseries

The status-code distribution over time, useful for correlating error spikes with incidents or deploys.

### Requests By User Agent

The top raw user-agent strings. Unlike the categorized bot views, this shows the exact user-agent text, which helps spot spoofed or unusual agents worth targeting with a VCL rule. Columns:

- **Requests** — Distinct requests for the user-agent.
- **Bandwidth** — Bandwidth it consumed.
- **IPs** — Distinct IPs presenting it.
- **HTTP/2 %** — Its HTTP/2 share (low can hint at automation).
- **SUSPECTED-BAD-BOT** — The share of its requests the WAF flags as a suspected bad bot.
- **DATACENTER** — The share originating from datacenter/hosting networks.

### Bandwidth By Url GET Params

Bandwidth split by how requests use query strings. A large "has ?GET params" share can indicate cache-fragmenting traffic. Buckets:

- **no ?GET params** — URLs with no query string.
- **with required ?GET params** — Endpoints where query parameters are functionally required (AJAX, catalog search, REST API).
- **has ?GET params** — Other URLs carrying a query string, often cache-busting.

### Requests By Url GET Params Timeseries

The same query-string categories as request counts over time.

## Stats By Countries

Country and region codes follow the ISO standards described in the metrics reference.

### Bandwidth By Country

Bandwidth by country. A concentration from regions outside your market can indicate scraping or attack traffic.

### Requests By Country

Request counts by country.

### Requests By Region

Request counts by sub-national region (region plus country), for finer geographic drill-down.

### Requests By Countries Timeseries

Per-country request counts over time.

### Stats By Country

A per-country security profile — highlights countries whose traffic skews suspicious, as candidates for geo-based rules. Columns:

- **BW** — Bandwidth from the country.
- **Req.** — Distinct requests.
- **IPs** — Distinct client IPs.
- **Sus. Requests** — The combined suspicious-request share (see the WAF signals reference).
- **WAF Attacks / WAF Anomalies** — The shares carrying attack and anomaly signals.
- **SUSPECTED-BAD-BOT / DATACENTER / SITE-FLAGGED-IP** — The shares carrying each of those WAF signals.
- **HTTP/2 %** — The country's HTTP/2 share.
- **Empty Referer %** — The share of requests with no `Referer` header.

## Next-Gen WAF

Documentation on Fastly [Signals](https://www.fastly.com/documentation/guides/next-gen-waf/signals/using-system-signals/) and [Agent response codes](https://www.fastly.com/documentation/guides/next-gen-waf/agent-response-codes/about-agent-response-codes/).

### WAF Attack & Anomaly Signals

Requests bucketed into **WAF Attack** (active exploit signals), **WAF Anomaly** (suspicious-behavior signals), and **Other traffic**. Gauges how much of your traffic the WAF flags as hostile. See the WAF signals reference for what each category covers.

### WAF Attack & Anomaly Signals Timeseries

WAF attack and anomaly request counts over time — spot attack waves.

### WAF Bots Signals

Requests bucketed by bot-related WAF signals: **SUSPECTED-BAD-BOT**, **AI-CRAWLER**, **\*-BOT** (other bot signals), **DATACENTER**, and **Other traffic**.

### WAF Bots Signals Timeseries

Bot-signal request counts over time (SUSPECTED-BAD-BOT, DATACENTER, AI-CRAWLER, other bot signals, and SITE-FLAGGED-IP).

### Requests By WAF Response

The distribution of the WAF agent's response to each request, with a **NULL** bucket for requests served from cache (which the WAF agent does not process). It shows how often the WAF is actively responding versus traffic passing straight through. See Adobe's [Fastly WAF service — troubleshooting blocked requests](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/cdn/fastly-waf-service#troubleshooting-blocked-requests) and Fastly's [agent response codes](https://www.fastly.com/documentation/guides/next-gen-waf/agent-response-codes/about-agent-response-codes/).

### Requests By WAF Response Timeseries

WAF agent responses over time.

## IP Stats

### Top IPs By Requests Count

The top client IPs by request volume — the primary tool for finding a single abusive IP. High Rpm with many 4xx responses and no verified-bot flag is a red flag. Click an IP to filter the app to it. Columns:

- **Requests** — Distinct requests from the IP.
- **BW** — Bandwidth it consumed.
- **Country** — Its most recent country.
- **Urls** — Distinct URLs it touched.
- **Rpm** — Its average requests per minute.
- **WAF Attacks / WAF Anomalies / SUSPECTED-BAD-BOT** — The shares of its requests carrying each signal.
- **VERIFIED-BOT.\*** — The share flagged as a verified bot, distinguishing a legitimate crawler from an impostor.
- **2xx / 3xx / 403 / 404 / Other 4xx / 5xx** — Its HTTP status distribution.

### Top IPs By Requests Count Timeseries

Request counts of the busiest IPs over time.

### Top IPs By Bandwidth

The top client IPs by bandwidth — finds addresses driving bandwidth cost, such as media scraping or repeated heavy 404s. It shares the volume, WAF, and geo columns of *Top IPs By Requests Count*, and adds:

- **404 BW** — Bandwidth the IP consumed via 404 responses.
- **Media BW %** — The share of its bandwidth from `/media/` URLs.
- **DATACENTER / SITE-FLAGGED-IP** — The shares carrying each of those WAF signals.
- **Latest request_user_agent** — The most recent user-agent string seen from the IP.

### Stats By IP Subnets

Aggregates IPs into subnets (roughly a /16-style grouping), which is useful when an actor rotates across many addresses in one network block. Columns:

- **BW / Req. / IPs** — Bandwidth, distinct requests, and distinct IPs within the subnet.
- **Countries** — How many distinct countries the subnet's traffic came from.
- **Last Country** — The most recently seen country for it.
- **WAF Attacks / WAF Anomalies / SUSPECTED-BAD-BOT / DATACENTER / SITE-FLAGGED-IP** — The WAF signal shares for the subnet.
- **404 BW** — Bandwidth from 404 responses.
- **Media BW %** — The share of bandwidth from `/media/` URLs.
- **HTTP/2 %** — The subnet's HTTP/2 share.
- **Empty Referer %** — The share of requests with no `Referer` header.
- **Info** — A label for recognized ranges, e.g. "iCloud Private Relay egress proxies," or "Verified Bot" when most of the subnet's requests are verified bots.

### Top Subnets By Requests Count Timeseries

Request counts of the busiest subnets over time.

### Top Subnets By Bandwidth Timeseries

Bandwidth of the busiest subnets over time.

## URL Stats

### URLs By Bandwidth

The top URLs by bandwidth — the go-to view for finding heavy or non-cacheable URLs (large files, ERP integration endpoints, or heavy 404 pages) that drive bandwidth. Columns:

- **BW** — Bandwidth for the URL.
- **Req.** — Distinct requests.
- **IPs** — Distinct client IPs.
- **Req. / IPs** — Average requests per IP; a high value suggests automated hammering of that URL.
- **Rpm** — Average requests per minute.
- **FPC Median Age** — The median cache Age of served copies.
- **FPC Hit** — The share served from cache.
- **2xx / 3xx / 404 / Other 4xx / 5xx** — The HTTP status distribution.
- **Avg Size** — The average response size; large values flag heavy resources.

### Path Segment lvl 1 By Bandwidth

The same columns as *URLs By Bandwidth*, but grouped by the first path segment of the URL instead of the full URL. This gives a higher-level view of which site areas (for example `/media`, `/catalogsearch`, or `/rest`) consume the most bandwidth.
