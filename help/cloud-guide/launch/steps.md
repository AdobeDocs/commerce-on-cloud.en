---
title: Launch steps
description: Learn how to complete the site launch.
exl-id: e7a3cd6b-32de-4fd0-9fbd-da8299e77114
TQID: https://experienceleague.adobe.com/Nl8YFJUZUkxtsm0eqBgJklsTysKuUE31PkEDsJmvBMU
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: c1256247-af4b-46d8-9dca-0c654ecfa157
    internal-label: Order Management System
  - id: d1e21356-0064-4f48-9089-16e3f0dbd2a6
    internal-label: Storefront
  - id: dac87252-6066-4d6e-a9d2-f6d84c323de7
    internal-label: Configuration
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Launch steps

After testing and completing your launch checklist, you can start the final steps to launch. These steps include entering tickets, transfer site access, and finally testing your store when live.

Adobe support staff work with you through the process, checking status, and helping if any questions or issues occur. All issues should be tracked with tickets to best capture what happened and how it was resolved. When you begin continuous iterations deploying updates to your launched store, you may have similar issues occur again. These tickets can help pinpoint the issues and help adjust your deployment tasks.

## Contact Adobe to launch your site

Contact Adobe Commerce support and update any site launch (go live) tickets with the intended date and time to switch over and launch your store.

## Switch DNS to the new site

The Time-to-Live changed value is important for checking your changed domain. When you modify the A and CNAME records, the update takes the TTL configured time to update correctly. For details on DNS settings, see [DNS configurations](checklist.md#update-dns-configuration-with-production-settings).

### To change to the new site:

1. Access your DNS service.

1. Update your A and CNAME records for your domains and hostnames.

1. Wait for the TTL time to pass and restart your web browser.

1. Access your store using the storefront domain.

## Test the live store

Complete a few UAT tests in your live store to confirm that everything is loading and actions complete correctly. For a list of tests, see [Test deployment](../test/staging-and-production.md#complete-uat-testing).

## Post-Launch

Adobe checks and monitors the site to ensure that all services and access are in the green. We remain on hand as needed to walk through and check that all system logs, services, caching, and functions are working as you and your customers need.

If any issues occur, create and track issues with Support. Include as much information as possible including date/time, specific feature with a problem, symptoms and odd behaviors, extensions, and more. We investigate the logs, the issue, and work with you to resolve quickly as possible.
