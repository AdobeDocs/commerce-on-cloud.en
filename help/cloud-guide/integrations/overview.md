---
title: Integrations overview
description: Learn about third-party integration options for your Adobe Commerce on cloud infrastructure project.
role: Developer
feature: Cloud, Integration
last-substantial-update: 2024-02-06
exl-id: 97c5f70d-1465-46c9-bb33-98897262c5ef
---
# Integrations overview

Integrations are useful for using external services—such as Git hosting or Slack bots—and maintaining your current development processes, such as using the code review pull request function in GitHub. You can add the following integrations to your Adobe Commerce on cloud infrastructure project:

![Integrations](/help/assets/integrations.png)

>[!BEGINTABS]

>[!TAB CLI]

**To add an integration using the Cloud CLI**:

The following command begins interactive prompts to select the type and options for the new integration.

```bash
magento-cloud integration:add
```

**To list the integrations configured for your project**:

```bash
magento-cloud integration:list
```

Sample response:

```
+----------+--------------+---------------------------------------------------------------------------+
| ID       | Type         | Summary                                                                   |
+----------+--------------+---------------------------------------------------------------------------+
| <int-id> | bitbucket    | Repository: user/magento-int                                              |
|          |              | Hook URL:                                                                 |
|          |              | https://magento-url.cloud/api/projects/projectID/integrations/int-ID/hook |
| <int-id> | health.email | From: you@example.com                                                     |
|          |              | To: them@example.com                                                      |
+----------+--------------+---------------------------------------------------------------------------+
```

>[!TAB Console]

**To add an integration using the [!DNL Cloud Console]**:

1. In _Project Settings_, click **[!UICONTROL Integrations]**.

1. Click on an integration type or click **[!UICONTROL Add integration]**.

1. Step through the integration type selection and configuration steps.

1. After adding the integration, it appears in the list on the Integrations view.

>[!ENDTABS]

## Commerce webhooks

You can configure Commerce webhooks in your Cloud project with the [ENABLE_WEBHOOKS global variable](../environment/variables-global.md#enable_webhooks). Commerce webhooks send requests to an external server in response to Commerce-generated events. The [_Webhooks Guide_](https://developer.adobe.com/commerce/extensibility/webhooks) describes this feature in detail.

## Generic webhooks

You can capture and report Cloud infrastructure and repository events using a custom webhook integration to `POST` JSON messages to a _webhook_ URL.

**To add a webhook URL, use the following syntax**:

```bash
magento-cloud integration:add --type=webhook --url=https://hook-url.example.com
```

-  `type`—Specify the `webhook` integration type.
-  `url`—Provide the webhook URL that can receive JSON messages.

The sample response shows a series of prompts that provide an opportunity to customize the integration. Using the default (blank) response sends messages about all events on all environments in a project.

You can customize the integration to report specific [events](#events-to-report), such as pushing code to a branch. For example, you can specify the `environment.push` event to send a message when a user pushes code to a branch:

```
Events to report (--events)
A list of events to report, e.g. environment.push
Default: *
Enter comma-separated values (or leave this blank)
>
```

You can choose to report events in a `pending`, `in_progress`, or `complete` state:

```
States to report (--states)
A list of states to report, e.g. pending, in_progress, complete
Default: complete
Enter comma-separated values (or leave this blank)
>
```

And you can _include_ or _exclude_ messages for specific environments:

```
Included environments (--environments)
The environment IDs to include
Default: *
Enter comma-separated values (or leave this blank)
>

Excluded environments (--excluded-environments)
The environment IDs to exclude
Enter comma-separated values (or leave this blank)
>
```

When the integration is complete, you receive a summary of the values:

```
Created integration integration-ID (type: webhook)
+-----------------------+------------------------------+
| Property              | Value                        |
+-----------------------+------------------------------+
| id                    | integration-ID               |
| type                  | webhook                      |
| events                | - '*'                        |
| environments          | - '*'                        |
| excluded_environments | {  }                         |
| states                | - complete                   |
| url                   | https://hook-url.example.com |
+-----------------------+------------------------------+
```

### Update existing integration

You can update an existing integration. For example, change the states from `complete` to `pending` using the following:

```bash
magento-cloud integration:update --states=pending <int-id>
```

Sample response:

```
Integration integration-ID (webhook) updated
+-----------------------+------------------------------+
| Property              | Value                        |
+-----------------------+------------------------------+
| id                    | integration-ID               |
| type                  | webhook                      |
| events                | - '*'                        |
| environments          | - '*'                        |
| excluded_environments | {  }                         |
| states                | - pending                    |
| url                   | https://hook-url.example.com |
+-----------------------+------------------------------+
```

### Events to report

| Event | Description |
| ----- | :-----------|
| `environment.access.add`    | A user has been granted access to the environment |
| `environment.access.remove` | A user has been removed from the environment |
| `environment.activate`      | A branch has been "activated" with an environment |
| `environment.backup`        | A user triggered a snapshot |
| `environment.branch`        | A branch has been created using the management console |
| `environment.deactivate`    | A branch has been "deactivated". The code is still there but the environment was destroyed |
| `environment.delete`        | A branch has been deleted |
| `environment.initialize`    | The `master` branch of the project initialized with a first commit |
| `environment.merge`         | An active branch has been merged using the management console or API |
| `environment.push`          | A user pushed code to a branch |
| `environment.restore`       | A user restored a snapshot |
| `environment.route.create`  | A route has been created using the management console |
| `environment.route.delete`  | A route has been deleted using the management console |
| `environment.route.update`  | A route has been modified using the management console |
| `environment.subscription.update` | The `master` environment has been resized because the subscription has changed, but here are no content changes |
| `environment.synchronize`   | An environment has had data or code recopied from its parent environment |
| `environment.update.http_access` | HTTP access rules for an environment have been modified |
| `environment.update.restrict_robots` | The block-all-robots feature has been enabled or disabled |
| `environment.update.smtp`   | Sending of emails has been enabled or disabled for an environment |
| `environment.variable.create` | A variable has been created |
| `environment.variable.delete` | A variable has been deleted |
| `environment.variable.update` | A variable has been modified |
| `project.domain.create`     | A domain has been created and added to the project |
| `project.domain.delete`     | A domain associated with the project has been removed |
| `project.domain.update`     | A domain associated with the project has been updated |
