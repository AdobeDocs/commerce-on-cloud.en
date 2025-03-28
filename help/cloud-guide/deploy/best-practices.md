---
title: Deployment best practices
description: Discover best practices for deploying Adobe Commerce on cloud infrastructure.
feature: Cloud, Deploy, Best Practices
exl-id: 87aabee7-4629-4a3c-9587-dbde4cf268e1
---
# Deployment best practices

Build and deploy scripts activate when you merge code to a remote environment. These scripts use environment [configuration files](../environment/overview.md) and application code to provision cloud infrastructure with appropriate data and services. Also, these scripts are used to install or update the Adobe Commerce application, third-party services, and custom extensions in the cloud environment.

The build and deploy process is slightly different for each plan:

-  **Starter plans**—For the integration environment, every active branch builds and deploys to a full environment for access and testing. Fully test your code after merging to the `staging` branch. To launch your site, push `staging` to `master` to deploy to the Production environment. You have full access to all branches through the [!DNL Cloud Console] and the CLI commands.

-  **Pro plans**—For the integration environment, every active branch builds and deploys to a full environment for access and testing. Merge your code to the `integration` branch before merging to the Staging and Production environments. You can merge to the Staging and Production environments using the [!DNL Cloud Console] or using SSH and `magento-cloud` CLI commands.

## Track the process

You can track build and deploy actions in real time using the terminal or the [!DNL Cloud Console] Status messages—`in-progress`, `pending`, `success`, or `failed`—display during the deployment process. You can view details in the log files. See [View logs](../test/log-locations.md).

If you are using external GitHub repositories, the log of operations does not display in the GitHub session. However, you can still follow activity in the interface for the external repository and the [!DNL Cloud Console]. See [Integrations](../integrations/overview.md).

