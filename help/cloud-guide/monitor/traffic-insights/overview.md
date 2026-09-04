---
title: Adobe Commerce Traffic Insights
description: Learn about the Adobe Commerce Traffic Insights tool and how it can help you understand traffic on your Adobe Commerce on cloud infrastructure project.
feature: Cloud, Observability
role: Admin
---
# Traffic Insights

Adobe Commerce Traffic Insights is a New Relic One app that visualizes [!DNL Adobe Commerce on Cloud Infrastructure] Fastly CDN traffic. It reads the Fastly CDN access-log lines already being shipped into New Relic as `Log` events and renders a curated set of charts, scoped to a New Relic account you select and the platform time range. This visualizes a store's edge traffic without writing NRQL, New Relic's query language, by hand.

## What it helps you investigate

Traffic Insights is designed to help you solve three common problems:

- **CDN bandwidth overage** — Traffic trending above the contract allowance. Attribute the volume to heavy media, large files, non-cacheable 404 pages, or an inefficient cache, down to a specific domain, content type, URL, or project.
- **Search bot and crawler load** — A search engine or AI crawler generating a disproportionate share of requests, hurting cache efficiency and origin load. See which named bots are most active and exactly what they fetch.
- **Malicious scripts and scrapers** — Scraping, credential stuffing, card testing, fake-account creation, or Layer 7 abuse. Surface the Fastly Next-Gen WAF signals and the IPs, subnets, and countries behind suspicious traffic.

In each case the app identifies the *who, what, and where* of the traffic. Acting on that information through Fastly VCL rules, image optimization, cache tuning, rate limiting, or Adobe's [Advanced Security](../../cdn/advanced-security.md) add-on in your Commerce and Fastly configuration. The [Investigation playbook](investigation-playbook.md) covers each of these issues.

## Accessing the app

- **Direct link:** [Adobe Commerce Traffic Insights](https://one.newrelic.com/a9a0c3b8-3844-4ca1-8bad-c6742747be47).
- **From the New Relic One home screen** (one.newrelic.com) — once the account is subscribed to the app, it appears as its own tile, **Adobe Commerce Traffic Insights** on the home page.
- **From the top search bar (Quick Find)** — search for `Adobe Commerce Traffic Insights` and select it from the results.
- **To pin it for faster access** - use the star or pin control on the app's tile or page header to add it to favorites or the left navigation. The exact location of this control depends on the New Relic UI version in use for the account.

## In this guide

- **[Understanding the app](understanding-the-app.md)** - What Traffic Insights is, how to drive it with filters, how the numbers are measured, and what the data can and cannot tell you.
- **[Investigation playbook](investigation-playbook.md)** - Recommended approaches to the three problems the app is built to solve: bandwidth overage, crawler load, and malicious traffic. Each of these references the chart that confirms it, and specifies Adobe's native [Advanced Security](../../cdn/advanced-security.md) escalation path for when manual mitigation is insufficient.