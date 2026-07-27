---
title: Understanding the App
description: Learn about how Adobe Commerce Traffic Insights works, how to drive it with filters, how its data is measured, and its data limitations and performance.
feature: Cloud, Observability
role: Admin
---
# Understanding the app

The [!DNL Adobe Commerce Traffic Insights] app visualizes raw Fastly CDN access logs into a picture of a store's edge traffic. Charts are grouped into the following tabs:

- **Bandwidth** — How traffic bandwidth is distributed across domains, content and resource types, and Cloud projects over time.
- **Full Page Cache Performance** — How efficiently dynamic storefront HTML (PDP, PLP, CMS) is cached at the edge.
- **Bots Activity and Requests Analysis** — Traffic broken down by known bot agents, geolocation, IPs/subnets, URLs, and Fastly Next-Gen WAF signals.

A fourth in-app **Documentation** tab carries conceptual notes and the [Investigation playbook](investigation-playbook.md).

## Who is this guide for?

- **Site operators and Site Reliability Engineering (SREs)** investigating CDN bandwidth overage, traffic spikes, or origin load.
- **Developers** tuning Full Page Cache coverage and hit ratio, or implementing Fastly VCL rules.
- **Administrators and security engineers** identifying and mitigating unwanted bots, scrapers, and malicious automated traffic.

Familiarity with [!DNL Adobe Commerce on Cloud Infrastructure], Fastly CDN concepts, and basic New Relic navigation is assumed.

## How it works

Select an account and time range from the platform controls at the top of the page. An optional **Project ID** can further narrow charts to specific Cloud projects. In a master-account or partnership setup, being able to view an account in the dropdown does not mean that you can query it. If a chart reports a permission error, switch to an account you have NRQL access to.

You continue to apply filters to turn a broad overview into a focused investigation. Click a value in a facet column, such as a bot, IP, subnet, country, or content type to add a [global filter](https://docs.newrelic.com/docs/query-your-data/explore-query-data/dashboards/filter-new-relic-one-dashboards-facets/#example-use). Active filters appear at the top of the grid and apply across every widget in every tab simultaneously. To widen the scope, remove a filter.

**Walkthrough** - Consider a scenario where the *Total Bandwidth* is trending above the contract allowance and you want to know who is driving it:

1. Open the **Bots Activity and Requests Analysis** tab and read **Bandwidth Structure** to see how much of the traffic is automated versus organic.
1. If bots appear to have more traffic, open **Known Bots By Bandwidth** and click the heaviest named bot, for example, a scraper. This adds a new filter, which means now every widget is scoped to that bot.
1. Read **Known Bots Impact Details** for its request rate, status mix, and FPC hit rate.
1. To see where the bot originates check **Bandwidth By Country**. To see what the bot is fetching, see **URLs By Bandwidth**.
1. If the traffic concentrates in one network, click through **Stats By IP Subnets** to confirm an actor rotating across addresses in a single block.
1. You now have the who, what, and where needed to write a targeted mitigation. Continue to the [Investigation playbook](investigation-playbook.md) to learn about how to proceed.

The same filtering method works from any starting facet: a suspicious country, a single IP, a content type, or a URL path segment.

## How the data is measured

Understanding a few measurement choices makes the numbers easier to trust and interpret.

- **Bandwidth (BW)** is the total bytes the CDN served for the matching requests, counting **both response headers and body**. It is the headline cost metric that counts against the contract allowance.
- **Requests (Req.)** is the number of distinct requests, however, with Fastly [shielding](https://www.fastly.com/documentation/guides/concepts/shielding/) enabled a single request is logged **twice**, once on each of the following:
  - Internal shield [POP](https://www.fastly.com/documentation/guides/getting-started/concepts/using-fastlys-global-pop-network/) 
  - Edge POP 
   This happens unless the response comes straight from the local POP cache or the shield is itself acting as the POP for the sender's location. To avoid double-counting these `HIT,MISS` and `MISS,MISS` cases, the app's queries aggregate with [`uniqueCount`](https://docs.newrelic.com/docs/nrql/nrql-syntax-clauses-functions/#func-uniqueCount) over the `request_id` field. This returns a close **approximation** with an expected margin of error of **~5%**, not an exact count.
- **CDN network segments** are compressed differently. The response delivered to the client is compressed, but shield-to-POP traffic is [not compressed](https://www.fastly.com/documentation/guides/concepts/compression/#compression-at-the-edge) to preserve [ESI](https://www.fastly.com/documentation/reference/vcl/statements/esi/) support. A low cache hit ratio therefore inflates the internal segment more than the client-facing one, since uncached content must be pulled across the shield repeatedly at full, uncompressed size. This compression is why the **CDN Network Segment Bandwidth** widget and the FPC hit ratio are two views of the same underlying cost.

## Data limitations & performance

- **30-day retention** - Fastly CDN logs are retained in New Relic for **30 days** per the subscription plan. Any window you pick must fall within the past 30 days. For longer-term **total** bandwidth, use the direct Fastly integration in the [!DNL Adobe Commerce admin] panel, **Dashboard > Fastly > Bandwidth > Total**, but consider that it reports per-service-ID, so data must be collected per environment and aggregated to compare against the contract allowance.
- **60-second query limit** - Each chart's NRQL has a [60-second execution limit](https://docs.newrelic.com/docs/nrql/using-nrql/rate-limits-nrql-queries/#query-duration). For very high-traffic accounts, a widget can time out while scanning too many log records. If this happens, reduce the time range and reload the charts. You can expand it again for lighter tabs.
