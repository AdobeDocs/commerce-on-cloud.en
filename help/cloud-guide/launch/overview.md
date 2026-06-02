---
title: Site launch
description: Learn how to begin site launch preparation.
exl-id: 95abc7aa-ed4d-44f7-96aa-517c646bc00d
TQID: https://experienceleague.adobe.com/-aWGtM8yXIMPfKihDMD6LS1r2-UIuceyf9X4TTIFTf0
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: ba9e5be9-7de1-4f71-a5d2-baead0e425ee
    internal-label: Security
  - id: c32adafa-ed01-4b31-997e-2413013911b0
    internal-label: Integrations
  - id: d1e21356-0064-4f48-9089-16e3f0dbd2a6
    internal-label: Storefront
  - id: dac87252-6066-4d6e-a9d2-f6d84c323de7
    internal-label: Configuration
  - id: e8818fe6-9c8b-4bc0-9ef8-377a10b7bc75
    internal-label: Architecture
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
topic_v2:
  - id: b5ce8718-c3af-4fdb-a1a9-fca32f83a87c
    internal-label: Implementation
  - id: d095671a-1355-40aa-8b5f-06c33c68080b
    internal-label: Security
---
# Site launch

When you have completed deployment and testing in Integration and Staging environments, you can begin site launch preparation. First, you should complete all development and testing before working in the Production environment. Feel ready to launch? Review checklists, best practices, and final steps to launch your site.

If you checked this information before deploying and testing in Staging, consider reviewing the benefits of testing in Staging first in the next section. Staging is a near-production environment running on similar hardware, configurations, architecture, and services. It can reduce your downtime and make your extension, service, custom configurations, and merchant User Acceptance Testing vital components to releasing your sites and stores.

## Why test fully in integration, staging, and production?

We strongly recommend testing in the Integration, Staging, and Production environments due to the complexity of ensuring that your custom code, themes, extensions, and third-party integrations all work together to operate your stores. The following are common issues that you can discover and resolve when you complete testing in the Integration and Staging environments before updating your Production environment:

-  Staging supports all Production services, features, database data, technology stack, architecture, and more. It mirrors Production, which means if errors occur in Staging, you have a warning before they occur in Production.

-  Code that works in your local integration environment might not work in Staging and Production environments.

-  Integration environments do not support some services that are available in Staging and Production, like Fastly and New Relic.

-  [Fully test](../test/guidance.md) your site with various tools in Staging for load, stress, performance, and site assets.

-  Because integration environments may only have databases populated with test data, not matching a production-like environment, you might find additional errors or unexpected behavior when testing in Staging or Production environments.

## Prerequisites for site launch

You need the following information and resources to prepare for site launch:

-  CNAME record information for configuring the DNS

-  List of all storefront domains to add to the certificate

-  SSL/TLS certificate

As part of Adobe Commerce on cloud infrastructure subscription, Adobe provides a Domain-Validated SSL/TLS certificate issued by Let's Encrypt. Each Pro Production, Staging, and Starter Production (`master`) environment has a unique certificate that covers all domains and subdomains in that environment. These certificates are provisioned and uploaded to your site automatically after you update your DNS configuration for development and production. See [Provision SSL/TLS certificates](../cdn/fastly-configuration.md#provision-ssltls-certificates).

>[!NOTE]
>
>If you want to deploy your own Extended Validation SSL certificate for your company instead of using the Let's Encrypt certificate, contact your CTA or [Submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/help-center-guide/magento-help-center-user-guide.html#submit-ticket).

## Set up the Security Scan Tool

>[!NOTE]
>
>The security scan tool uses the following public IP addresses:
>
>```text
>52.87.98.44
>34.196.167.176
>3.218.25.102
>```
>
>Add these IP addresses to an allowlist in your network firewall rules to allow the tool to scan your site. The tool posts requests to ports 80 and 443 only.

The Security Scan Tool enables you to regularly monitor your store websites and receive updates for known security risks, malware, and out-of-date software. This tool is a free service available for all implementations and versions of Adobe Commerce on cloud infrastructure. You access the tool through your [Commerce Marketplace account](https://account.magento.com/customer/account/login).

-  Monitor your sites security status and applied security updates

-  Receive security updates and site-specific notifications

>[!NOTE]
>
>Adobe recommends using the Security Scan Tool over other third-party tools to ensure the best quality of service during the findings investigation.

See the [User Guide](https://experienceleague.adobe.com/en/docs/commerce-admin/systems/security/security-scan) for information about setting up and using the security scan tool. Typically, you start using this tool when you begin user acceptance testing (UAT).

Each site you scan must be registered through the Security Scan tab. During the registration process, you must accept the disclaimer before you can begin scanning. You control both the schedule and authorizing the user to receive notifications when each scan is complete. You can schedule scans for a specific, recurring date and time, or run a scan on demand as needed.

The Security Scan Tool uses several user agent strings to simulate real-life malware activity. You might see the following user agents in your analytics or access logs:

```text
Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0
GuzzleHttp/6.3.3 curl/7.29.0 PHP/7.1.18
Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36
Visbot/2.0 (+http://www.visvo.com/en/webmasters.jsp;bot@visvo.com)
```

## Scan your site

1. Access your [Commerce Marketplace account](https://account.magento.com/customer/account/login).

1. Click the Security Scan tab and select **Go to Security Scan**.

1. In the _Actions_ column for the site, select **Run Scan**. A notification status displays the scheduled scan.

### To review the report:

1. When the report completes, a notification displays.

1. In the site row, select the report you want to view from the **Reports** column. The order is latest to oldest.

The report lists issues including Failed Scans, Unidentified Results, and Successful Scans. Each entry provides detailed information for the scan, a list of issues to investigate, and actions to take. Some of these actions may require downloading and installing security patches. Add any required patches to a development branch on your local workstation before adding them to the production branch.

Scan results include a label that describes scan pass or fail status with detailed information about the checks performed:

-  "Failed" indicates that the website contains a serious vulnerability.

-  "Unidentified" suggests that a deeper review is required by your team or hosting provider to determine if further action is required.

The scan results also provide suggested remediation steps for each failed security test. Security scan results are protected and viewable only by the registered user. Only users designated in the site registration process receive scan completion notifications.

## Ready to launch your site

When you are ready to begin the site launch process, see the following:

-  [Launch checklist](checklist.md)

-  [Launch steps](steps.md)
