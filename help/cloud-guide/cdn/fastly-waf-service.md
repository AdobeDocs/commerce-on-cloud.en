---
title: Web Application Firewall (WAF)
description: Learn how the Fastly WAF service detects, logs, and blocks malicious request traffic before it can damage the Adobe Commerce network or sites.
feature: Cloud, Configuration, Security
exl-id: f00e35f2-9800-4e24-a4d0-d36fde59a003
---
# Web Application Firewall (WAF)

Powered by Fastly, the web application firewall (WAF) service for Adobe Commerce on cloud infrastructure detects, logs, and blocks malicious request traffic before it can damage your sites or network. The WAF service is available on production environments only.

The WAF service provides the following benefits:

- **PCI compliance**—WAF enablement ensures that Adobe Commerce storefronts in Production environments meet PCI DSS 6.6 security requirements.
- **Default WAF policy**—The default WAF policy, configured and maintained by Fastly, provides a collection of security rules tailored to protect your Adobe Commerce web applications from a wide range of attacks, including injection attacks, malicious inputs, cross-site scripting, data exfiltration, HTTP protocol violations, and other [OWASP Top Ten](https://owasp.org/www-project-top-ten/) security threats.
- **WAF onboarding and enablement**—Adobe deploys and enables the default WAF policy in your Production environment within 2 to 3 weeks after provisioning is final.
- **Operations and maintenance support**—
  - Adobe and Fastly setup and manage your logs, rules, and alerts for the WAF service.
  - Adobe triages customer support tickets related to WAF service issues that block legitimate traffic as Priority 1 issues.
  - Automated upgrades to the WAF service version ensure immediate coverage for new or evolving exploits. See [WAF maintenance and upgrades](#waf-maintenance-and-updates).

>[!TIP]
>
>For additional information about maintaining PCI compliance for your Adobe Commerce on cloud infrastructure stores, see [PCI compliance](https://business.adobe.com/products/magento/pci-compliance.html).

## Enabling the WAF

Adobe enables the WAF service on new accounts within 2 to 3 weeks after provisioning is final. The WAF is implemented through the Fastly CDN service. You do not have to install or maintain any hardware or software.

>[!NOTE]
>
>Before you can use the WAF service, you must all external traffic to your Adobe Commerce on cloud infrastructure project must route through the Fastly service. See [Set up Fastly](fastly-configuration.md).

## How it works

The WAF service integrates with Fastly and uses the cache logic within the Fastly CDN service to filter traffic at the Fastly global nodes. We enable the WAF service in your Production environment with a default WAF policy based on [ModSecurity Rules from Trustwave SpiderLabs](https://github.com/owasp-modsecurity/ModSecurity) and the OWASP Top Ten security threats.

The WAF service inspects HTTP and HTTPS traffic (GET and POST requests) against the WAF ruleset and blocks traffic that is malicious or does not comply with specific rules. The service inspects only origin-bound traffic that attempts to refresh the cache. As a result, we stop most attack traffic at the Fastly cache, protecting your origin traffic from malicious attacks. By processing only origin traffic, the WAF service preserves cache performance, introducing only an estimated 1.5 milliseconds to 20 milliseconds of latency to every non-cached request.

## Troubleshooting blocked requests

When the WAF service is enabled, it inspects all web and admin traffic against the WAF rules and blocks any web request that triggers a rule. When a request is blocked, the requestor sees a default `403 Forbidden` error page that includes a reference ID for the blocking event.

![WAF error page](../../assets/cdn/fastly-waf-403-error.png)

You can customize this error response page from the Admin. See [Customize the WAF response page](fastly-custom-response.md#customize-the-waf-error-page).

If your Adobe Commerce admin page or storefront returns a `403 Forbidden` error page in response to a legitimate URL request, submit an [Adobe Commerce Support ticket](https://experienceleague.adobe.com/en/docs/commerce-knowledge-base/kb/help-center-guide/magento-help-center-user-guide#support-case). Copy the reference ID from the error response page and paste it into the ticket description.

To identify the WAF response for a particular request using New Relic, refer to the following:

- `Agent_response`—Indicates the WAF response code (`200` means good and `406` means blocked)
- `sigsci` tags—Tags the request to a particular signal sciences tag based on the nature of the request

## WAF maintenance and updates

Fastly updates and rolls out patches for new CVEs/templated rules based on rule updates from commercial third parties, Fastly research, and open sources. Fastly updates the published rules into a policy as needed, or when changes to the rules are available from their respective sources. Also, Fastly can add rules that match the published classes of rules into the WAF instance of any service after the WAF service is enabled. These updates ensure immediate coverage for new or evolving exploits.

Adobe and Fastly manage the update process to ensure that new or modified WAF rules work effectively in your Production environment before the updates are deployed in blocking mode.

## Problems

If you find that the WAF is blocking legitimate requests, these are often false positives and will need to be bypassed or have a workaround implemented at the WAF service. Submit a Support ticket and include the impacted URL, exact steps to reproduce the error, and the error reference in text form (as opposed to a screenshot) to avoid transcription errors.

## Limitations

The standard WAF service powered by Fastly does not support the following features:

- Protection against malware or bot mitigation—Consider using [access control lists](./fastly-vcl-allowlist.md) or a third-party service.
- Rate limiting—See [Rate Limiting](https://github.com/fastly/fastly-magento2/blob/master/Documentation/Guides/RATE-LIMITING.md) in the Fastly documentation, or see [Rate limiting](https://developer.adobe.com/commerce/webapi/get-started/rate-limiting/) in the _Commerce Web API_ security section.
- Configuring a logging endpoint for customer—See [PrivateLink service](../development/privatelink-service.md) as an alternative.

The WAF service allows you to block or allow traffic based on IP addresses. You can add access control lists (ACL) and custom VCL snippets to your Fastly service to specify the IP addresses and VCL logic for blocking or allowing traffic. See [Custom Fastly VCL snippets](fastly-vcl-custom-snippets.md).

Filtering for TCP, UDP, or ICMP requests is not supported by the WAF service. However, this functionality is provided by the built-in DDoS protection included with the Fastly CDN service. See [DDoS protection](fastly.md#ddos-protection).
