# Pro services support and customer availability

## Support

To request and complete a Pro service upgrade in Staging or Production, follow these steps:

1. **To install or update [services](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/configure/service/services-yaml) in `Staging` and `Production` environments only**, submit an [Adobe Commerce Support ticket](https://experienceleague.adobe.com/en/docs/support-resources/adobe-support-tools-guide/adobe-commerce-support/adobe-commerce-help-center-user-guide#submit-ticket).

   In the ticket, specify the required service changes, include the updated `.magento.app.yaml` and `.magento/services.yaml` files, and note the target PHP version. PHP version, Composer updates, extensions, and environment settings are self-service changes—Adobe may need to update the New Relic agent for PHP version compatibility. See [PHP settings](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/configure/app/php-settings) in _Application configuration_.

   >[!IMPORTANT]
   >
   >When selecting the **[!UICONTROL Environment]** field in the ticket form, use Adobe's environment naming. For example, select Staging even if you call that environment **Dev** internally. You can mention your internal name in the description, but the [!UICONTROL Environment] field must use Adobe's nomenclature.

1. **Confirm the upgrade schedule** through Adobe's two-part process: you confirm the requested date and time first, then Support submits it to the Infrastructure team for final confirmation.

   Production changes (Pro only) require at least two business days' notice, excluding weekends—for example, the Cloud Infrastructure team must acknowledge a Monday upgrade by the preceding Wednesday. Expect additional lead time during peak demand. To avoid delays, respond to the initial request at least 48 hours before the window, as the upgrade isn't considered scheduled until you receive final confirmation.

   >[!NOTE]
   >
   >Provide maintenance windows in UTC. Staging upgrades aren't scheduled in advance and are typically completed the same day as the request.
   >
   >After a RabbitMQ upgrade, redeploy the environment to re-initialize the message queues.

1. **Validate the upgrade** in a Staging or Integration environment before scheduling it in Production.

   Issues caused by third-party modules, custom code, or dependency compatibility often surface during the redeployment that follows a service upgrade. To validate multiple service upgrades one at a time, a reasonable order is Valkey or Redis, then RabbitMQ, then OpenSearch, then MariaDB. This isn't a required sequence—database upgrades carry the highest operational impact and deserve the most caution.

   Adobe can't guarantee the exact duration of a Production maintenance window in advance, since timing depends on the environment and the services involved. Use the time your Staging upgrade takes as a practical estimate when planning the Production window.

1. **Redeploy the environment** after Adobe completes the service upgrade so the change takes effect, even if the Adobe Commerce application version doesn't change.

   If the upgrade includes OpenSearch, also plan for a full reindex. Adobe cannot guarantee zero downtime for a service upgrade, so plan a maintenance window that allows time to redeploy, reindex if needed, and validate the storefront and Admin before reopening the site.

## Customer availability during upgrades

**A representative from your team or implementation partner must be available online for the duration of the scheduled Production upgrade window.** Scheduling during a low-traffic period doesn't make the upgrade hands-off—Adobe manages the cloud infrastructure upgrade but can't validate your application behavior, integrations, custom code, or business workflows.

The available representative must be able to:

- **Monitor** the storefront and critical business transactions during and after the upgrade.
- **Respond** to questions from Adobe Support or the Cloud Infrastructure team.
- **Confirm** that integrations, extensions, customizations, cron jobs, queues, and other customer-specific functions are working as expected.
- **Validate** business-critical workflows, such as checkout, catalog views, search, login, and order processing.
- **Report** unexpected behavior promptly, while the upgrade context and logs are still available.

>[!TIP]
>
>For Pro projects, service upgrades in Production also require advance scheduling and a two-part confirmation process with Adobe Support. See [Pro services support](#pro-services-support).

### Maintenance mode

**Maintenance mode is not a substitute for customer availability.** It only blocks storefront access—it doesn't validate application services, integrations, queues, cron jobs, checkout, or other customer-specific functions.

If the planned work requires maintenance mode, coordinate its use with Adobe Support and follow the instructions for that upgrade. Afterward, confirm that the storefront and critical workflows are operating normally before considering the work complete.
