---
title: Adobe Commerce Traffic Insights
description: Learn about the Adobe Commerce Traffic Insights tool and how it can help you understand traffic on your Adobe Commerce on cloud infrastructure project.
feature: Cloud, Observability
role: Admin
---
# Traffic Insights

Adobe Commerce Traffic Insights is a New Relic One app that visualizes [!DNL Adobe Commerce on Cloud Infrastructure] Fastly CDN traffic. It reads the Fastly CDN access-log lines already being shipped into New Relic as `Log` events and renders a curated set of charts, scoped to a New Relic account you select and the platform time range. This visualizes a store's edge traffic without writing NRQL, New Relic's query language, by hand.

## Accessing the app

- **Direct link:** [Adobe Commerce Traffic Insights](https://one.newrelic.com/a9a0c3b8-3844-4ca1-8bad-c6742747be47).
- **From the New Relic One home screen** (one.newrelic.com) — once the account is subscribed to the app, it appears as its own tile, **Adobe Commerce Traffic Insights** on the home page.
- **From the top search bar (Quick Find)** — search for `Adobe Commerce Traffic Insights` and select it from the results.
- **To pin it for faster access** - use the star or pin control on the app's tile or page header to add it to favorites or the left navigation. The exact location of this control depends on the New Relic UI version in use for the account.

This guide is organized in four parts:

- **[Understanding the app](understanding-the-app.md)** - What Traffic Insights is, how to use it, how the numbers are measured, and what the data can and cannot tell you.
- **[Metrics and signals reference](metrics-signals-reference.md)** - Defines every metric and Fastly Next-Gen WAF signal.
- **[Widget reference](widget-reference.md)** - A dedicated description of every chart in each tab.
- **[Investigation playbook](investigation-playbook.md)** - Recommended approaches to the three problems the app is built to solve: bandwidth overage, crawler load, and malicious traffic. Each of these references the widget that confirms it, and specifies Adobe's native [Advanced Security](../../cdn/advanced-security.md) escalation path for when manual mitigation is insufficient.
