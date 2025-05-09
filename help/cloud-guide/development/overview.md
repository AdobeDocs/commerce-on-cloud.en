---
title: Development overview
description: Prepare for local development with an Adobe Commerce on cloud infrastructure project.
role: Developer
feature: Cloud, Install
topic: Development
last-substantial-update: 2024-02-06
exl-id: 14fb0b41-1c3a-4abc-8726-cea16ab00ba8
---
# Development overview

Adobe Commerce on cloud infrastructure remote environments are **Read Only**, including all Starter environments and all Pro integration, Staging, and Production environments. In a local development environment, you can write and test code before pushing it to an integration environment for further testing and deployment to Staging and Production.

Before preparing your local workspace, ensure that you have your [credentials](../../get-started/prepare-workspace.md). Local development requires PHP and Composer installation unless you opt to use [Cloud Docker for Commerce](#docker-environment).

## Required packages

Adobe Commerce on cloud infrastructure uses Composer to manage the dependencies and upgrades for projects. For local development, you must install the PHP and Composer versions that are compatible with your Cloud project. For example, if you are using the [!DNL Commerce] 2.4.8 cloud template, you can see that the [`.magento.app.yaml`](https://github.com/magento/magento-cloud/blob/2.4.8/.magento.app.yaml) configuration file uses **PHP 8.4** and **Composer 2.8.4**.

Composer installs the required libraries and dependencies for your project in the `vendor` directory. The following required Composer files are in the project root directory:

- `composer.json`—Use the `composer.json` file to manage product installations and upgrades.
- `composer.lock`—The `composer.lock` file stores a set of exact version dependencies that satisfy the version constraints of every requirement for every package in the dependency tree of the project.

**Common commands:**

| Command            | Description                                                                                                                                              |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| `composer update`  | Updates to the latest versions of the dependencies reflected in the `composer.json` file. This updates the `composer.lock` file.                         |
| `composer install` | Reads the `composer.lock` file to download dependencies. It is a best practice to keep an up-to-date copy of `composer.lock` in your project repository. |

{style="table-layout:auto"}

Once you add, commit, and push the updated code, the deployment process automatically runs the `composer install` command during the [build phase](../deploy/process.md#build-phase-build-phase).

### Cloud metapackage

Adobe Commerce on cloud infrastructure uses a metapackage that requires `magento/product-enterprise-edition`. To get the latest updates for latest version of Commerce, use the following constraint syntax:

```text
>=current_version <next_version
```

For example, to use the latest Adobe Commerce version 2.4.9, set `2.4.8` as the "current" version and `2.4.9` as the "next" version in the `composer.json` file:

```text
"magento/magento-cloud-metapackage": ">=2.4.8 <2.4.9"
```

The main packages of this metapackage are the following:

- **vendor/magento/ece-tools**—The `ece-tools` package is compatible with Adobe Commerce version 2.1.4 and later to provide a rich set of features you can use to manage your Adobe Commerce on cloud infrastructure project. It contains scripts and Adobe Commerce on cloud infrastructure commands designed to help manage your code and automatically build and deploy your projects. See the [`ece-tools` package overview](../dev-tools/package-overview.md).
- **vendor/magento/product-enterprise-edition**—This metapackage requires application components, including modules, frameworks, themes, and more.
- **vendor/fastly2/magento2**—This module manages the Fastly CDN and services for the Pro Staging and Production and Starter Production environments. See [Fastly services](/help/cloud-guide/cdn/fastly.md#fastly-cdn-module-for-magento-2).
- **vendor/magento/module-paypal-on-boarding**—This module provides PayPal payment gateway checkout by connecting to your PayPal merchant account. See [PayPal On-Boarding tool](../store/paypal.md).

>[!TIP]
>
>See [Cloud packages for Adobe Commerce](/help/cloud-guide/release-notes/cloud-packages.md) in the _Commerce Release notes_ for a list of dependencies and third-party licenses.

## Docker environment

You can use the Cloud Docker for Commerce tool to emulate the Adobe Commerce on cloud infrastructure production and development environments for local development. Cloud Docker for Commerce does not require PHP and Composer to be installed locally.

- [Local development with Cloud Docker](https://developer.adobe.com/commerce/cloud-tools/docker/setup/) in the Adobe Developer site
- [Docker architecture and common commands](../dev-tools/cloud-docker.md)
- [Cloud Docker release notes](../release-notes/cloud-docker.md)

>[!TIP]
>
>For information about using Git-based hosting services with Adobe Commerce on cloud infrastructure, see [Integrations](../integrations/overview.md).
