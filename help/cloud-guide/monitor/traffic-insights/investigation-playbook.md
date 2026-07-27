---
title: Investigation Playbook
description: Learn how to investigate CDN bandwidth overage, search bot and crawler load, and malicious traffic using Adobe Commerce Traffic Insights, plus when to escalate.
feature: Cloud, Observability
role: Admin
---
# Investigation playbook

The [!DNL Adobe Commerce Traffic Insights] app is built around approaches to the following problems:

- Bandwidth overage
- Crawler load
- Malicious traffic

Alternatively, you can request [Advanced Security: native bot management, Layer 7 DDoS & rate limiting](#advanced-security-native-bot-management-layer-7-ddos--rate-limiting), Adobe's native escalation path for when manual mitigation is not enough. Each step names the widget that confirms the symptom, so you can transition from a number on a chart to a concrete action.

>[!WARNING]
>
>The suggestions on this page are only guidelines. Always validate any blocking rule against your own traffic before deploying it.

## CDN bandwidth overage

Before considering bandwidth overages, understand how bandwidth is billed. Traffic for **all** Fastly services bundled with the [!DNL Adobe Commerce on Cloud Infrastructure] account, including every production **and** staging environment, counts toward the common usage compared against the annual allowance in your contract. Start from **Bandwidth ▸ Total Bandwidth**, then attribute the volume with **Bandwidth By Content Type** and **Bandwidth By Domain Details**.

### Media content

Some stores legitimately serve a large share of bandwidth as media because of their catalog. If **Bandwidth By Content Type** shows a significant amount of media bandwidth, consider the following mitigations:

- Experiment with [Fastly lossy conversion](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/cdn/fastly-image-optimization#force-lossy-conversion) to serve smaller, lower-quality images.
- Investigate [Fastly Deep Image Optimization](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/cdn/fastly-image-optimization#deep-image-optimization) to generate resized images on the CDN side.

### Large files

Some sites contain large files or specific, heavy responses, for example ERP integrations or exports. Use **URLs By Bandwidth** to review the **BW** and **Avg Size** columns to find these large files. You can use **Path Segment lvl 1 By Bandwidth** for a higher-level view.

### Heavy 404s

An Adobe Commerce **404 page not found** is usually a heavy, theme-stylized page (~1.5 MB) and **non-cacheable**, so repeated 404s can generate abnormal traffic. Even a trivial missing resource like `favicon.ico` can turn into a heavy `404` page instead of a small file. Use the **404** and **404 BW** columns in **Bandwidth By Domain Details**, **URLs By Bandwidth**, **Top IPs By Bandwidth**, and **Stats By IP Subnets** to find clients, IPs, and URLs consistently generating 404 volume. Then reduce or limit that access, for example, return a lightweight `403` instead.

### Low FPC hit ratio

[!DNL Adobe] recommends enabling Fastly [shielding](https://www.fastly.com/documentation/guides/concepts/shielding/) so a main CDN cache aggregator serves the origin, letting fewer requests reach it from local [POPs](https://www.fastly.com/documentation/guides/getting-started/concepts/using-fastlys-global-pop-network/) closest to the client. See [checking your configuration](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/cdn/setup-fastly/fastly-custom-cache-configuration#configure-back-ends-and-origin-shielding).

POP-to-client and shield-to-POP traffic are counted separately, and while the client response is compressed, shield-to-POP traffic [is not compressed](https://www.fastly.com/documentation/guides/concepts/compression/#compression-at-the-edge) to preserve [ESI](https://www.fastly.com/documentation/reference/vcl/statements/esi/) support. This means a low FPC hit ratio drives much higher bandwidth on dynamic pages. Confirm the symptom with **FPC Hit Ratio**, **FPC Stats By Domain**, and **CDN Network Segment Bandwidth**.

A low hit rate is often driven by a large volume of search-engine crawlers (see [Search bots and crawlers](#search-bots-and-crawlers)). Another mitigation is to [serve a stale cache to crawlers](https://www.fastly.com/documentation/reference/vcl/variables/cache-object/stale-exists/) when available. If broad, frequent cache invalidations are the cause, use **Cache Invalidation By Tags** and **FPC Age By Top URLs** to find the churned tags/URLs.

## Search bots and crawlers

To gauge crawler impact, start in **Known Bots By Bandwidth** and **Known Bots Impact Details** to see which bots are most active, then [filter](https://docs.newrelic.com/docs/query-your-data/explore-query-data/dashboards/filter-new-relic-one-dashboards-facets/#example-use) by a specific bot to study only its requests.

### Too many requests

The most common cause of a search bot sending too many requests occurs while parsing pages that carry `<meta name="robots" content="index,follow">`. Bots can follow top-navigation and layered-navigation links in a near-endless loop. Consider the following options to address this issue:

>[!WARNING]
>
> Consult an SEO expert before restraining crawler activity. Retraining can negatively affect your SEO.

- Add `nofollow` to top-navigation and layered-navigation links, for example `<a rel="nofollow" href="https://mystore.com/sales.html">Sales</a>`.
- Change the page meta tag to `index,nofollow` — either as a common [design configuration setting](https://experienceleague.adobe.com/en/docs/commerce-admin/marketing/seo/seo-overview#configure-robotstxt) or  per page type with custom extensions. Keep `sitemap.xml` accurate so that bots always have an up-to-date list of pages to index.
- Update `robots.txt` to block paths and resources bots should not access.
- Note the `crawl-delay` directive is not part of the official Robots Exclusion Protocol, but it does work for some bots, such as Bingbot, Slurp, SEMrushBot, and a few others. Googlebot ignores this directive.
- Add rate-limit rules. There is native [abusive crawler protection](https://github.com/fastly/fastly-magento2/blob/master/Documentation/Guides/RATE-LIMITING.md#abusive-crawler-protection) in the Fastly module. For finer control, a [custom VCL snippet](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/cdn/custom-vcl-snippets/fastly-vcl-custom-snippets) can return `429` (Too Many Requests) or `405` (Method Not Allowed) for a user-agent regex with an individual rate limit. Check the crawler's documentation for the preferred method and response code. See Fastly's [rate-limiting VCL guidance](https://www.fastly.com/documentation/reference/vcl/functions/rate-limiting/ratelimit-check-rate/).
- AI/LLM crawlers are a growing special case. They do not always identify themselves consistently, so VCL user-agent rules can lag behind. Adobe's [Advanced Security](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/cdn/advanced-security) add-on's [native bot management](#advanced-security-native-bot-management-layer-7-ddos--rate-limiting) can distinguish verified from suspected AI crawlers and fetchers at the edge, which VCL alone cannot.

### Blocking unwanted crawlers

If certain search engines generate significant traffic and are not important to the business, they can be blocked entirely:

- Some bots follow `robots.txt` changes 1–2 days later, after re-reading and updating their parsing rules.
- If a crawler ignores `robots.txt`, block it with a custom VCL snippet ([example](https://experienceleague.adobe.com/en/docs/commerce-knowledge-base/kb/how-to/block-malicious-traffic-for-magento-commerce-on-fastly-level#block-traffic-by-user-agent)). Some crawlers explicitly document this as the preferred or only method of frequency control.

## Malicious scripts & scrapers

Use the Traffic Insights app to identify the common directions of attack, filtering by focus areas as needed. If red-flagged requests come predominantly from certain IPs, subnets, or geolocations (**Top IPs By Requests Count**, **Stats By IP Subnets**, **Stats By Country**), consider blocking them with custom Fastly VCL.

Every Cloud Infrastructure project already has a baseline of automatic protection regardless of any configuration you do. The included WAF immediately blocks SQL injection and known-malicious-IP signals (backdoor, attack tooling, CMDEXE, Log4J-JNDI, traversal, XSS), and rate-limits other non-malicious IPs once they cross 50 requests/minute, 350 requests/10 minutes, or 1,800 requests/hour. That baseline is what **Requests By WAF Response** and the WAF signal columns in this app's tables are indicating. A spike in these columns does not necessarily mean that you are not being protected.

- Watch for credential stuffing, account takeover, fake-account creation, card testing, content scraping, and inventory/cart hoarding. These bot-driven abuse patterns are surfaced in the **Bots Activity and Requests Analysis** tab. High-volume, low-diversity traffic hitting login, account, checkout, or catalog endpoints is the signature to look for in **Top IPs By Requests Count** and **Known Bots Impact Details**.
- Protect checkout and checkout API endpoints from bot attacks with [Google reCAPTCHA](https://experienceleague.adobe.com/en/docs/commerce-admin/systems/security/captcha/security-google-recaptcha).
- Use the Fastly module's native rate-limit [path protection](https://github.com/fastly/fastly-magento2/blob/master/Documentation/Guides/RATE-LIMITING.md#path-protection).
- Check [Next-Gen WAF signals](https://www.fastly.com/documentation/guides/next-gen-waf/signals/using-system-signals/) in the comma-separated `Sigsci_Tags` field and combine relevant signal matches into a targeted blocking rule. A suspicious request's value can look like `BOT-ANALYSIS,DATACENTER,SIGSCI-IP,SITE-FLAGGED-IP,SUSPECTED-BAD-BOT`. The WAF labels an IP with `SITE-FLAGGED-IP` up to a threshold before it begins blocking automatically. The **WAF Attack & Anomaly Signals**, **WAF Bots Signals**, and **Requests By WAF Response** widgets, and the WAF columns in the IP, subnet, and country tables, surface these.
- See Adobe's article on [blocking malicious traffic for Adobe Commerce on the Fastly level](https://experienceleague.adobe.com/en/docs/commerce-knowledge-base/kb/how-to/block-malicious-traffic-for-magento-commerce-on-fastly-level) for common approaches.
- For complex scenarios where manual blocking is not a viable option, such as sustained bot campaigns, attacks spread across many IPs/APIs, or Layer 7 DDoS, consider Adobe's [Advanced Security](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/cdn/advanced-security) add-on first (see [native bot management](#advanced-security-native-bot-management-layer-7-ddos--rate-limiting)). It runs on the same Fastly edge serving your storefront. If you need capabilities outside of its scope, a third-party managed bot-mitigation service with native Fastly integration, such as [Datadome](https://docs.datadome.co/docs/module-fastly) or [HUMAN Bot Defender](https://www.fastly.com/documentation/guides/integrations/non-fastly-services/human-bot-defender/) (formerly PerimeterX) is the suggested alternative. All of these options add additional costs.

## Advanced Security: native bot management, Layer 7 DDoS and rate limiting

The previous sections discuss what can be done with the Traffic Insights app's data and manual Fastly VCL. For scenarios where that is not enough, such as sustained or evolving bot campaigns, Layer 7 (application-layer) DDoS, or abuse spread thinly across many IPs and API endpoints, Adobe offers [Advanced Security](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/cdn/advanced-security).

Advanced Security is a paid add-on for [!DNL Adobe Commerce on Cloud Infrastructure] that adds edge bot management (including AI crawler and fetcher detection), Layer 7 DDoS protection, and advanced rate limiting on the same Fastly platform already serving the storefront. See [Advanced Security](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/cdn/advanced-security) for full capabilities, current limitations, and how to request it.

Once purchased and enabled, use the Traffic Insights app to verify that Advanced Security is working. Its decisions are reported through the same `Sigsci_Tags` and `Agent_response` fields behind **WAF Attack & Anomaly Signals**, **WAF Bots Signals**, and **Requests By WAF Response**. Compare those widgets before and after enabling it to confirm it is actively acting on your traffic.
