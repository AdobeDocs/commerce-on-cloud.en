---
title: Cloud architecture for Commerce
description: Learn how Starter and Pro project architectures contrast for Commerce on Cloud infrastructure.
feature: Cloud, Iaas, Paas
topic: Architecture
recommendations: noDisplay
exl-id: 7c1e895d-0f88-4f11-919a-b3b5748ca5f0
---
# Cloud architecture for Commerce

Adobe Commerce on cloud infrastructure has a Starter and a Pro plan. Each plan has a unique architecture to drive your Adobe Commerce development and deployment process. Both the Starter plan and the Pro plan architecture deploy databases, web servers, and caching servers across multiple environments for end-to-end testing while supporting continuous integration.

For comparison, each plan includes the following infrastructure features and supported products.

|          | Starter             | Pro                |
| -------- | --------------------| ------------------ |
| Core features | <ul><li>[All Adobe Commerce features](https://experienceleague.adobe.com/docs/commerce-operations/release/features.html)</li><li>PayPal Onboarding Tool</li><li>[Commerce Reporting](https://business.adobe.com/products/magento/business-intelligence.html?_ga=2.85288604.442698376.1665067470-1322106587.1655147209)</li></ul> | <ul><li>[All Adobe Commerce features](https://experienceleague.adobe.com/docs/commerce-operations/release/features.html)</li><li>PayPal Onboarding Tool</li><li>[Commerce Reporting](https://business.adobe.com/products/magento/business-intelligence.html?_ga=2.85288604.442698376.1665067470-1322106587.1655147209)</li><li>[B2B module](https://business.adobe.com/products/magento/b2b-ecommerce.html?_ga=2.105948422.442698376.1665067470-1322106587.1655147209)</li></ul> |
| Infrastructure and deployment | <ul><li>Continuous cloud integration tools with unlimited users</li><li>Fastly Content Delivery Network (CDN), Image Optimization (IO), and added security with generous bandwidth allowances. The Web Application Firewall (WAF) service is available on production environments only.</li><li>[New Relic](../monitor/new-relic-service.md) APM (Performance Monitoring) on 3 branches: `master` and 2 of your choice<br>Platform as a service (PaaS) production, staging, and development environments (4 total active environments) optimized for Adobe Commerce</li><li>Egress filtering (outbound firewall)</li></ul> | <ul><li>Continuous cloud integration tools with unlimited users</li><li>Fastly Content Delivery Network (CDN), Image Optimization (IO), and added security with generous bandwidth allowances. The Web Application Firewall (WAF) service is available on production environments only.</li><li>[New Relic](../monitor/new-relic-service.md) Infrastructure on Production + APM (Performance Monitoring) on staging and production. The [Managed alerts policy](../monitor/investigate-performance.md#monitor-performance-with-managed-alerts) for Adobe Commerce policy implements monitoring best practices to proactively notify you about application and infrastructure issues affecting site performance.</li><li>Platform as a service (PaaS) based [Integration development](pro-architecture.md#integration-environment) environments (2 total active environments) optimized for Adobe Commerce</li><li>Infrastructure as a service (IaaS)—dedicated virtual infrastructure for Staging and Production environments</li></ul> |
| High-availability infrastructure | | [High availability architecture](pro-architecture.md#redundant-hardware) with a three-server setup in the underlying Infrastructure as a service (IaaS) to provide enterprise grade reliability and availability |
| Dedicated hardware | | Isolated and dedicated hardware in the underlying Infrastructure as a service (IaaS) to provide even higher levels of reliability and availability |
| 24x7 email support | 24x7 monitoring and email support for the core application and the cloud infrastructure | 24x7 monitoring and email support for the core application and the cloud infrastructure |
| A dedicated Customer Technical Advisor (CTA) | | Dedicated technical account management for the initial launch period, starting with your subscription until your initial site launch |
| Add-ons\*| <ul><li>[B2B module](https://business.adobe.com/products/magento/b2b-ecommerce.html)</li></ul> |

\* _Available for an additional fee_

## Starter projects

The [Starter plan architecture](starter-architecture.md) has four environments:

- **Integration**—The integration environment provides two testable environments. Each environment includes an active Git branch, database, web server, caching, some services, environment variables, and configurations.

- **Staging**—As code and extensions pass your tests, you can merge your `integration` branch to the Staging environment, which becomes your pre-production testing environment. It includes the `staging` active branch, database, web server, caching, third-party services, environment variables, configurations, and services, such as Fastly and New Relic.

- **Production**—When code is ready and tested, all code merges to `master` for deployment to the production live site. This environment includes your active `master` branch, database, web server, caching, third-party services, environment variables, and configurations.

- **Inactive**—You have an unlimited number of inactive branches.

## Pro projects

The [Pro plan architecture](pro-architecture.md) has a global `master` with three environments:

- **Integration**—The integration environment provides a testable environment that includes a database, web server, caching, some services, environment variables, and configurations. You can develop, deploy, and test your code before merging to the Staging environment.

    - _Inactive_—You can have an unlimited number of inactive branches based on the `integration` environment, but only one active branch (not including `integration` ).

- **Staging**—The staging environment is for pre-production testing and includes a database, web server, caching, third-party services, environment variables, configurations, and services, such as Fastly.

- **Production**—The production environment includes a three-node, high-availability architecture for your data, services, caching, and store. Production is your live, public store environment with environment variables, configurations, and third-party services.

## Supported software and services

Adobe Commerce on cloud infrastructure uses:

- Operating system: Debian GNU/Linux
- Web server: Nginx
- Database: MySQL (MariaDB)
- Content Delivery Network (CDN): Fastly CDN

You can configure the following services:

- [PHP](../application/php-settings.md)
- [MySQL](../services/mysql.md)
- [Redis](../services/redis.md)
- [RabbitMQ](../services/rabbitmq.md)
- [Elasticsearch](../services/elasticsearch.md)
- [OpenSearch](../services/opensearch.md)

{{elasticsearch-support}}

>[!NOTE]
>
>See [System requirements](https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/system-requirements.html) in the _Installation guide_ for recommended versions.

The Fastly CDN module is used for CDN and caching services on staging and production environments. See [Configure Fastly services](../cdn/fastly.md).

For information about configuring the software versions to use in your implementation, see the following Adobe Commerce on cloud infrastructure configuration files:

- [Application configuration (.magento.app.yaml)](../application/configure-app-yaml.md)
- [Environment configuration (.magento.env.yaml)](../environment/configure-env-yaml.md)
- [Routes configuration (routes.yaml)](../routes/routes-yaml.md)
- [Services configuration (services.yaml)](../services/services-yaml.md)
