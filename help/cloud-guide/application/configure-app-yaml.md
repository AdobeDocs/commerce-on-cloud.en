---
title: Configure application deployment
description: Learn how to configure the properties in the application configuration file that control the way the [!DNL Commerce] application builds and deploys to the Cloud environment.
feature: Cloud, Configuration, Build, Deploy
exl-id: 47dcb13f-8873-495d-956f-08a5e04844d9
---
# Configure application deployment

The `.magento.app.yaml` file controls the way that your application builds and deploys. Although Adobe Commerce on cloud infrastructure supports multiple applications per project, typically, a project has a single application with the `.magento.app.yaml` file at the root of the repository.

The `.magento.app.yaml` has many default values, see [a sample `.magento.app.yaml` file](https://github.com/magento/magento-cloud/blob/master/.magento.app.yaml). Always review the `.magento.app.yaml` for your installed version. This file can differ across Adobe Commerce on cloud infrastructure versions.

Use the `.magento.app.yaml` file to define the following configuration values:

- [Properties](properties.md)—Define property values for application instance.
- [Variables property](variables-property.md)—Review environment variables required for the [!DNL Commerce] application version.
- [PHP settings](php-settings.md)—Configure runtime PHP options.
- [Set Cache For Static Files](set-cache.md)—Set cache TTL for your media and static files.

>[!NOTE]
>
>The `.magento.app.yaml` file is managed locally or in the git repository. The configuration is only read for the purpose of the deployment and build process and gets removed after the deployment has been completed, so you will not find it on the server.
