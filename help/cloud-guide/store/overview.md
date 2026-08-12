---
title: Overview of store options and configuration management
description: Customize your Adobe Commerce store on cloud infrastructure.
feature: Cloud, Configuration, Services
exl-id: e653172f-7370-4761-b2ce-3a420b33b948
TQID: https://experienceleague.adobe.com/iseYcfjh61-4ArUf9rKBGKFVuOz1dbS1xVq-FYiCxsw
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
topic_v2:
  - id: c1579802-ddd4-4214-8a91-97b2066abe11
    internal-label: Troubleshooting
---
# Overview of store options and configuration management

There are many ways to customize your store, such as adding a custom theme, installing an extension, or enforcing a specific configuration across cloud infrastructure environments. You can configure settings for specific services directly in Staging and Production environments. You can set up multiple websites and stores. The Store configuration helps you to configure these options in your local workstation and deploying specific settings across environments.

To access your storefront, use the `magento-cloud url` command and answer the prompts. Or you can find the url in the [!DNL Cloud Console] under **Access site**.

## Configure store options

Store options include the following:

* [Business-to-business module (B2B)](b2b-module.md)
* [Custom themes](custom-theme.md)
* [Extensions](extensions.md)
* [Multiple sites](multiple-sites.md)
* [Payment services](paypal.md)

## Configure services and integrations

There are specific [configuration files](../environment/overview.md) that manage certain deployment behaviors to remote environments. You can review these topics separately:

* [Application deployment](../application/configure-app-yaml.md)
* [Environment build and deploy actions](../environment/configure-env-yaml.md)
* [Incoming request routes](../routes/routes-yaml.md)
* [Supported services](../services/services-yaml.md)

## Configuration management

After configuring the store options, services, and integrations, use configuration management to deploy these configurations across all environments consistently and with minimal downtime. See [Configuration Management](store-settings.md).
