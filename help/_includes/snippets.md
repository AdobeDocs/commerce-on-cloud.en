# Cloud snippets

## Elasticsearch warning {#elasticsearch-support}

>[!WARNING]
>
>Elasticsearch 7 and later is not supported for Adobe Commerce on cloud infrastructure. Adobe Commerce versions 2.3.7-p3, 2.4.3-p2, and 2.4.4 and later support the OpenSearch service.

## Enhanced Integration {#enhanced-integration-envs}

>[!NOTE]
>
>Projects provisioned before June 5, 2020 had multiple, smaller Integration environments. If you need a larger Integration environment for testing and development, request an upgrade to Enhanced Integration environments. See the [Integration Environment request](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-27242) article in the _Adobe Commerce Help Center_ for details.

## Merge options {#merge-options}

By default, the deployment process overwrites all settings in the `env.php` file; however, you can choose to merge one or more values for a service configuration without overwriting all values.

Set the `_merge` option to one of the following:

- `true`—**Merge** the configured service values with the environment variable values.
- `false`—**Overwrite** the configured service values with the environment variable values.

## Private repository {#private-repository}

>[!NOTE]
>
>Adobe recommends using a private repository for your Adobe Commerce on cloud infrastructure project to protect any proprietary information or development work, such as extensions and sensitive configurations.

## Pro self-service warning {#pro-self-service-warning}

