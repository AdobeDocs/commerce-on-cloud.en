# Cloud snippets

## Elasticsearch warning {#elasticsearch-support}

>[!WARNING]
>
>Elasticsearch 7.11 and later is not supported for Adobe Commerce on cloud infrastructure. Adobe Commerce versions 2.3.7-p3, 2.4.3-p2, and 2.4.4 and later support the OpenSearch service. The on-premises installations continue to support Elasticsearch.

## Enhanced Integration {#enhanced-integration-envs}

>[!NOTE]
>
>Projects provisioned before June 5, 2020 had multiple, smaller Integration environments. If you need a larger Integration environment for testing and development, request an upgrade to Enhanced Integration environments. See the [Integration Environment request](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/announcements/commerce-announcements/integration-environment-enhancement-request-pro-and-starter.html) article in the _Adobe Commerce Help Center_ for details.

## Merge options {#merge-options}

By default, the deployment process overwrites all settings in the `env.php` file; however, you can choose to merge one or more values for a service configuration without overwriting all values.

Set the `_merge` option to one of the following:

- `true`—**Merge** the configured service values with the environment variable values.
- `false`—**Overwrite** the configured service values with the environment variable values.

## Private repository {#private-repository}

>[!NOTE]
>
>Adobe strongly recommends using a private repository for your Adobe Commerce on cloud infrastructure project to protect any proprietary information or development work, such as extensions and sensitive configurations.

## Pro self-service warning {#pro-self-service-warning}

>[!WARNING]
>
>Some **Pro projects** require a support ticket to update the route configuration in the `routes.yaml` file and the cron configuration in the `.magento.app.yaml` file. Adobe recommends updating and testing YAML configuration files in an Integration environment, then deploying changes to the Staging environment. If your changes are not applied to Staging sites after you redeploy and there are no related error messages in the log, then you **MUST** [Submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/help-center-guide/magento-help-center-user-guide.html#submit-ticket) that describes the attempted configuration changes. Include any updated YAML configuration files in the ticket.

## Pro services support {#pro-update-service}

>[!BEGINSHADEBOX]

- For Pro projects, you must [submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/help-center-guide/magento-help-center-user-guide.html#submit-ticket) to install or update [services](https://experienceleague.adobe.com/docs/commerce-on-cloud/user-guide/configure/service/services-yaml.html) in `Staging` and `Production` environments only.

- Indicate the service changes needed, include your updated `.magento.app.yaml` and `services.yaml` files, and state the PHP version in the ticket. For self-service changes to PHP version, extensions, or environment settings, see [PHP settings](https://experienceleague.adobe.com/docs/commerce-on-cloud/user-guide/configure/app/php-settings.html) in _Application configuration_.

- For changes to a live Production environment (**Pro only**), a minimum of 48 hours notice is required. This allows the Cloud infrastructure team sufficient time to marshal resources and conduct a secure upgrade. The notice period begins when the Infrastructure team acknowledges the request and schedules the upgrade, excluding weekends. For example, to have service upgrades completed on a Monday, an acknowledgement of the scheduled upgrade must be received by Wednesday. During peak demand periods, it might take more time to process your request.

>[!ENDSHADEBOX]

## Pro backups {#pro-backups}

>[!TIP]
>
>On Pro Staging and Production environments, you must [submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/help-center-guide/magento-help-center-user-guide.html#submit-ticket) to retrieve a specific backup noting the date, time, and timezone in the ticket.
>
>Adobe does **not** restore any environments from an automatic backup. See [Restore a DB snapshot from Staging or Production](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/how-to/restore-a-db-snapshot-from-staging-or-production.html) for help choosing a method to restore a Staging or Production snapshot.

## Redeploy warning {#redeploy-warning}

>[!WARNING]
>
>The deployment process begins when you perform a merge, push, or synchronization of your environment, or when you trigger a manual redeployment, during which the [!DNL Commerce] application is in maintenance mode. For a Production environment, Adobe recommends completing this work during off-peak hours to avoid service disruptions.

## Route placeholder {#route-placeholder}

>[!NOTE]
>
>The following route configuration examples use route templates with placeholders. The `{default}` placeholder represents the default domain configured for your site. If your project has multiple domains, use the `{all}` placeholder to configure routing for the default domain and all aliases. See [Configure routes](/help/cloud-guide/routes/routes-yaml.md).

## SCD timing {#scd-timing-warning}

>[!WARNING]
>
>If you have issues with static content files in your application after deployment, such as missing custom theme files, increase the maximum expected execution time to 900 seconds or higher.

## Scenario-based deployment {#scenarios}

>[!NOTE]
>
>With [!DNL ECE-Tools] 2002.1.0 and later, you can use the scenario-based deployment feature to customize the build, deploy, and post-deploy processes for your Adobe Commerce on cloud infrastructure project. See [Scenario-based deployment](/help/cloud-guide/deploy/scenario-based.md).

## Second staging {#second-staging}

>[!NOTE]
>
>Some projects demand a more sophisticated development workflow. To support this need, Adobe offers an [additional staging environment](/help/cloud-guide/test/second-staging.md) as an add-on option to your cloud infrastructure.

## Service instruction {#service-instruction}

Use the following instructions for service setup on Pro Integration environments and Starter environments, including the `master` branch.

>[!NOTE]
>
>[Submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/help-center-guide/magento-help-center-user-guide.html#submit-ticket) to change the service configuration on Pro Production and Staging environments.

## Service change {#service-change-tip}

>[!TIP]
>
>After initial service setup, you can change the software version for an installed service by updating the `services.yaml` and `.magento.app.yaml` configuration files. See [Change service version](/help/cloud-guide/services/services-yaml.md#change-service-version) for guidance on upgrading or downgrading a service.

## Stuck deployment tip {#stuck-deployment-tip}

>[!TIP]
>
>For help with stuck deployments, use the [Adobe Commerce deployment troubleshooter](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/troubleshooting/deployment/magento-deployment-troubleshooter.html) in the _Commerce Help Center_.

## Update to ECE-Tools {#ece-tools-package}

>[!NOTE]
>
>If you use a version of Adobe Commerce on cloud infrastructure that does not contain the `ece-tools` package, then you must perform a [one-time upgrade](/help/cloud-guide/dev-tools/install-package.md) to your cloud project to remove deprecated packages. If you currently use the `ece-tools` package and you need to update it, see [Update the ECE-Tools package](/help/cloud-guide/dev-tools/update-package.md).

## Upgrade tip {#upgrade-tip}

>[!TIP]
>
>Before beginning an upgrade or a patching process, create an active branch from the Integration environment and check out the new branch to your local workstation. Dedicating a branch to the upgrade or the patch process helps to avoid interference with your work in progress.

<!-- Fastly-related snippets begin -->

## Admin login {#admin-login-step}

1. [Log in](/help/get-started/onboarding.md#access-your-admin-panel) to the Admin.

## Automate custom VCL snippet deployment {#automate-vcl-snippet-deployment}

>[!NOTE]
>
>Instead of manually uploading custom VCL snippets, you can add snippets to the `$MAGENTO_CLOUD_APP_DIR/var/vcl_snippets_custom` directory in your environment. Snippets in this directory upload automatically when you click _upload VCL to Fastly_ in the Commerce Admin. See [Automated custom VCL snippets deployment](https://github.com/fastly/fastly-magento2/blob/master/Documentation/Guides/CUSTOM-VCL-SNIPPETS.md#automated-custom-vcl-snippets-deployment) in the Fastly CDN module for Magento 2 documentation.

<!-- Fastly-related snippets end -->
