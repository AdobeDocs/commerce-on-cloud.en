---
title: Upgrade Commerce version
description: Learn how to upgrade the Adobe Commerce version in the cloud infrastructure project.
feature: Cloud, Upgrade
exl-id: 0cc070cf-ab25-4269-b18c-b2680b895c17
---
# Upgrade Commerce version

You can upgrade the Adobe Commerce code base to a newer version. Before upgrading your project, review the [System requirements](https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/system-requirements.html) in the _Installation_ guide for the latest software version requirements.

Depending on your project configuration, your upgrade tasks may include the following:

- Update the `.magento/services.yaml` file with new versions for MariaDB (MySQL), OpenSearch, RabbitMQ, and Redis for compatibility with new Adobe Commerce versions.
- Update the `.magento.app.yaml` file with new settings for hooks and environment variables.
- Upgrade third-party extensions to the latest supported version.

{{upgrade-tip}}

{{pro-update-service}}

## Configuration files

Before upgrading the application, you must update your project configuration files to account for changes to the default configuration settings for Adobe Commerce on cloud infrastructure or the application. The latest defaults can be found in the [magento-cloud GitHub repository](https://github.com/magento/magento-cloud).

### composer.json

Before upgrading, always check that the dependencies in the `composer.json` file are compatible with the Adobe Commerce version.

To update the `composer.json` file for Adobe Commerce version 2.4.4 and later**:

1. Add the following `allow-plugins` to the `config` section:

   ```json

   "config": {
      "allow-plugins": {
         "dealerdirect/phpcodesniffer-composer-installer": true,
         "laminas/laminas-dependency-plugin": true,
         "magento/*": true
      }
   },
   ```

1. Add the following plugin to the `require` section:

   ```json
   "require": {
       "magento/composer-root-update-plugin": "^2.0.3"
   },
   ```

1. Add the following component to the `extra:component_paths` section:

   ```json
   "extra": {
      "component_paths": {
         "tinymce/tinymce": "lib/web/tiny_mce_5"
      },
   },
   ```

1. Save the file. Do not commit or push changes to your branch yet.

1. Continue with the upgrade process.

## Project backup

We recommend creating a backup of your project before an upgrade. Use the following steps to back up your Integration, Staging, and Production environments.

**To back up your integration environment database and code**:

1. Create a local backup of the remote database.

   ```bash
   magento-cloud db:dump
   ```

   >[!NOTE]
   >
   >The `magento-cloud db:dump` command runs the [mysqldump](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html) command with the `--single-transaction` flag, which allows you to back up your database without locking the tables.

1. Back up code and media.

   ```bash
   php bin/magento setup:backup --code [--media]
   ```

   Optionally, you can omit `[--media]` if you have a large number of static files that are already in source control.

**To back up your Staging or Production environment database before deploying**:

1. Use SSH to log in to the remote environment.

1. Create a [database dump](../storage/database-dump.md). To choose a target directory for the DB dump, use the `--dump-directory` option.

   ```bash
   vendor/bin/ece-tools db-dump
   ```

   The dump operation creates a `dump-<timestamp>.sql.gz` archive file in your remote project directory. See [Back up database](../storage/database-dump.md).

## Application upgrade

Review the [service versions](../services/services-yaml.md#service-versions) information for the latest software version requirements before upgrading your application.

**To upgrade the application version**:

1. On your local workstation, change to your project directory.

1. Set the [version constraint](overview.md#cloud-metapackage) for the target upgrade version. This step is only necessary if the target version is outside the existing constraint.

   ```bash
   composer require-commerce "magento/magento-cloud-metapackage":">=CURRENT_VERSION <NEXT_VERSION" --no-update
   ```

   >[!NOTE]
   >
   >You must use the version constraint syntax to successfully update the `ece-tools` package. You can find the version constraint in the `composer.json` file for the version of the [application template](https://github.com/magento/magento-cloud/blob/master/composer.json) you are using for the upgrade.

1. Update your `composer.json` file with the core Commerce upgrade version.

   ```bash
   composer require-commerce magento/product-enterprise-edition 2.4.8 --no-update
   ```

1. If you're using B2B, update your `composer.json` file with the [supported version](https://experienceleague.adobe.com/en/docs/commerce-operations/release/product-availability#adobe-authored-extensions) for Commerce.

   ```bash
   composer require-commerce magento/extension-b2b 1.5.2 --no-update
   ```

1. Update project dependencies.

   ```bash
   composer update
   ```

1. Review the patches that are currently applied:

   - If there are any patches installed in the `m2-hotfixes` directory, [submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/en/docs/commerce-knowledge-base/kb/help-center-guide/magento-help-center-user-guide#support-case) and work with Adobe Commerce Support to verify which patches can still be applied to the new version. Remove the non-applicable patch(es) from the `m2-hotfixes` directory.

   - If there are any [Quality Patches] applied in the `.magento.env.yaml` file, verify whether they can still be applied to the new version. Remove the non-applicable patch(es) from the `QUALITY_PATCHES` section of the `.magento.env.yaml` file.

   **Method 1**: [Verify the applicable versions in the Quality Patches release notes](https://experienceleague.adobe.com/en/docs/commerce-operations/tools/quality-patches-tool/release-notes)
  
   **Method 2**: [View available patches and status](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/develop/upgrade/apply-patches#view-available-patches-and-status)
  
   **Method 3**: [Search for patches](https://experienceleague.adobe.com/tools/commerce-quality-patches/index.html?lang=en)


1. Add, commit, and push code changes.

   ```bash
   git add -A
   ```

   ```bash
   git commit -m "Upgrade"
   ```

   ```bash
   git push origin <branch-name>
   ```

   `git add -A` is required to add all changed files to source control because of the way Composer marshals base packages. Both `composer install` and `composer update` marshal files from the base package (`magento/magento2-base` and `magento/magento2-ee-base`) into the package root.

   The files that Composer marshals belong to the new version of Adobe Commerce, to overwrite the outdated version of those same files. Currently, marshaling is disabled in Adobe Commerce, so you must add the marshaled files to source control.

1. Wait for deployment to complete.

1. Verify the upgrade in your Integration, Staging, or Production environment by using SSH to log in and check the version.

   ```bash
   php bin/magento --version
   ```

### Upgrade extensions

Review your third-party extension and module pages in Marketplace or other company sites and verify support for Adobe Commerce and Adobe Commerce on cloud infrastructure. If you must upgrade any third-party extensions and modules, Adobe recommends working in a new integration branch with your extensions disabled.

**To verify and upgrade your extensions**:

1. Create a branch on your local workstation.

1. Disable your extensions as needed.

1. When available, download extension upgrades.

1. Install the upgrade as documented by the third-party documentation.

1. Enable and test the extension.

1. Add, commit, and push the code changes to the remote.

1. Push to and test in your integration environment.

1. Push to the Staging environment to test in a pre-production environment.

Adobe strongly recommends upgrading your Production environment _before_ including the upgraded extensions in your site launch process.

>[!NOTE]
>
>When you upgrade your application version, the upgrade process updates to the latest version of the [Fastly CDN module](../cdn/fastly.md#fastly-cdn-module-for-magento-2) automatically.

## Troubleshoot upgrade

If the upgrade failed, you receive an error message in the browser indicating that you cannot access your storefront or the Admin panel:

```
There has been an error processing your request
Exception printing is disabled by default for security reasons.
  Error log record number: <error-number>
```

**To resolve the error**:

1. On your local workstation, change to your project directory.

1. Use SSH to log in to the remote environment.

   ```bash
   magento-cloud ssh
   ```

1. Open the `./app/var/report/<error number>` file.

1. [Examine the logs](../test/log-locations.md) and determine the source of the issue.

1. Add, commit, and push code changes.

   ```bash
   git add -A && git commit -m "Fixed deployment failure" && git push origin <branch-name>
   ```
