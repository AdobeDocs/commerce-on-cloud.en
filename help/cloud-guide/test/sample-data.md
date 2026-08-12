---
title: Sample data
description: Learn how to install sample data with Adobe Commerce on cloud infrastructure.
exl-id: 59e23cfa-d364-4e70-8a86-644c339778cc
TQID: https://experienceleague.adobe.com/hEowDeOnXfkdlB-GCNRylKYrJLtXITR11-zsveyIA0Y
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: d1e21356-0064-4f48-9089-16e3f0dbd2a6
    internal-label: Storefront
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Sample data

If you need some example data when developing your store, you can install sample data. This data simulates an active Adobe Commerce store with customers, products, and other data. This sample data works best with a new Adobe Commerce on cloud infrastructure template installation.

As a best practice, install sample data in development and integration environments. If you use sample data in Staging or Production, then you must [remove](#reset-or-uninstall-sample-data) the information and products before going live.

## Install sample data

To install sample data:

1. On your local workstation, change to your project directory.

1. At the root, enter the following command to add sample data:

   ```bash
   ./bin/magento sampledata:deploy
   ```

1. Wait for components to update.

1. Commit and push the changes:

   ```bash
   git add -A && git commit -m "Install sample data"
   ```

   ```bash
   git push origin <branch-name>
   ```

1. Wait for the project to deploy.

1. Verify that the installation was successful by going to your storefront page in the integration environment. You can locate the URL link to the storefront through the [!DNL Cloud Console].

1. Take a snapshot of your environment:

   ```bash
   magento-cloud snapshot:create -e <environment-ID>
   ```

You can start testing your development with live data!

## Reset or uninstall sample data

You can reset or remove sample data following the same procedure used to install the sample data:

- Delete sample data: `./bin/magento sampledata:remove`
- Reset sample data: `./bin/magento sampledata:reset`
