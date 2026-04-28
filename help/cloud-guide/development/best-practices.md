---
title: Best practices for upgrading your project
description: See a list of best practices for upgrading your project files.
feature: Cloud, Best Practices, Upgrade
exl-id: 64f92739-9170-4cbf-90ef-aab6593a37ca
---
# Best practices for upgrading your project

Follow best practices for builds and deployment, and use the [Upgrades and patches](../development/commerce-version.md) workflow to upgrade your application. Use the following guidelines to plan your upgrade and post-upgrade work:

- **Backup your project**–Before upgrading the Adobe Commerce and any third-party or custom extensions, back up the database in Integration, Staging, and Production environments. See [Back up the database](../development/commerce-version.md#project-backup).

- **Check for compatibility issues**–

    - Ensure that any custom themes are compatible with the new Adobe Commerce version

    - After upgrading third party and custom extensions, use the `magento-cloud local:build` command to validate Composer dependencies before deploying, and run the [Upgrade Compatibility Tool](#use-the-upgrade-compatibility-tool) to identify code‑level incompatibilities between your current and target versions. Then use the [Upgrade Compatibility Tool](https://fluffyjaws.adobe.com/#use-the-upgrade-compatibility-tool) to identify and prioritize code-level incompatibilities before deploying to Integration, Staging, or Production.

    - Review the Adobe Commerce release notes and extension documentation to ensure that you have implemented any workarounds or configuration changes required to address known functional issues and bugs related to the upgraded the Adobe Commerce version and extensions.

    - Ensure that the installed service versions are compatible with the new Adobe Commerce version, and upgrade services as needed. See [Services](../services/services-yaml.md).

    - Test your database to address any issues introduced by the updates to the Adobe Commerce version and extensions.

    - Make any required updates to environment-specific settings before deploying to the remote environment.

    - Ensure that the search service version is compatible with the PHP client version. See [Set up Elasticsearch](../services/elasticsearch.md) or [Set up OpenSearch](../services/opensearch.md).

- **Check database connectivity and available storage in remote environments**–

    - Use SSH to log in to the remote server and verify the connection to the MySQL database. See [Connect to the database](../services/mysql.md#connect-to-the-database).

    - Verify available storage in the remote environment–Use the `disk free` command to view and manage available disk space on your Cloud environments. See [Manage disk space](../storage/manage-disk-space.md).

        - Check the size of the upgraded database and verify that the `services.yaml` file has enough disk space allocated.

        - Free up disk space–Clear the cache, and clean the `/log` and `/tmp` directories before deploying.

- **Plan and perform a successful upgrade on local and integration environments, before deploying to Staging**–After the upgrade, test your deployment and resolve any issues.

- **Merge code to Staging, and then to Production**–Test and resolve any issues in the Staging environment before pushing changes to the Production environment.

- **Complete Post upgrade tasks**–

    - Use SSH to log in to the remote server and verify the following:

        - Check indexer status and reindex as needed. See [Manage the indexers](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cli/manage-indexers.html) in the _Configuration guide_.

        - Check the `cron` logs and the `cron_schedule` table in the Adobe Commerce database to verify cron status, and rerun cron jobs as needed.
      See [Logging](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cli/configure-cron-jobs.html#logging) in the _Configuration Guide_.

    - Complete post-upgrade User Acceptance Testing UAT on Staging and Production environments and fix any issues related to third-party and custom extension upgrades.
 
## Use the Upgrade Compatibility Tool

Run the Upgrade Compatibility Tool (UCT) as part of your pre‑upgrade analysis to understand the scope and impact of an upgrade.

- UCT compares your current instance to a target Adobe Commerce version, returning a list of critical issues, errors, and warnings that must be fixed before upgrading.
- Use `--coming-version (-c)` to compare against your planned target version and `--ignore-current-version-compatibility-issues` to focus only on new issues introduced by the upgrade.
- Treat the UCT HTML report as an input to your upgrade checklist alongside extension compatibility, service versions, and database checks.

For setup and usage details, see:

- [Overview of the Upgrade Compatibility Tool](https://experienceleague.adobe.com/en/docs/commerce-operations/upgrade-guide/upgrade-compatibility-tool/overview)
- [Run the Upgrade Compatibility Tool](https://experienceleague.adobe.com/en/docs/commerce-operations/upgrade-guide/upgrade-compatibility-tool/use-upgrade-compatibility-tool/run)

For Cloud merchants who use the Site-Wide Analysis Tool, you can also trigger UCT from the dashboard and download the HTML report directly from the widget. See Integrate the [Site-Wide Analysis Tool](https://experienceleague.adobe.com/en/docs/commerce-operations/upgrade-guide/upgrade-compatibility-tool/use-upgrade-compatibility-tool/integrate-analysis-tool).
