---
title: Authentication keys
description: Learn how to apply authentication keys to a development project in Adobe Commerce on cloud infrastructure.
feature: Cloud, Security
topic: Security
exl-id: b5a24fcd-9b43-4ec9-8a0c-52956a74e45e
TQID: https://experienceleague.adobe.com/nYBr0uvw1SZPSQqAU6uHTiitjZ0kcudsLdWagiWRLP8
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: ba9e5be9-7de1-4f71-a5d2-baead0e425ee
    internal-label: Security
  - id: dac87252-6066-4d6e-a9d2-f6d84c323de7
    internal-label: Configuration
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
topic_v2:
  - id: d095671a-1355-40aa-8b5f-06c33c68080b
    internal-label: Security
---
# Authentication keys

You must have an authentication key to access the Adobe Commerce repository and to enable install and update commands for your Adobe Commerce on cloud infrastructure project. There are two methods for specifying Composer authorization credentials.

- **authentication file**—A file that contains your Adobe Commerce [authorization credentials](https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/prerequisites/authentication-keys.html) in your Adobe Commerce on cloud infrastructure root directory.
- **environment variable**—An environment variable to set up authentication keys in your Adobe Commerce on cloud infrastructure project to prevent accidental exposure.

>[!BEGINSHADEBOX]

**Security note**

Adobe recommends using the [environment variable](#composer-auth-environment-variable) method with your cloud project to prevent accidental exposure of your authorization credentials.

The authentication file method is ideal when using Cloud Docker for Commerce as a local development tool, but be careful not to upload the `auth.json` file to a public Git-based repository. You can add the `auth.json` file to the [`.gitignore` file](../project/file-structure.md#ignoring-files).

>[!ENDSHADEBOX]

## Authentication file

**To create an `auth.json` file**:

1. If you do not have an `auth.json` file in your project root directory, create one.

   - Using a text editor, create an `auth.json` file in your project root directory.
   - Copy the contents of the [sample `auth.json`](https://github.com/magento/magento2/blob/2.3/auth.json.sample) into the new `auth.json` file.

1. Replace `<public-key>` and `<private-key>` with your Adobe Commerce authentication credentials.

   ```json
   {
       "http-basic": {
           "repo.magento.com": {
               "username": "<public-key>",
               "password": "<private-key>"
           }
       }
   }
   ```

1. Save your changes and exit the text editor.

## Composer auth environment variable

The following method is the best way to prevent accidental exposure of sensitive credentials in a public Git-based repository.

**To add authentication keys using an environment variable**:

1. In the _[!DNL Cloud Console]_, click the configuration icon on the right side of the project navigation.

   ![Configure project](../../assets/icon-configure.png){width="36"}

1. In the _Project Settings_ list, click **[!UICONTROL Variables]**.

1. Click **[!UICONTROL Create variable]**.

1. In the **[!UICONTROL Variable name]** field, enter `env:COMPOSER_AUTH`.

1. In the _Value_ field, add the following and replace `<public-key>` and `<private-key>` with your Adobe Commerce authentication credentials:

   ```json
   {
       "http-basic": {
           "repo.magento.com": {
               "username": "<public-key>",
               "password": "<private-key>"
           }
       }
   }
   ```

1. Select **[!UICONTROL Available during buildtime]** and deselect **[!UICONTROL Available during runtime]**.

1. Click **[!UICONTROL Create variable]**.

1. Remove the `auth.json` file from each environment.