>[!WARNING]
>
>Some **Pro projects** require assistance from Adobe Support to update the route configurations in the `routes.yaml` file and the cron configurations in the `.magento.app.yaml` file. Adobe recommends making and validating all YAML configuration changes in an Integration environment first, and then deploying them to the Staging environment.
>
>
>If your changes are not reflected on Staging sites after redeployment, and there are no related error messages in the log, you **must** [Submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/en/docs/support-resources/adobe-support-tools-guide/adobe-commerce-support/adobe-commerce-help-center-user-guide#submit-ticket). In the ticket, clearly describe the configuration changes you attempted and attach any updated YAML configuration files in the ticket.

## Pro services support {#pro-update-service}

>[!BEGINSHADEBOX]

- For Pro projects, you must [submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/en/docs/support-resources/adobe-support-tools-guide/adobe-commerce-support/adobe-commerce-help-center-user-guide#submit-ticket) to install or update [services](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/configure/service/services-yaml) in `Staging` and `Production` environments only.

- Indicate the service changes needed, include your updated `.magento.app.yaml` and `services.yaml` files, and state the PHP version in the ticket. For self-service changes to PHP version, extensions, or environment settings, see [PHP settings](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/configure/app/php-settings) in _Application configuration_.

  >[!IMPORTANT]
  >
  >When selecting the Environment field in the new ticket form, use Adobe's environment naming. For example, select Staging even if you call that environment **Dev** internally. You can mention your internal name in the description, but the Environment field itself must use Adobe's nomenclature.

- For changes to a live production environment (Pro only), Adobe requires upgrades to be scheduled at least two business days in advance. The notice period allows the Cloud Infrastructure team sufficient time to allocate resources and perform the upgrade securely. The notice period begins when the Cloud Infrastructure team acknowledges the request and confirms the upgrade schedule; weekends do not count toward the notice period. For example, the Cloud Infrastructure team must acknowledge and schedule a Monday upgrade by the preceding Wednesday. Additional lead time is required during periods of peak demand.

  >[!NOTE]
  >
  >All scheduled maintenance windows must be provided in UTC format to ensure clarity and consistency across all communications. Service upgrades cannot be scheduled in the Staging environment. In most cases, upgrades in Staging are performed on the same day as the request.
  >
  >If you request a RabbitMQ upgrade, make sure to redeploy the environment after the upgrade completes so that the message queues are re-initialized.

- Validate service upgrades in a Staging or Integration environment before scheduling them in Production. Issues caused by third-party modules, custom code, or dependency compatibility often surface during the redeployment that follows a service upgrade.

- To ensure the updated service takes effect after the Commerce infrastructure team completes a service upgrade, you must redeploy the environment, even when the upgrade does not change the Adobe Commerce application version. If the upgrade includes OpenSearch, plan for a full reindex after the redeployment.

- Adobe cannot guarantee zero downtime for a service upgrade. Plan a maintenance window that allows time to redeploy, reindex if needed, and validate the storefront and Admin before reopening the site.

- If you are upgrading more than one service and prefer to validate changes one at a time, a reasonable planning order is Valkey or Redis, then RabbitMQ, then OpenSearch, then MariaDB. This order is not an official execution requirement; database upgrades typically carry the highest operational impact and deserve the most caution.

- **Two-Part Coordination Process for Scheduling Upgrades**

  To ensure a smooth and coordinated upgrade process, Adobe Commerce Support follows a two-part handshake process for all production environment upgrades:

  1. **Customer Confirmation**: Adobe Support first requests that the customer confirm the desired date and time for the upgrade. This step ensures that the timing aligns with the customer's business needs and maintenance windows.
  2. **Scheduling & Final Confirmation**: Once the customer confirms the timing, Adobe Support submits the request to the Infrastructure team, who then reviews the request and provides final confirmation of the scheduled upgrade window.

 The upgrade is not considered scheduled until the Infrastructure team has provided final confirmation. Customers are encouraged to respond promptly at least 48 hours before the upgrade window to avoid delays and to allow for adequate notice.

>[!ENDSHADEBOX]

## Pro backups {#pro-backups}

>[!TIP]
>
>To retrieve a specific backup on Pro Staging and Production environments, [submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/en/docs/support-resources/adobe-support-tools-guide/adobe-commerce-support/adobe-commerce-help-center-user-guide#submit-ticket) noting the date, time, and timezone in the ticket.
>
>Adobe does **not** restore any environments from an automatic backup. See [Restore a DB snapshot from Staging or Production](https://experienceleague.adobe.com/en/docs/commerce-knowledge-base/kb/how-to/restore-a-db-snapshot-from-staging-or-production) for help choosing a method to restore a Staging or Production snapshot.

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
>To change the service configuration on Pro Production and Staging environments, [Submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/en/docs/support-resources/adobe-support-tools-guide/adobe-commerce-support/adobe-commerce-help-center-user-guide#submit-ticket).

## Service change {#service-change-tip}

>[!TIP]
>
>After initial service setup, you can change the software version for an installed service by updating the `services.yaml` and `.magento.app.yaml` configuration files. See [Change service version](/help/cloud-guide/services/services-yaml.md#change-service-version) for guidance on upgrading or downgrading a service.

## Stuck deployment tip {#stuck-deployment-tip}

>[!TIP]
>
>For help with stuck deployments, use the [Adobe Commerce deployment troubleshooter](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-29640) in the _Commerce Help Center_.

## Update to ECE-Tools {#ece-tools-package}

>[!NOTE]
>
>To remove deprecated packages on versions of Adobe Commerce on cloud infrastructure that do not contain the `ece-tools` package, you must perform a [one-time upgrade](/help/cloud-guide/dev-tools/install-package.md) to your cloud project. If you currently use the `ece-tools` package and you need to update it, see [Update the ECE-Tools package](/help/cloud-guide/dev-tools/update-package.md).

## Upgrade tip {#upgrade-tip}

>[!TIP]
>
>Before beginning an upgrade or a patching process, create an active branch from the Integration environment and check out the new branch to your local workstation. Dedicating a branch to the upgrade or the patch process helps to avoid interference with your work in progress.

## Valkey in New Relic {#valkey-newrelic}

>[!NOTE]
>
>New Relic may still show Redis even after migration to Valkey.
>
>It is expected that New Relic continues to refer to the cache service as Redis even after the environment has been migrated to Valkey.
>
>Valkey is an open-source fork of Redis, and some tools and integrations continue to identify the service using Redis naming rather than a distinct Valkey label. This behavior does not necessarily indicate that Redis is still installed.

<!-- Fastly-related snippets begin -->

## Admin login {#admin-login-step}

1. [Log in](/help/get-started/onboarding.md#access-your-admin-panel) to the Admin.

## Automate custom VCL snippet deployment {#automate-vcl-snippet-deployment}

>[!NOTE]
>
>Instead of manually uploading custom VCL snippets, you can add snippets to the `$MAGENTO_CLOUD_APP_DIR/var/vcl_snippets_custom` directory in your environment. Snippets in this directory upload automatically when you click _upload VCL to Fastly_ in the Commerce Admin. See [Automated custom VCL snippets deployment](https://github.com/fastly/fastly-magento2/blob/master/Documentation/Guides/CUSTOM-VCL-SNIPPETS.md#automated-custom-vcl-snippets-deployment) in the Fastly CDN module for Magento 2 documentation.

<!-- Fastly-related snippets end -->
