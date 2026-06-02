---
title: Technology stack
description: See the technology stack that forms the Commerce on Cloud infrastructure.
feature: Cloud, Iaas, Paas
exl-id: 3fac1ab7-6440-4bf9-8169-9fadf51d70dd
TQID: https://experienceleague.adobe.com/2-uZdx1Oi-3LQUK-L7rC4kZWYcYobEhnVcUDNwOHpFs
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: b5f00040-57a0-4a6d-a39e-383b1936c2c9
    internal-label: Compliance
  - id: ba9e5be9-7de1-4f71-a5d2-baead0e425ee
    internal-label: Security
  - id: c1256247-af4b-46d8-9dca-0c654ecfa157
    internal-label: Order Management System
  - id: d1e21356-0064-4f48-9089-16e3f0dbd2a6
    internal-label: Storefront
  - id: e8818fe6-9c8b-4bc0-9ef8-377a10b7bc75
    internal-label: Architecture
subfeature_v2:
  - id: df5e974b-6742-4873-a687-a6bedaafdaa2
    internal-label: IaaS
  - id: f2261633-201d-46c5-8a66-999e70527a83
    internal-label: PCI
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
topic_v2:
  - id: cdd65e7e-8839-44a2-bc21-0e03623b5dd1
    internal-label: Optimization
  - id: d095671a-1355-40aa-8b5f-06c33c68080b
    internal-label: Security
---
# Technology stack

Think of the Adobe Commerce on cloud infrastructure as five functional layers, as shown below:

![Cloud stack](../../assets/CloudStack.png)

1. [**Cloud Infrastructure**](pro-architecture.md): Choose either Amazon Web Services (AWS) or Microsoft Azure as your Infrastructure as a Service (IaaS) foundation for your Adobe Commerce on cloud infrastructure Pro projects.

   Adobe routinely analyzes your virtual compute resource (vCPU) usage and automatically allocates resources to optimize your long-term usage and mitigate the risk of exceeding your maximum annual vCPU day allowance. If you expect increased site traffic for specific time periods, you must continue to open a Support ticket to [request a temporary upsize](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/how-to/how-to-request-temporary-magento-upsize.html).

1. [**Platform as a Service**](cloud-architecture.md): Each Adobe Commerce on cloud infrastructure project provides a Platform as a Service (PaaS) Integration environment for developing, testing, and integrating services.
1. [**Adobe Commerce**](../project/overview.md): Adobe Commerce on cloud infrastructure provides a pre-provisioned infrastructure that includes PHP, MySQL (MariaDB), Redis, message queue services ([!DNL RabbitMQ] or [!DNL ActiveMQ]), and supported search engine technologies.
1. [**Performance Tools**](../monitor/new-relic-service.md): New Relic performance tools enable you to debug, monitor, and manage your applications and infrastructure by collecting, analyzing, and displaying data from your Adobe Commerce on cloud infrastructure projects.
1. [**Content Delivery Network (CDN), Web Application Firewall ([!DNL WAF]), and Image Optimization (IO)**](../cdn/fastly.md):

   * [Fastly CDN](../cdn/fastly.md#ddos-protection)—Provides secure CDN services with built-in protection from Distributed Denial of Service (DDoS) attacks like [!DNL Ping of Death], [!DNL Smurf] attacks, and other Internet Control Message Protocol (ICMP) based flood attacks.
   * [Web Application Firewall (WAF)](../cdn/fastly-waf-service.md)—WAF services ensure PCI compliance for Adobe Commerce storefronts in production environments and WAF policies that protect your Adobe Commerce web applications from injection attacks, malicious input, cross-site scripting, data exfiltration, HTTP protocol violations, and other [[!DNL OWASP] Top Ten security threats](https://owasp.org/www-project-top-ten/).
   * [Image optimization (IO)](../cdn/fastly-image-optimization.md)—Provides real-time image manipulation and optimization to speed up image delivery and simplify maintenance of image source sets for responsive web applications. Fastly IO offloads image processing and resizing load, freeing servers to process orders and conversions efficiently.

Monolithic applications are resource-intensive and difficult to scale and serve rapidly. With the Cloud infrastructure, Commerce customers gain unparalleled access to SaaS-based microservices that are rich, intelligent, and performant. See [Supported software and services](cloud-architecture.md#supported-software-and-services).

Use the [Commerce Get Started guide](../../get-started/overview.md) to set up your new Cloud program and begin managing your [!DNL Commerce] application in a cloud-native environment.
