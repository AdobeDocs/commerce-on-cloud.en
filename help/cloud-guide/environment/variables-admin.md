---
title: ADMIN variables
description: See a list of environment variables used when installing Adobe Commerce on cloud infrastructure.
feature: Cloud, Configuration, Install, Roles/Permissions
role: Developer
exl-id: d2746185-bc59-4d30-a088-73df1bd2c0b2
---
# Admin variables

Users that have administrative access to the Adobe Commerce on cloud infrastructure project can use the following project environment variables to override the configuration settings for the administrative user account to access the Admin UI.

## Admin credentials

You can override Admin user credentials during Commerce installation with the ADMIN variables in the following table.

If you want to change the values after installation, connect to your environment using SSH and use the Adobe Commerce CLI [`admin:user` command](https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/tutorials/admin.html) to create or edit the Admin user credentials.

| Variable       | Default                     | Description |
| -------------- | --------------------------- | ----------- |
|`ADMIN_USERNAME`| License Owner email address | A username for the administrative user with the ability to create other users, including administrative users.|
|`ADMIN_EMAIL`   |                             | Email address for the administrative user. This address is used to send password reset notifications.|
|`ADMIN_PASSWORD`|                             | Password for the administrative user. When the project is created, a random password is generated and an email is sent to the License Owner. During project creation, the License Owner should have already changed the password. Contact the License Owner for the updated password.|
|`ADMIN_LOCALE`  | `en_US`                     | The default locale used by the Admin.|

## Admin URL

Use the following environment variable to secure access to your Admin UI. If specified, this value overrides the default URL during installation. On [!DNL Adobe Commerce] on cloud infrastructure, you must set or change the Admin URL using this variable ([!DNL Cloud Console] or [!DNL Cloud CLI]); do not change it from the Admin UI—that method is for on-premises installations only.

`ADMIN_URL`—The relative URL to access the Admin UI. The default URL is `/admin`.

### Change the Admin URL

By default, the [Commerce Admin](https://experienceleague.adobe.com/docs/commerce-admin/start/admin/admin.html) URL is set to *&lt;domain_name&gt;/admin*. For security reasons, Adobe recommends changing it to a unique, custom Admin URL that is not easy to guess.

**In [!DNL Adobe Commerce] on cloud infrastructure**,  you must change the Admin URL using the `ADMIN_URL` environment variable in the ([!DNL Cloud Console] or [!DNL Cloud CLI]). Modifying the setting from the [!DNL Admin] is only applicable for on-premises installations. For on-premises installations, follow [use a custom admin URL](https://experienceleague.adobe.com/docs/commerce-admin/stores-sales/site-store/store-urls.html#use-a-custom-admin-url).

Adobe recommends changing the environment-level variable for the Admin URL after installation. Configure this setting for security reasons before branching from the cloned `master` environment. All branches created from the `master` branch inherit the environment-level variables and their values unless you set inheritance to false.

Use either the [!DNL Cloud Console] or the [!DNL Cloud CLI] to set or update `ADMIN_URL`.

#### Option A: Change the Admin URL using the [!DNL Cloud Console]

##### Integration environment

From the [Cloud Console](https://experienceleague.adobe.com/docs/commerce-cloud-service/user-guide/project/overview.html), add a new variable with:

- **Name:** `ADMIN_URL`
- **Value:** Your new Admin URL (for example, `magento_A8v10`)

- For detailed steps, see [add environment variables](https://experienceleague.adobe.com/docs/commerce-cloud-service/user-guide/project/overview.html#configure-environment) or [environment variables](https://experienceleague.adobe.com/docs/commerce-cloud-service/user-guide/configure/env/stage/variables-admin.html) in our developer documentation.

##### Step-by-step in the [!DNL Cloud Console]

1. Log in to the [Cloud Console](https://console.adobecommerce.com/).
2. Select a project from the **[!UICONTROL All projects]** list.
3. In the project overview, select the environment and click the configuration icon.
4. Select the **[!UICONTROL Variables]** tab.
5. Click **[!UICONTROL Create Variable]** (or edit the existing `ADMIN_URL` variable if present).
6. Enter the following:
   - **Variable name:** `ADMIN_URL`
   - **Value:** Your new Admin path (for example, `magento_A8v10`).

   By default, **[!UICONTROL Available during runtime]** and **[!UICONTROL Make inheritable]** are selected. To prevent child environments from inheriting this value, clear **[!UICONTROL Make inheritable]** for this variable.
7. Click **[!UICONTROL Create variable]** (or **[!UICONTROL Save]**) and wait until deployment completes. The button is only visible when the required fields contain values.

##### When Staging and Production are not available in the [!DNL Cloud Console]

[Submit a support ticket](https://experienceleague.adobe.com/en/docs/support-resources/adobe-support-tools-guide/adobe-commerce-support/adobe-commerce-help-center-user-guide#submit-ticket) requesting to add the `ADMIN_URL` variable for your Staging or Production environment. If Staging and Production are accessible from the [!DNL Cloud Console], add the variable as described in the *Integration environment* section above.

#### Option B: Change the Admin URL using the [!DNL Cloud CLI]

Use the `magento-cloud variable:update` command to update the variable. (The `variable:set` command has been deprecated and is not available.)

Example for the `master` environment—update `ADMIN_URL` to `newAdmin_A8v10` and prevent child environments from inheriting the value:

```bash
magento-cloud variable:update ADMIN_URL --value newAdmin_A8v10 -e master --inheritable false
```

- **Redeployment:** Changing the `ADMIN_URL` variable via [!DNL Cloud CLI] triggers a redeployment of the environment. Plan for this when making the change.
- **Inheritance:** Variables are inheritable by default. To prevent the value from being inherited by child environments, use the `--inheritable false` option as shown. For more detail, see [variable level visibility](https://experienceleague.adobe.com/docs/commerce-cloud-service/user-guide/configure/env/variable-levels.html#visibility).

>[!NOTE]
>
>The `ADMIN_URL` value accepts letters (a–z, A–Z), numbers (0–9), and the underscore character (_). Spaces or other characters are not accepted.
