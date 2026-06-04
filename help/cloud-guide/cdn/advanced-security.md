---
title: Adobe Commerce Advanced Security
description: Learn how Advanced Security adds bot management, advanced rate limiting, and Layer 7 DDoS protection to Adobe Commerce on Cloud Infrastructure.
feature: Cloud, Configuration, Security
exl-id: 7aeb189f-be69-45d5-8163-4748424083c0
---
# [!DNL Adobe Commerce Advanced Security]

[!DNL Adobe Commerce Advanced Security] is a product that works with [!DNL Adobe Commerce on Cloud Infrastructure] to keep your online store fast, available, and secure. This can help protect revenue, reduce downtime, and maintain customer trust during peak traffic events and automated attacks.

[!DNL Adobe Commerce on Cloud Infrastructure] includes built-in [Layer 3 and 4 DDoS protection](./fastly.md#ddos-protection) and a [Web Application Firewall (WAF)](./fastly-waf-service.md). Under the [shared responsibility model](https://experienceleague.adobe.com/en/docs/commerce-operations/security-and-compliance/shared-responsibility), Layer 7 DDoS detection, bot protection, and proactive IP blocking are merchant responsibilities, which [!DNL Adobe Commerce Advanced Security] is designed to address.

[!DNL Advanced Security] extends storefront protection through Fastly-powered edge security capabilities, which delivers bot management, advanced rate limiting, and Layer 7 DDoS protection as part of a unified edge platform that combines scale, performance, and security at the network edge.

>[!NOTE]
>
>[!DNL Advanced Security] is available for [!DNL Adobe Commerce on Cloud Infrastructure] (PaaS) projects only.

## Core capabilities

[!DNL Adobe Commerce Advanced Security] includes the following additional protections:

- **[Bot Management](https://docs.fastly.com/products/bot-management)**—Identifies and mitigates unwanted bot activity on your web applications. The Bot Management service distinguishes between legitimate bots (search engine crawlers, social media bots) and malicious ones, providing real-time classification at the network edge with options to block, allow, challenge, or rate-limit traffic.

- **[DDoS Protection](https://docs.fastly.com/products/fastly-ddos-protection)**—Provides Layer 7 (application layer) DDoS protection beyond the existing Layer 3 and 4 protection included with all [!DNL Adobe Commerce on Cloud Infrastructure] projects. The DDoS Protection service absorbs large-scale volumetric attacks and ensures continuous application availability during distributed denial-of-service (DDoS) events, protecting revenue during peak traffic periods.

- **[Advanced Rate Limiting](https://www.fastly.com/documentation/guides/next-gen-waf/rules/working-with-advanced-rate-limiting-rules/)**—Provides configurable rate limiting rules that protect specific URLs, API endpoints, and application resources from abuse. The Advanced Rate Limiting service goes beyond the [basic rate limiting](https://github.com/fastly/fastly-magento2/blob/master/Documentation/Guides/RATE-LIMITING.md) available through the Fastly CDN module to target specific traffic patterns and attack vectors, reducing infrastructure strain and cloud costs.

>[!NOTE]
>
>[!DNL Advanced Security] configurations currently require submitting a support ticket. Self-service configuration through the Admin UI is planned for a future release. Refer to [Request [!DNL Advanced Security]](#request-advanced-security) for more information.

>[!IMPORTANT]
>
>**Current limitations**
>
>Until the end of Q3 2026, customers cannot modify or manage Bot Management rules directly.
>
>For any rule additions, modifications, or adjustments, contact Adobe Commerce Support through a [support ticket](https://experienceleague.adobe.com/home?support-tab=home#support). The Support team will implement the requested changes.
>
>Beginning in Q4 2026, Fastly is scheduled to release an add-on capability that will allow customers to manage Bot Management rules in the Commerce Admin panel.

## Default rules and protections

The following default rules and protections are available with [!DNL Advanced Security].

### Layer 7 DDoS

- DDoS thresholds are built into the Fastly CDN platform and cannot currently be customized per customer.
- Logs for traffic blocked by DDoS protections are not directly visible to customers.
- Upon request, Adobe Commerce Support can provide details related to blocked DDoS traffic.
- Native DDoS log forwarding capabilities are expected in a future release.

### Bot management

The following baseline bot management protections are available through Fastly's Signal Sciences dashboard.

| Rule Type | Status | Visibility |
|---|---|---|
| Block traffic tagged as Suspected Bad BOT | Enabled by default during onboarding | Visible in New Relic logs under `sigsci_tags` |
| Block traffic based on any specific tag (sigsci tag) | Configured only when required in collaboration with the customer | Visible in New Relic logs under `sigsci_tags` |
| Rate limiting for specific APIs or URL patterns | Configured only when required in collaboration with the customer | Blocked traffic is visible in New Relic logs under `Agent_response` |
| Dynamic challenge for specific APIs or URL patterns | Configured only when required in collaboration with the customer | Blocked traffic is visible in New Relic logs under `Agent_response` |
| Browser challenge | Configured only when required in collaboration with the customer | Blocked traffic is visible in New Relic logs under `Agent_response` |

## Observability — monitoring bot protection and NGWAF activity

CDN logs are automatically forwarded to the customer's New Relic account. For additional details, refer to [Log management](../monitor/log-management.md).

The CDN logs include built-in telemetry from Signal Sciences (Bot Protection / Next-Generation WAF), allowing customers to monitor security events directly within New Relic.

Key fields include:

- **`Sigsci_Tags`**—Indicates classifications and tags applied by Signal Sciences.
- **`Agent_response`**—Indicates the action taken by the Bot Protection / NGWAF agent.

Examples:

- To identify traffic blocked by Bot Protection or NGWAF rules:

   `Agent_response:"406"`

   A response code of 406 indicates the request was blocked by the security controls.

- To identify requests tagged as suspected bad bots:

   `Sigsci_Tags:"*SUSPECTED-BAD-BOT*"`

These fields can be used to create dashboards, alerts, and investigations within New Relic to monitor bot activity, blocked requests, and other security-related events.

## Existing VCL capabilities remain unchanged

Enabling the [!DNL Advanced Security] add-on does not modify or replace existing Fastly VCL-based security controls.

The following existing VCL blocking capabilities continue to function without any changes:

- IP-based blocking
- Geo-blocking
- User-agent based blocking
- JA3 signature-based blocking
- JA4 signature-based blocking

Customers can continue using existing custom VCL configurations and security rules alongside the [!DNL Advanced Security] add-on features.

The [!DNL Advanced Security] add-on operates in addition to the standard Fastly CDN and existing VCL protections already available in [!DNL Adobe Commerce on Cloud Infrastructure].

## Threat coverage

[!DNL Advanced Security] protects storefronts from a range of automated and application-layer threats.

![Advanced Security positioning in the Adobe Commerce security stack](../../assets/advanced-security.svg)

### Bot-driven abuse

- **Credential stuffing**—Automated attempts to log in using stolen credentials from data breaches.
- **Account takeover**—Bots that attempt to gain unauthorized access to customer accounts.
- **Account creation abuse**—Automated creation of fake accounts for fraud or abuse purposes.
- **Card testing**—Bots that test stolen credit card numbers against your payment processor.
- **Content scraping**—Automated extraction of product data, pricing, or content from your storefront.
- **Inventory hoarding**—Bots that hold products in carts to prevent legitimate purchases.

### AI bot management

- **AI crawler detection**—Identifies and manages AI crawlers that scrape content to train large language models without consent.
- **AI fetcher control**—Controls AI fetchers used in real-time AI search results.
- **Configurable AI bot policies**—Distinguishes between verified and suspected AI bots with configurable signal types for policy enforcement.

### Application-layer attacks

- **Layer 7 DDoS attacks**—Distributed attacks targeting the application layer that bypass built-in Layer 3 and 4 protections. [!DNL Advanced Security] absorbs these volumetric attacks at the edge before they reach your origin servers.
- **URL and API abuse**—Attacks targeting specific URLs or API endpoints spread across a large number of IP addresses, where individual IP blocking is not effective.
- **Cache-busting attacks**—Requests with manipulated query parameters designed to bypass CDN caching and overwhelm the origin server.

### Additional capabilities

- **Dynamic Challenges**—Automatically assigns the optimal challenge to suspicious traffic. Leverages Private Access Tokens (PAT) to seamlessly validate a portion of requests without impacting the user experience.
- **Deception technology**—Addresses account takeover attempts by returning false information to attackers, mitigating their attack while disrupting their ability to operate at scale.

## Choosing the right protection

Use the following guidance to determine whether [!DNL Advanced Security] is the right solution for your storefront protection needs, or whether existing protections or alternative solutions are more appropriate.

### When to use [!DNL Advanced Security]

The following scenarios are best addressed with [!DNL Advanced Security]:

| Scenario | How [!DNL Advanced Security] helps |
|---|---|
| Your site experiences bot-driven attacks such as credential stuffing, content scraping, or inventory hoarding | Bot Management identifies and mitigates automated threats at the edge before they reach your application |
| You need Layer 7 DDoS protection beyond the built-in Layer 3 and 4 coverage | DDoS Protection absorbs application-layer attacks that bypass network-level protections |
| Specific URLs or API endpoints are targeted by high-volume distributed traffic that cannot be blocked by IP | Advanced Rate Limiting provides granular controls for specific endpoints and traffic patterns |
| You want to manage AI crawlers and fetchers accessing your storefront content | Bot Management includes configurable AI bot detection and enforcement policies |
| You need an Adobe-supported edge security solution integrated with your existing Fastly CDN | [!DNL Advanced Security] runs on the same Fastly edge platform already serving your storefront |

### When to use existing protections

The following scenarios are best addressed with existing protections:

| Scenario | Recommended approach |
|---|---|
| A single IP or small set of identifiable IPs is flooding your site with requests | Block the IPs using the Commerce Admin or Fastly API. Use built-in [Layer 3/4 DDoS protection](./fastly.md#ddos-protection) and existing [IP blocklist](./fastly-vcl-blocking.md) VCL snippets. |
| You need to block SQL injection, cross-site scripting (XSS), or other OWASP Top Ten threats | The included [WAF service](./fastly-waf-service.md) blocks these threats automatically. |
| Your DDoS attack patterns can be controlled with basic VCL blocking rules | Use the existing [custom VCL snippets](./fastly-vcl-custom-snippets.md) already available with Adobe Commerce. |

### When to use alternative protections

The following scenarios are best addressed with alternative protections that can complement [!DNL Advanced Security]:

| Scenario | Recommended approach |
|---|---|
| You need transaction-level fraud scoring or payment fraud prevention | Use a dedicated fraud prevention platform. [!DNL Advanced Security] protects at the edge network level and does not evaluate individual payment transactions. |
| You require identity and access management (IAM) | Implement a dedicated IAM solution. User authentication and session management remain customer responsibilities. |
| You need static or dynamic application security testing (SAST/DAST) | Use dedicated application security testing tools. Code-level vulnerability scanning is not provided. |
| You require comprehensive API security beyond rate limiting (such as schema validation or API gateway features) | Consider a dedicated API security platform. |
| You need regulatory compliance tooling such as PCI scanning or SOC reporting | Use dedicated compliance management tools. |

>[!TIP]
>
>If you currently use a third-party bot protection provider, consolidating to [!DNL Advanced Security] can reduce operational complexity, and eliminate inconsistent security coverage across providers. Contact your Adobe Account team to evaluate [!DNL Advanced Security] for your project.

## Security stack positioning

[!DNL Advanced Security] fits within the broader Adobe Commerce security architecture as an additional layer of edge-based protection. It works alongside — and does not replace — the WAF and Layer 3/4 DDoS protections already included with [!DNL Adobe Commerce on Cloud Infrastructure]. The following sections clarify how it relates to existing protections and the responsibilities that remain with the customer.

### Included protections

[!DNL Adobe Commerce on Cloud Infrastructure] includes the following security features:

- **[Web Application Firewall (WAF)](./fastly-waf-service.md)**—Managed protection against SQL injection, Cross-Site Scripting (XSS), and other Open Web Application Security Project (OWASP) Top Ten threats. Available on Production environments only.
- **[Layer 3 and 4 DDoS protection](./fastly.md#ddos-protection)**—Built-in protection against network-layer attacks such as SYN floods, UDP floods, ICMP-based attacks, and TCP-level attacks. Enabled automatically with Fastly CDN.
- **[SSL/TLS certificates](./fastly-configuration.md#provision-ssltls-certificates)**—Domain-validated encryption certificates for secure HTTPS traffic.
- **[Origin cloaking](./fastly.md#origin-cloaking)**—Ensures all traffic routes through Fastly, blocking direct access to origin servers.
- **[VCL-based security snippets](./fastly-vcl-custom-snippets.md)**—Custom Varnish Configuration Language (VCL) rules for IP blocking, allowlisting, and request filtering.

### [!DNL Advanced Security]

[!DNL Advanced Security] provides increased protection beyond the built-in protections included with [!DNL Adobe Commerce on Cloud Infrastructure], but at an additional cost:

- **Bot Management**—Edge-based bot detection and mitigation with AI bot management.
- **Layer 7 DDoS Protection**—Application-layer DDoS absorption and defense.
- **Advanced Rate Limiting**—Granular rate controls for URLs and API endpoints.
- **Dynamic Challenges and Deception Technology**—Automated challenge assignment and account takeover mitigation.

### Customer responsibility

- **Fraud prevention**—Transaction-level fraud scoring and payment fraud detection.
- **Identity and access management**—Customer authentication, authorization, and session management.
- **Application security testing**—SAST/DAST and vulnerability scanning.
- **Custom security configurations**—VCL-based rules, IP allowlists, and blocklists.
- **Compliance tooling**—PCI scanning, SOC compliance reporting, and regulatory audit tools.
- **Application-level hardening**—Token-based API authentication, query parameter normalization, and caching strategy design.

For a complete overview of Adobe and customer security responsibilities, see the [shared responsibility model](https://experienceleague.adobe.com/en/docs/commerce-operations/security-and-compliance/shared-responsibility).

## Common attack patterns and protections

The following table maps common attack patterns to the appropriate protection layer within the Adobe Commerce security stack.

| Attack pattern | Type | Protection |
|---|---|---|
| Single IP or set of identifiable IPs sending a large number of requests | DDoS + Bot | Block IPs using the Commerce Admin or Fastly API. Built-in Layer 3/4 DDoS protection filters this traffic at the network edge. |
| Attacks on specific URLs or APIs spread across a large number of IPs | DDoS + Bot | **[!DNL Advanced Security]**: Advanced Rate Limiting restricts request volume per URL. Bot Management identifies and blocks distributed bot traffic. |
| Automated attacks on REST API endpoints without proper authentication | Bot + DDoS | Verify that API endpoints use token-based authentication. Rotate credentials if the token is compromised. **[!DNL Advanced Security]**: Advanced Rate Limiting can protect exposed endpoints. |
| Cache-busting attacks using manipulated query parameters | Bot + DDoS | Exclude non-essential query parameters from cache keys. Normalize and restrict query parameters at the application level. **[!DNL Advanced Security]**: Bot Management detects and blocks automated cache-busting traffic. |
| SQL injection or cross-site scripting (XSS) attempts | WAF | The included [WAF service](./fastly-waf-service.md) blocks these threats automatically using managed security rules. |

### WAF blocking behavior

The following WAF behavior applies to all [!DNL Adobe Commerce on Cloud Infrastructure] projects, regardless of whether [!DNL Advanced Security] is enabled. The included WAF service uses the following blocking behavior for common attack signals:

- **SQL injection** requests are blocked immediately, even for a single matching request.
- Requests identified with the following threat signals from a known malicious IP are blocked immediately: Backdoor, Attack Tooling, CMDEXE, Log4J JNDI, Traversal, and XSS.
- Requests from non-malicious IPs that exhibit the above threat signals are blocked when they exceed the following thresholds:

| Interval | Threshold | Check frequency |
|---|---|---|
| 1 minute | 50 requests | Every 20 seconds |
| 10 minutes | 350 requests | Every 3 minutes |
| 1 hour | 1,800 requests | Every 20 minutes |

## Request [!DNL Advanced Security]

To request [!DNL Advanced Security]:

>[!NOTE]
>
>[!DNL Advanced Security] is available at an additional cost and requires an active [!DNL Adobe Commerce on Cloud Infrastructure] (PaaS) subscription.

1. Contact your Adobe Account team or Adobe Sales representative to discuss [!DNL Advanced Security] for your project.

1. After purchasing [!DNL Advanced Security], [submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/help-center-guide/magento-help-center-user-guide.html#submit-ticket) requesting [!DNL Advanced Security] enablement. Include your [!DNL Adobe Commerce on Cloud Infrastructure] project ID and the environments requiring enablement (for example, Production and Staging).

1. Adobe activates [!DNL Advanced Security] on your Fastly service and configures the initial protection policies. Enablement is usually completed within a few business days of ticket submission.

1. You receive confirmation that [!DNL Advanced Security] is active, along with details about the protections enabled for your environments.

>[!NOTE]
>
>Configuration changes to [!DNL Advanced Security] currently require [submitting a support ticket](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/help-center-guide/magento-help-center-user-guide.html#submit-ticket). Self-service configuration through the Admin UI is planned for a future release.

## Limitations

[!DNL Advanced Security] provides edge-layer storefront protection. The following capabilities are not available and are best addressed with complementary solutions:

- **Transaction-level fraud scoring**—[!DNL Advanced Security] does not evaluate individual payment transactions for fraud risk. Use a dedicated fraud prevention platform for transaction-level scoring.
- **Identity and access management (IAM)**—[!DNL Advanced Security] does not manage user authentication, authorization, or session management. These remain customer responsibilities.
- **Static and dynamic application security testing (SAST/DAST)**—[!DNL Advanced Security] does not include code-level vulnerability scanning or penetration testing.
- **API security**—While Advanced Rate Limiting can protect API endpoints from abuse, comprehensive API security features such as schema validation and API gateway management are not provided.
- **Full fraud prevention**—[!DNL Advanced Security] focuses on edge-layer storefront protection and is not a complete fraud management platform.
- **Compliance tooling**—[!DNL Advanced Security] does not provide PCI scanning, SOC compliance reporting, or regulatory audit capabilities.
