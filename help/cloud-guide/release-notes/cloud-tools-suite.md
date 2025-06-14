---
title: Release notes for Cloud Tools Suite
description: Learn about the latest improvements to the Cloud Tools suite for Adobe Commerce.
feature: Cloud, Release Notes
exl-id: ee2bc2e9-bdf4-4f7b-9724-8f4dd1e61378
---
# Release notes for Commerce Cloud Tools Suite

This release information details the latest improvements to the Cloud Tools Suite for Commerce packages which are designed to deploy and manage Adobe Commerce installations and upgrades on the Cloud platform.

| Release notes     | Version  | Description                              | Source              |
| ----------------- |----------| ---------------------------------------- | --------------------------- |
| [`ece-tools` package](ece-tools-package.md) | 2002.2.6 | A set of scripts and tools designed to manage and deploy Cloud projects | [`magento/ece-tools`](https://github.com/magento/ece-tools/tree/2002.2.6) |
| [Cloud Patches for Commerce](cloud-patches.md) | 1.1.9    | A set of patches which improve the integration of all Adobe Commerce versions with Cloud environments. This package includes Adobe Commerce patches and available hotfixes that are applied when you use `ece-tools` to deploy | [`magento/magento-cloud-patches`](https://github.com/magento/magento-cloud-patches/tree/1.1.9) |
| [Cloud Docker for Commerce](cloud-docker.md) | 1.4.3    | Functionality and configuration files for Docker images to deploy Adobe Commerce to a local cloud environment | [`magento/magento-cloud-docker`](https://github.com/magento/magento-cloud-docker/tree/1.4.3) |
| [Cloud Components of Commerce](cloud-components.md) | 1.1.2    | Extended Adobe Commerce core functionality for sites deployed on the Cloud infrastructure | [`magento/magento-cloud-components`](https://github.com/magento/magento-cloud-components/tree/1.1.2) |

When you update to ECE-Tools 2002.1.0 or later, you automatically update to the latest versions of the other packages, which are dependencies for the `ece-tools` package. See [Cloud metapackage](../development/overview.md#cloud-metapackage) for a list of dependencies.

The new version of `ece-tools` (2002.2.0)  is available with PHP version 8.1 and higher (8.2, 8.3) only. Older PHP versions were deprecated (7.4, 7.3, 7.2). You can use previous versions of `ece-tools` with old PHP versions.
