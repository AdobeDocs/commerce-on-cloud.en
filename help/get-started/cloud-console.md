---
title: Log in to [!DNL Cloud Console]
description: Learn about the [!DNL Cloud Console] for Adobe Commerce on Cloud infrastructure.
recommendations: noDisplay, catalog
last-substantial-update: 2024-02-06T00:00:00.000Z
exl-id: 4c68508a-f25a-457b-be6d-36dc8ac428f1
TQID: https://experienceleague.adobe.com/5j8ZQakF2ZDWiO0and7Pa4iHp-3CCXbEHgYgZBZ6avo
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: ba9e5be9-7de1-4f71-a5d2-baead0e425ee
    internal-label: Security
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
topic_v2:
  - id: cc72dcf1-72e1-48cc-b434-e7c27d62d67c
    internal-label: Accessibility
  - id: d095671a-1355-40aa-8b5f-06c33c68080b
    internal-label: Security
---
# Log in to [!DNL Cloud Console]

The [!DNL Cloud Console] provides interactive methods to build, manage, and deploy Commerce code. The [!DNL Cloud Console] is a more modern, user-friendly experience and lays the foundation for future interface enhancements.

[Log in to the [!DNL Cloud Console]](https://console.adobecommerce.com) to view your project list.

![Project list](../assets/ui-allprojects-list.png)

## Features

The new or improved features include:

- Clear overview of project and environment characteristics
- Activity stream with sortable history
- Manual backup management and history for Starter projects
- Enhanced log views
- Sortable lists
- Simple forms and guidance to add integrations
- Web Content Accessibility Guidelines (WCAG) compliance

![[!DNL Cloud Console]](../assets/CloudConsole.svg)

The new or improved features are as follows:

| Feature        | Improvements                        |
| -------------- | ----------------------------------- |
| [Activity stream](../cloud-guide/project/activity-stream.md) | Interact with a sortable list of running, pending, or historical actions. Select an activity and view logs or cancel a running build. |
| [Project and Environment overviews](../cloud-guide/project/overview.md#project-overview) | Open your project and see the overview of project details and environment list. The environment overview provides more details about the environment status, application access, and recent activities. |
| [Integration forms](../cloud-guide/integrations/overview.md) | Use simple forms and guidance to add integrations, such as Bitbucket or Slack notifications. |
| [Project list](../cloud-guide/project/overview.md#cloud-console) | The _All projects_ view lists all projects that you have permission to access. You can click **[!UICONTROL Show filters]** and filter your project list by type, region, or plan. |
| [Variable visibility options](../cloud-guide/environment/variable-levels.md) | Limit the visibility of a project-level or environment-level variable during build or runtime. |

<!--
The following are features yet to be activated:
| **Apps and services topology** | The Apps & Services topology is visible on Project and Environment views. This interactive diagram allows you to select a service and view the relationship details, such as name, type, version, port, and more. Click **[!UICONTROL View details]** to access the overview and configuration panel for each service. | 
-->

## Console questions

**_Where can I find the Snapshots feature_**?

For [!DNL Starter] projects, the Snapshots feature is now called _Backups_. You can create a manual backup of your [!DNL Starter] environment from the [!DNL Cloud Console] or create a snapshot from the Cloud CLI. You must have an Admin role for the environment.

Select an environment from the project navigation bar. The environment must be active. Select the **[!UICONTROL Backups]** tab. Currently, this option is not available for Pro environments.

**_Where is the list of configured routes for the environment_**?

You can find the list of configured routes on the _Services_ tab for an environment.

Select an environment from the project navigation bar. Select the **[!UICONTROL Services]** tab. The **Router** overview displays the configured routes. Currently, you cannot add a route from the new [!DNL Cloud Console].

## Account menu

In the top right-hand corner is your account menu. Click the down arrow for the menu and select **[!UICONTROL My Profile]**. In the _My Profile_ view, you can control your user details and display settings, manage [security authentication](../cloud-guide/project/user-access.md#user-authentication-requirements), [API tokens](../cloud-guide/project/user-access.md#create-an-api-token), and [SSH keys](../cloud-guide/development/secure-connections.md).
