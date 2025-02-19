---
title: New Relic service
description: Learn about the New Relic service available with your Adobe Commerce on cloud infrastructure project.
feature: Cloud, Observability
last-substantial-update: 2023-09-06
exl-id: 10966241-311d-4b68-804d-4c9569bf933d
---
# New Relic service overview

All Adobe Commerce projects on cloud infrastructure include access to the New Relic service to help monitor performance and investigate events of the [!DNL Commerce] application and cloud infrastructure.

The following New Relic features are available for use with Production and Staging environments:

- [New Relic APM](#new-relic-apm) (Pro and Starter)
- [New Relic Infrastructure](#new-relic-infrastructure) (Pro only)
- [New Relic Log Management](#new-relic-log-management) (Pro only)

>[!INFO]
>
>Other New Relic features are not available on Adobe Commerce projects.

## New Relic APM

[New Relic for application performance management (APM)](https://docs.newrelic.com/introduction-apm/) is a software analytics product that helps you analyze and improve application interactions. New Relic APM is available to all Adobe Commerce on cloud infrastructure projects and provides the following features:

- **Focus on specific transactions**—Actively mark and monitor key customer actions in your site, such as adding to the cart, checking out, or processing a payment.
- **Database query monitoring**—Locate and monitor database queries affecting performance.
- **App Map**—View all application dependencies within your site, extensions, and external services.
- **[!DNL Apdex] scores**—Evaluate performance and create alerts that identify issues and notify you when they occur, such as site performance affected by a flash sale or web event. See [Apdex score](https://docs.newrelic.com/docs/apm/new-relic-apm/apdex/apdex-measure-user-satisfaction/).
- **Managed alerts for Adobe Commerce**–Use this New Relic alert policy to monitor application and infrastructure performance based on industry best practices. See [Monitor performance with the Managed alerts for Adobe Commerce alert policy](investigate-performance.md/#monitor-performance-with-managed-alerts).
- **Track deployments**—Monitor deployment events and analyze deployment impact to overall performance. See [Track deployments](track-deployments.md).

Your Adobe Commerce on cloud infrastructure project includes the software for the New Relic APM service along with a license key. You do not need to purchase or install any additional software.

## New Relic Infrastructure

Pro projects include the [New Relic Infrastructure (NRI)](https://docs.newrelic.com/docs/infrastructure/infrastructure-monitoring/get-started/get-started-infrastructure-monitoring/) service, which automatically connects with the application data and performance analytics to provide dynamic server monitoring. This service is available on Pro Production and Staging environments.

## New Relic Log Management

All cloud infrastructure projects include [New Relic log management](log-management.md). The service is pre-configured to aggregate all log data from your Staging and Production environments and display it in a centralized log management dashboard.
