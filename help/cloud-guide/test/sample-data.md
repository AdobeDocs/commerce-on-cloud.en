---
title: Sample data
description: Learn how to install sample data with Adobe Commerce on cloud infrastructure.
exl-id: 59e23cfa-d364-4e70-8a86-644c339778cc
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