>[!NOTE]
>
>In integration environments, you cannot view the deploy logs from the [!DNL Cloud Console]. This feature is available only for Production and Staging environments. However, you can view logs for every phase of the deployment in any environment using the [build and deploy](../test/log-locations.md#build-and-deploy-logs) logs. For troubleshooting information, see the [Deployment error reference](../dev-tools/error-reference.md).

You can enable [Track deployments with New Relic](../monitor/track-deployments.md) to monitor deployment events and analyze performance between deployments.

## Best practices for builds and deployment

Review these best practices and considerations for your deployment process:

-  **Ensure that you are running the most current version of the `ece-tools` package**

   See [Release notes for ECE-Tools](../release-notes/ece-tools-package.md).

-  **Follow the build and deploy process**

   Ensure that you have the correct code in each environment to avoid overwriting configurations when merging code between environments. For example, to apply configuruation changes to all environments, modify and test the changes in the local environment before deploying to the remote integration environment. Then, deploy and test the changes in the Staging environment before deploying to Production. When you merge from one environment to another, the deployment overwrites all code in the environment, except environment-specific configuration and settings.

-  **Use the same variables across environments**

   The values for these variables can differ across environments; however, you usually need the same variables in each environment. See [Configuration management for store settings](../store/store-settings.md).

-  **Keep sensitive configuration values and data in environment-specific variables**

   These values include variables specified using the Cloud CLI, the [!DNL Cloud Console], or added to the `env.php` file. See [Variable levels](../environment/variable-levels.md).

-  **Ensure that all code is available in the environment branch**

   Referencing code from other branches, such as a private branch, can cause problems during the build and deploy process. For example, if you reference a theme from a private branch, the theme is not accessible and cannot build with the application code.

-  **Add extensions, integrations, and code in iterated branches**

   Make and test changes locally, push to `integration`, then to `staging` and `production`. Test and resolve issues in each environment before merging the updates to the next environment. Some extensions and integrations must be enabled and configured in a specific order due to dependencies. Adding and testing in groups can make your build and deploy process much easier and help determine where issues occur.

-  **Verify service versions and relationships and the ability to connect**

   Verify the services that are available to your application and ensure you are using the most current, compatible version. See [Service relationships](../services/services-yaml.md#service-relationships) and [System requirements](https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/system-requirements.html) in the _Installation guide_ for recommended versions.

-  **Test locally and in the integration environment before deploying to Staging and Production**

   Identify and fix issues in your local and integration environments to prevent extended downtime when you deploy to Staging and Production environments.

   >[!TIP]
   >
   >There are [smart wizard](../deploy/smart-wizards.md) commands that you can use to verify that your cloud project configuration follows best practices for build and deployment configuration, including static content deployment (SCD) strategy.

-  **After completing testing in local and integration environments, deploy and test in the Staging environment**

   See [Staging and Production testing](../test/staging-and-production.md).

-  **Check Production environment configuration**

   Before deploying to Production, complete the following tasks:

   -  Ensure that you can connect to all three nodes in the Production environment using [SSH](../development/secure-connections.md).

   -  Verify that Indexers are set to _Update on Schedule_. See [Indexing modes](https://developer.adobe.com/commerce/php/development/components/indexing/) in the _Extension Developer Guide_.

   -  Prepare the environment by updating any environment-specific variables in the Production code, verifying service availability and compatibility, and making any other required configuration changes.

-  **Monitor the deploy process**

   Review the deployment status messages and mitigate issues as needed. Review the Cloud [logs](../test/log-locations.md#) for detailed log messages.

## Five phases of integration build and deployment

The following phases occur in your local development environment and the integration environment. For Pro plans, the code is not deployed to the Staging or Production environments in these initial phases.

### Phase 1: Code and configuration validation

When you initially set up a project, [the cloud infrastructure template](https://github.com/magento/magento-cloud) provides a basis for the code files. This code repo is cloned to your project as the `master` branch.

-  **For Starter**—`master` branch is your Production environment.
-  **For Pro**—`master` begins as origin branch for the integration environment.

Create a branch from `master` for your custom code, extensions and modules, and third-party integrations. There is a remote integration environment for testing your code in the cloud.

When you push your code from your local workspace to the remote repository, a series of checks and code validations completes before build and deploy scripts start. The built-in Git server validates what you are pushing and makes changes. For example, if you add an OpenSearch service, the built-in Git server verifies that the topology of your cluster is modified accordingly.

If you have a syntax error in a configuration file, the Git server rejects the push. See [Protective Block](../development/protective-block.md).

This phase also runs `composer install` to retrieve dependencies.

### Phase 2: Build

>[!NOTE]
>
>During the build phase, the site is not in maintenance mode and if errors or issues occur is not brought down. It only builds the code that has changed since the previous build.

This phase builds the codebase and runs hooks in the `build` section of `.magento.app.yaml`. The default build hook is the `php ./vendor/bin/ece-tools` command and performs the following:

-  Applies patches in `vendor/magento/ece-patches`, and optional, project-specific patches in `m2-hotfixes`
-  Regenerates code and the [dependency injection](https://experienceleague.adobe.com/en/docs/commerce-operations/implementation-playbook/glossary) configuration (that is, the `generated/` directory, which includes `generated/code` and `generated/metapackage`) using `bin/magento setup:di:compile`.
-  Checks if the [`app/etc/config.php`](../store/store-settings.md) file exists in the codebase. Adobe Commerce auto-generates this file if it does not detect it during the build phase and includes a list of modules and extensions. If it exists, the build phase continues as normal, compresses static files using GZIP, and deploys, which reduces downtime in the deployment phase. Refer to [build options](../environment/variables-build.md) to learn about customizing or disabling file compression.

>[!WARNING]
>
>At this point, the cluster has not been created, so do not attempt to connect to a database or assume that there is an active daemon process.

After the application builds, it is mounted on a **read-only file system**. You can configure specific mount points that are going to be read/write. You cannot FTP to the server and add modules. Instead, you must add code to your local repository and run `git push`, which builds and deploys the environment. For the project structure, see [Local project directory structure](../project/file-structure.md).

### Phase 3: Prepare the slug

The result of the build phase is a read-only file system referred to as a _slug_. This phase creates an archive and places the slug in permanent storage. The next time you push code, if a service did not change, it uses the slug from the archive.

-  Makes continuous integration build faster by reusing unchanged code
-  If code changes, updates the slug for the next build to reuse
-  Allows for instantaneous reverting of a deployment, if needed
-  Includes static files if the `app/etc/config.php` file exists in the codebase

The slug includes all files and folders **excluding the following** mounts configured in `magento.app.yaml`:

-  `"var": "shared:files/var"`
-  `"app/etc": "shared:files/etc"`
-  `"pub/media": "shared:files/media"`
-  `"pub/static": "shared:files/static"`

### Phase 4: Deploy slugs and cluster

Your applications and all [backend](https://experienceleague.adobe.com/en/docs/commerce-operations/implementation-playbook/glossary) services provision as follows:

-  Mounts each service in a container, such as web server, OpenSearch, [!DNL RabbitMQ]
-  Mounts the read-write file system (mounted on a highly available distributed storage grid)
-  Configures the network so services can "see" each other (and only each other)

>[!NOTE]
>
>Make your changes in a Git branch after all build and deployment completes and push again. All environment file systems are _read-only_. A read-only system guarantees deterministic deployments and dramatically improves your site security because no process can write to the file system. It also works to ensure that your code is identical in the Integration, Staging, and Production environments.

### Phase 5: Deployment hooks

>[!NOTE]
>
>This phase puts the [!DNL Commerce] application in maintenance mode until deployment is complete.

The last step runs a deployment script, which you can use to anonymize data in development environments, clear caches, and query external continuous-integration tools. When this script runs, you have access to all the services in your environment, such as Redis.

If the `app/etc/config.php` file does not exist in the codebase, static files are compressed using `gzip` and deployed during this phase, which increases the length of the deploy phase and site maintenance.

>[!NOTE]
>
>Refer to [deploy variables](../environment/variables-deploy.md) to learn about customizing or disabling file compression.

There are two deploy hooks. The `pre-deploy.php` hook completes necessary cleanup and retrieval of resources and code generated in the build hook. The `php ./vendor/bin/ece-tools deploy` hook runs a series of commands and scripts:

-  If Adobe Commerce is **not installed**, it installs with `bin/magento setup:install`, updates the deployment configuration, `app/etc/env.php`, and the database for your specified environment, such as Redis and website URLs. **Important:** When you completed the [First-time deployment](https://experienceleague.adobe.com/docs/commerce-on-cloud/user-guide/launch/overview.html) during setup, Adobe Commerce was installed and deployed across all environments.

-  If Adobe Commerce **is installed**, perform any necessary upgrades. The deployment script runs `bin/magento setup:upgrade` to update the database schema and data (which is necessary after extension or core code updates), and also updates the deployment configuration, `app/etc/env.php`, and the database for your environment. Finally, the deployment script clears theAdobe Commerce cache.

-  The script optionally generates static web content using the command `magento setup:static-content:deploy`.

-  Uses scopes (`-s` flag in build scripts) with a default setting of `quick` for static content deployment strategy. You can customize the strategy using the environment variable [`SCD_STRATEGY`](../environment/variables-deploy.md#scd_strategy). For details on these options and features, see [Static files deployment strategies](../deploy/static-content.md) and the `-s` flag for [Deploy static view files](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cli/static-view/static-view-file-deployment.html).

>[!NOTE]
>
>The deploy script uses the values defined by configuration files in the `.magento` directory, then the script deletes the directory and its contents. Your local development environment is not affected.

### Post-deployment: configure routing

While the deployment is running, the process halts incoming traffic at the entry point for 60 seconds and reconfigures routing so that your web traffic arrives at your newly created cluster.

Successful deployment removes the maintenance mode to allow for normal access and creates backup (BAK) files for the `app/etc/env.php` and the `app/etc/config.php` configuration files.

Enable static content generation using the `SCD_ON_DEMAND` variable and configure the [`post_deploy` hook](../application/hooks-property.md) so that it clears the cache and pre-loads (warms) the cache _after_ the container begins accepting connections and _during_ normal, incoming traffic.

To review build and deploy logs, see [View logs](../test/log-locations.md#view-and-manage-logs).
