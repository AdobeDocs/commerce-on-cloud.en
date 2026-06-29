---
title: Reroute requests to a CMS backend
description: Learn how to reroute incoming requests from an Adobe Commerce store to a separate WordPress site using the Fastly edge module.
feature: Cloud, Configuration, Routes
exl-id: ef024c68-395b-4d47-9362-a8404a93dbbe
TQID: https://experienceleague.adobe.com/zRM-iTFGNPgSmT5xu1B9Lo3-onUtCHh-tVY-WPPiVC8
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: dac87252-6066-4d6e-a9d2-f6d84c323de7
    internal-label: Configuration
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Reroute requests to a CMS backend

Reroute incoming requests from an Adobe Commerce store to a separate WordPress site using the Fastly Edge Module _Other CMS/backend integration_ with an Edge Dictionary. You can follow a similar process to reroute requests to other CMS backends.

Use Fastly Edge Modules to create and upload custom VCL code from the Admin instead of manually writing the VCL code and uploading it using the Fastly API.

>[!NOTE]
>
>We recommend adding custom VCL configurations to a Staging environment where you can test them before updating the Fastly service configuration in the Production environment.

**Prerequisites**

{{$include /help/_includes/vcl-snippet-prerequisites.md}}

**To reroute requests from Adobe Commerce to WordPress**:

1. Enable Fastly Edge Modules in the Staging or Production environment.

   - Log in to the Admin.

   - Navigate to **Stores** > Settings > **Configuration** > **Advanced** > **System** > **Full Page Cache** > **Fastly Configuration** > **Advanced Configuration**.

   - Set the value for **Fastly Edge Modules** to **Yes**.

   - Save the configuration.

1. Identify the URL paths to reroute to the WordPress backend.

1. Complete the following tasks to configure the Fastly service and create the custom VCL code for rerouting requests to the WordPress backend.

   - Create an Edge Dictionary that specifies the paths to reroute from the Adobe Commerce store to the backend.

   - Add the WordPress backend to the Fastly service configuration and attach the request condition for the URL rewrites.

   - Configure the _Other CMS/backend integration_ Edge Module to handle the URL rewrites from Adobe Commerce to the WordPress backend.

     For detailed instructions, see [Fastly Edge Modules - Other CMS/Backend integration](https://github.com/fastly/fastly-magento2/blob/master/Documentation/Guides/Edge-Modules/EDGE-MODULE-OTHER-CMS-INTEGRATION.md) in the _Fastly CDN module for Magento 2_ documentation.

1. After updating the Fastly service configuration, test your Adobe Commerce store to ensure that the specified URL requests for WordPress are rerouted correctly.

<!-- Last updated from includes: 2025-01-27 17:16:28 -->

