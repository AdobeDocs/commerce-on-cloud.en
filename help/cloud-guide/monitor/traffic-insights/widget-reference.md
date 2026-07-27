---
title: Widget Reference
description: Learn about every widget in the Bandwidth, Full Page Cache Performance, and Bots Activity and Requests Analysis tabs of Adobe Commerce Traffic Insights.
feature: Cloud, Observability
role: Admin
---
# Widget reference

The widget reference describes every chart in the three tabs of [!DNL Adobe Commerce Traffic Insights]. For a reference of the metrics and Fastly Next-Gen WAF signals used across the app, see [Metrics and signals reference](metrics-signals-reference.md).

## Bandwidth

Shows the overall picture of web traffic bandwidth distribution across the project's domains and resource types over time.

- **Total Bandwidth** - This single figure indicates the total CDN bandwidth served over the selected period. Use it as the main reference point to compare against the contract allowance. If this number is trending higher, consult the [bandwidth-overage playbook](investigation-playbook.md#cdn-bandwidth-overage) for assistance in determining the cause of the bandwidth increase.

- **Bandwidth By Domain Details** - Total bandwidth per domain, divided to indicate what kind of content drives each domain's bandwidth. Click a domain to filter by it. This section contains the following columns:
  - **Total** — The domain's total bandwidth.
  - **404** — Bandwidth served as `404 not found` responses for that domain (heavy, non-cacheable error pages).
  - **Media** — Bandwidth from `/media/` URLs (catalog images and other media).
  - **Static** — Bandwidth from `/static/` URLs (theme CSS, JS, fonts, and other static assets).
  - **REST API** — Bandwidth from REST API endpoints (`/rest`).
  - **GraphQL** — Bandwidth from GraphQL endpoints (`/graphql`).

- **CDN Network Segment Bandwidth** - Splits total bandwidth into two network segments:
  - **internal CDN traffic** — Traffic between Fastly's internal [shield](https://www.fastly.com/documentation/guides/concepts/shielding/) and its edge [POPs](https://www.fastly.com/documentation/guides/getting-started/concepts/using-fastlys-global-pop-network/).
  - **end-client network traffic** - The delivery from the edge POP out to the visitor. Because internal shield-to-POP traffic is [not compressed](https://www.fastly.com/documentation/guides/concepts/compression/#compression-at-the-edge), a low cache hit ratio inflates the internal segment. Uncached content must be pulled across the shield repeatedly. See the [low-FPC-hit-ratio playbook](investigation-playbook.md#low-fpc-hit-ratio) for more information.

- **Bandwidth By Domain Timeseries** - Bandwidth per domain over time. Use it to spot a spike and attribute it to a specific domain.

- **Bandwidth By Content Type** - Bandwidth split by content-type bucket. This method is the quickest way to determine whether media, static assets, or error pages dominate consumption. This section contains the following buckets:
  - **HTTP 404** — `404` error responses.
  - **Media** — `/media/` URLs.
  - **Static** — `/static/` URLs.
  - **GraphQL** — `/graphql` endpoints.
  - **REST API** — `/rest` endpoints.
  - **Misc files** — Binary or other file types that are not HTML, plain text, JSON, or JavaScript.
  - **Other traffic** — Everything else, effectively dynamic HTML, JSON, or JS pages.

- **Bandwidth By Content Type Timeseries** - The same content-type breakdown plotted over time.

- **Requests By Content Type** - Request counts, as opposed to bytes, across the same **Bandwidth By Content Type** buckets. Comparing this with **Bandwidth By Content Type** reveals content types that are request-heavy but lightweight, or few-but-heavy.

- **Requests By Content Type Timeseries** - Content-type request counts over time.

- **Bandwidth By Project ID** - Bandwidth per [!DNL Adobe Commerce on Cloud Infrastructure] project. In multi-project accounts this attributes usage to a specific project or environment.

- **Bandwidth By Project ID Timeseries** - Per-project bandwidth over time.

## Full Page Cache Performance

The **Full Page Cache Performance** metrics only cover dynamic storefront HTML pages eligible for Full Page Cache (FPC), which includes the following:
- Successful (`200`) `text/html` responses that are not AJAX

And excludes the following:

- `static/`
- `media/`
- checkout
- customer account
- sitemaps
- `robots.txt`
- other non-cacheable paths

This section focuses on cache efficiency for the dynamic content (PDP, PLP, CMS) that most affects performance, origin load, and bandwidth. See [cache invalidation](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-29631) for more information on root-cause research.

- **FPC Coverage** - Of the cacheable HTML requests, the share that is **Covered** (request that go through the cache with a `HIT` or `MISS`) compared to **Passed** (requests that bypass the cache with a `PASS`). Coverage tells you whether pages that could be cached actually are. Conversion rate, pages-per-visit, and custom endpoints affect this metric.

- **FPC Hit Ratio** - Of FPC-eligible requests, the **HIT** compared to **MISS** split. This indicates how often a cached copy was served instead of fetching from the origin. A low hit ratio drives higher origin load and bandwidth. Refer to Network Segment Bandwidth in the [bandwidth](#bandwidth) section and the [low-FPC-hit-ratio playbook](investigation-playbook.md#low-fpc-hit-ratio) for more information.

- **FPC Stats By Domain** - Per-domain FPC performance, indicates which domains cache well and which do not. This section contains the following columns:
  - **Cacheable Req.** — The number of FPC-eligible requests for the domain.
  - **Median Age** — The median cache age of served copies (see the [WAF signals reference](./metrics-signals-reference.md#waf-signals)). Low values suggest content is being invalidated or expiring quickly.
  - **Hit %** — The share of those requests served from cache.

- **FPC Hit % & Coverage % Timeseries** - Hit percent and coverage percent trends drawn together, so you can correlate cache-performance changes with deploys, cache invalidations, or traffic shifts.

## Cache Invalidation By Tags

This section reads production cache-log events rather than access logs.

- **Cache Invalidation By Tags (Production)** - Counts of Full Page Cache invalidation events over time, grouped by the cache tag that triggered them. Frequent broad invalidations flush large swaths of cache at once and are a common cause of low hit ratios and response-time degradation. This widget covers the production environment only. For more information, refer to [Fastly Cache Invalidation by Tags](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-29631). This section contains the following series:
  - **cat_p** — All product cache tags.
  - **cat_p_%** — A specific product's tag (invalidations targeting one product).
  - **cat_c** — All category cache tags.
  - **cat_c_%** — A specific category's tag.
  - **FPC** — The general Full Page Cache tag.

- **FPC Age By Top URLs** - The top HTML URLs ranked by how long their cached copies live. Use this information to find pages whose cache is being churned. This section contains the following columns:
  - **Requests** — Distinct requests for the URL.
  - **IPs** — Distinct client IPs that requested it.
  - **Hit %** — The share served from cache.
  - **Median Age** — The median cache age of served copies.
  - **Cache-age distribution** — The share of served copies whose age falls in each band: **< 5min**, **5min – 1h**, **1h – 2h**, **2h – 8h**, and **8h+**. A distribution weighted toward the short bands on a high-traffic URL points to over-aggressive invalidation or short TTLs.

## Bots Activity and Requests Analysis

Aggregates traffic by known bot agents, geolocation, most active IPs/subnets, URLs, and WAF signals to provide a holistic view of traffic structure. [Filter](https://docs.newrelic.com/docs/query-your-data/explore-query-data/dashboards/filter-new-relic-one-dashboards-facets/#example-use) by any facet (a specific bot, IP, or region) to investigate one slice in detail.

Signature values in the request's user-agent header primarily identify bots. Less frequent bots are grouped under **Other bots**, and non-browser tooling appears as **Misc scripts** (`curl`, `wget`, `Apache-HttpClient`, and others) or **API Clients** (Postman, RestSharp). Many widgets also surface Fastly [Next-Gen WAF](https://docs.fastly.com/products/fastly-next-gen-waf) signals (see [metrics signals reference](./metrics-signals-reference.md)).

## Known Bots Stats

- **Bandwidth Structure** - The orientation chart for the whole tab. A high-level breakdown of how much bandwidth is automated compared to organic, using WAF signals and known headers. This section contains the following buckets:
  - **iCloud Private Relay** — Traffic from Apple's iCloud Private Relay egress ranges (legitimate proxied user traffic).
  - **SUSPECTED-BAD-BOT | WAF** — Traffic the WAF flags as a suspected bad bot.
  - **AI-CRAWLER | WAF** — Traffic the WAF flags as an AI or LLM crawler.
  - **\*-BOT | WAF** — Traffic carrying other WAF bot signals.
  - **Other With Known Bots Headers** — Requests whose user-agent matches a known bot or tool signature but without a WAF bot flag.
  - **DATACENTER | WAF** — Traffic from datacenter or hosting networks per the WAF.
  - **Other traffic** — Everything else, mostly organic human traffic.

- **Known Bots By Bandwidth** - Bandwidth attributed to each individually identified bot, such as Google, Bing, Amazon, Ahrefs, Semrush, GPT, Claude, and others.  Additionally, **Other WAF detected bots** and **Other traffic** buckets are listed to account for all traffic. Use this data to pinpoint which named bots consume the most bandwidth, which is the starting point for the [crawler-restriction playbook](investigation-playbook.md#search-bots--crawlers).

- **Known Bots Impact Details** - The most detailed per-bot view, one row per identified bot. Use this data to determine whether a bot is well-behaved or abusive. This section contains the following columns:
  - **BW** — Bandwidth attributed to the bot.
  - **Requests** — Distinct requests from the bot.
  - **Urls** — Distinct URLs it touched.
  - **IPs** — Distinct IPs it used.
  - **Rpm** — Its average requests per minute.
  - **GET ?params** — The share of its requests carrying a query string.
  - **FPC Hit** — The share of its cacheable page requests served from cache. A well-behaved crawler should hit the cache often.
  - **2xx / 3xx / 403 / 404 / Other 4xx / 5xx** — The bot's HTTP status distribution (see the [WAF signals reference](./metrics-signals-reference.md#waf-signals)). Many `404`s suggests that the bot is following broken or recursive links.
  - **Unique user_agent** — How many distinct `user-agent` strings share this bot identity.
  - **Latest request_user_agent** — The most recent full `user-agent` string seen for it.

- **Top Known Bots By Bandwidth Timeseries** - Bandwidth of the busiest bots over time. This surfaces when a particular bot increases its crawling.

- **Top Known Bots By Requests Count Timeseries** - Request counts of the busiest bots over time.

## Requests Generic Stats

- **Requests By Response Status** - Request distribution by HTTP status code. Provides a quick read on error rates versus successful responses.

- **Requests By Response Status Timeseries** - The status-code distribution over time. This information is useful for correlating error spikes with incidents or deploys.

- **Requests By User Agent** - The top raw `user-agent` strings. Unlike the categorized bot views, this shows the exact `user-agent` text, which helps spot spoofed or unusual agents worth targeting with a VCL rule. This section contains the following columns:
  - **Requests** — Distinct requests for the `user-agent`.
  - **Bandwidth** — Bandwidth it consumed.
  - **IPs** — Distinct IPs presenting it.
  - **HTTP/2 %** — Its HTTP/2 share. A low percentage suggests possible automation.
  - **SUSPECTED-BAD-BOT** — The share of `user-agent` requests the WAF flags as a suspected bad bot.
  - **DATACENTER** — The share originating from datacenter or hosting networks.

- **Bandwidth By Url GET Params** - Bandwidth split by how requests use query strings. A large **has ?GET params** share can indicate cache-fragmenting traffic. This section contains the following buckets:
  - **no ?GET params** — URLs with no query string.
  - **with required ?GET params** — Endpoints where query parameters are functionally required (AJAX, catalog search, REST API).
  - **has ?GET params** — Other URLs carrying a query string, often cache-busting.

- **Requests By Url GET Params Timeseries** - The same query-string categories as request counts over time.

## Stats By Countries

Country and region codes follow the ISO standards described in the metrics reference.

- **Bandwidth By Country** - Bandwidth by country. A concentration from regions outside your market can indicate scraping or attack traffic.

- **Requests By Country** - Request counts by country.

- **Requests By Region** - Request counts by sub-national region (region plus country), for finer geographic drill-down.

- **Requests By Countries Timeseries** - Per-country request counts over time.

- **Stats By Country** - A per-country security profile. This highlights countries whose traffic is more suspicious, as candidates for geo-based rules. This section contains the following columns:
  - **BW** — Bandwidth from the country.
  - **Req.** — Distinct requests.
  - **IPs** — Distinct client IPs.
  - **Sus. Requests** — The combined suspicious-request share (see the [WAF signals reference](./metrics-signals-reference.md#waf-signals)).
  - **WAF Attacks / WAF Anomalies** — The shares carrying attack and anomaly signals.
  - **SUSPECTED-BAD-BOT / DATACENTER / SITE-FLAGGED-IP** — The shares carrying each of those WAF signals.
  - **HTTP/2 %** — The country's HTTP/2 share.
  - **Empty Referer %** — The share of requests with no `Referer` header.

## Next-Gen WAF

The following information is available through Fastly's Next-Gen WAF for more information, see Fastly's [Signals](https://www.fastly.com/documentation/guides/next-gen-waf/signals/using-system-signals/) and [Agent response codes](https://www.fastly.com/documentation/guides/next-gen-waf/agent-response-codes/about-agent-response-codes/) documentation.

- **WAF Attack & Anomaly Signals** - Gauges how much of your traffic the WAF flags as hostile. See the [WAF signals reference](./metrics-signals-reference.md#waf-signals) for what each category covers. Requests are divided into the following categories:
  - **WAF Attack** - Active exploit signals.
  - **WAF Anomaly** - Suspicious-behavior signals.
  - **Other traffic**

- **WAF Attack & Anomaly Signals Timeseries** - WAF attack and anomaly request counts over time, which can help you spot attack waves.

- **WAF Bots Signals** - Requests bucketed by bot-related WAF signals:
  - **SUSPECTED-BAD-BOT**
  - **AI-CRAWLER**
  - **Other bot signals**
  - **DATACENTER**
  - **Other traffic**

- **WAF Bots Signals Timeseries** - Bot-signal request counts over time:
  - **SUSPECTED-BAD-BOT**
  - **DATACENTER**
  - **AI-CRAWLER**
  - **Other bot signals**
  - **SITE-FLAGGED-IP**

- **Requests By WAF Response** - The distribution of the WAF agent's response to each request, with a **NULL** bucket for requests served from cache (which the WAF agent does not process). It shows how often the WAF is actively responding compared to traffic passing straight through. See Adobe's [Fastly WAF service — troubleshooting blocked requests](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/cdn/fastly-waf-service#troubleshooting-blocked-requests) and Fastly's [agent response codes](https://www.fastly.com/documentation/guides/next-gen-waf/agent-response-codes/about-agent-response-codes/) for more information.

- **Requests By WAF Response Timeseries** - WAF agent responses over time.

## IP Stats

- **Top IPs By Requests Count** - The top client IPs by request volume. This section is the primary tool for finding a single abusive IP. High Rpm with many `4xx` responses and no verified-bot flag could indicate an abusive IP. Click an IP to filter the app to it. This section contains the following columns:
  - **Requests** — Distinct requests from the IP.
  - **BW** — Bandwidth it consumed.
  - **Country** — Its most recent country.
  - **Urls** — Distinct URLs it touched.
  - **Rpm** — Its average requests per minute.
  - **WAF Attacks / WAF Anomalies / SUSPECTED-BAD-BOT** — The shares of its requests carrying each signal.
  - **VERIFIED-BOT.\*** — The share flagged as a verified bot, distinguishing a legitimate crawler from an impostor.
  - **2xx / 3xx / 403 / 404 / Other 4xx / 5xx** — Its HTTP status distribution.

- **Top IPs By Requests Count Timeseries** - Request counts of the busiest IPs over time.

- **Top IPs By Bandwidth** - The top client IPs by bandwidth, which can be used to find addresses driving bandwidth cost, such as media scraping or repeated heavy `404`s. It shares the volume, WAF, and geo columns of **Top IPs By Requests Count**, and adds:
  - **404 BW** — Bandwidth the IP consumed through `404` responses.
  - **Media BW %** — The share of its bandwidth from `/media/` URLs.
  - **DATACENTER / SITE-FLAGGED-IP** — The shares carrying each of those WAF signals.
  - **Latest request_user_agent** — The most recent user-agent string seen from the IP.

- **Stats By IP Subnets** - Aggregates IPs into subnets using roughly a `/16-style` grouping, which is useful when an actor rotates across many addresses in one network block. This section contains the following columns:
  - **BW / Req. / IPs** — Bandwidth, distinct requests, and distinct IPs within the subnet.
  - **Countries** — How many distinct countries the subnet's traffic came from.
  - **Last Country** — The most recently seen country for it.
  - **WAF Attacks / WAF Anomalies / SUSPECTED-BAD-BOT / DATACENTER / SITE-FLAGGED-IP** — The WAF signal shares for the subnet.
  - **404 BW** — Bandwidth from `404` responses.
  - **Media BW %** — The share of bandwidth from `/media/` URLs.
  - **HTTP/2 %** — The subnet's HTTP/2 share.
  - **Empty Referer %** — The share of requests with no `Referer` header.
  - **Info** — A label for recognized ranges, such as "iCloud Private Relay egress proxies" or "Verified Bot" when most of the subnet's requests are verified bots.

- **Top Subnets By Requests Count Timeseries** - Request counts of the busiest subnets over time.

- **Top Subnets By Bandwidth Timeseries** - Bandwidth of the busiest subnets over time.

## URL Stats

- **URLs By Bandwidth** - The top URLs by bandwidth. This view is the best for finding heavy or non-cacheable URLs (large files, ERP integration endpoints, or heavy `404` pages) that drive bandwidth. This section contains the following columns:
  - **BW** — Bandwidth for the URL.
  - **Req.** — Distinct requests.
  - **IPs** — Distinct client IPs.
  - **Req. / IPs** — Average requests per IP, a high value suggests automated hammering of that URL.
  - **Rpm** — Average requests per minute.
  - **FPC Median Age** — The median cache Age of served copies.
  - **FPC Hit** — The share served from cache.
  - **2xx / 3xx / 404 / Other 4xx / 5xx** — The HTTP status distribution.
  - **Avg Size** — The average response size, large values flag heavy resources.

- **Path Segment lvl 1 By Bandwidth** - The same columns as **URLs By Bandwidth**, but grouped by the first path segment of the URL instead of the full URL. This gives a higher-level view of which site areas consume the most bandwidth, such as `/media`, `/catalogsearch`, or `/rest`.
