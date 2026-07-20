---
title: Release notes for Cloud Tools Suite
description: Learn about the latest improvements to the Cloud Tools suite for Adobe Commerce.
feature: Cloud, Release Notes
exl-id: ee2bc2e9-bdf4-4f7b-9724-8f4dd1e61378
TQID: https://experienceleague.adobe.com/eQQvGGEwj4D6pOlhZqNA-SMdc6JxH-Wg-hBRZaR1C-M
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: dac87252-6066-4d6e-a9d2-f6d84c323de7
    internal-label: Configuration
  - id: e8818fe6-9c8b-4bc0-9ef8-377a10b7bc75
    internal-label: Architecture
subfeature_v2:
  - id: db6b6496-d1b5-4ad4-9e18-dea78dae3aa8
    internal-label: Auto Scaling
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Release notes for Commerce Cloud Tools Suite

This release information details the latest improvements to the Cloud Tools Suite for Commerce packages which are designed to deploy and manage Adobe Commerce installations and upgrades on the Cloud platform.

| Release notes     | Version  | Description                              | Source              |
| ----------------- |----------| ---------------------------------------- | --------------------------- |
| [ece-tools package](ece-tools-package.md) | 2002.2.12 | A set of scripts and tools designed to manage and deploy Cloud projects | [`magento/ece-tools`](https://github.com/magento/ece-tools/tree/2002.2.12) |
| [Cloud Patches for Commerce](cloud-patches.md) | 1.1.15 | A set of patches which improve the integration of all Adobe Commerce versions with Cloud environments. This package includes Adobe Commerce patches and available hotfixes that are applied when you use `ece-tools` to deploy | [`magento/magento-cloud-patches`](https://github.com/magento/magento-cloud-patches/tree/1.1.15) |
| [Cloud Docker for Commerce](cloud-docker.md) | 1.4.9 | Functionality and configuration files for Docker images to deploy Adobe Commerce to a local cloud environment | [`magento/magento-cloud-docker`](https://github.com/magento/magento-cloud-docker/tree/1.4.9) |
| [Cloud Components of Commerce](cloud-components.md) | 1.1.4 | Extended Adobe Commerce core functionality for sites deployed on the Cloud infrastructure | [`magento/magento-cloud-components`](https://github.com/magento/magento-cloud-components/tree/1.1.4) |

When you update to ECE-Tools 2002.1.0 or later, you automatically update to the latest versions of the other packages, which are dependencies for the `ece-tools` package. See [Cloud metapackage](../development/overview.md#cloud-metapackage) for a list of dependencies.
