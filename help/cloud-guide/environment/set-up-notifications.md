---
title: Set up notifications
description: Learn how to configure notifications for Adobe Commerce on cloud infrastructure environments.
feature: Cloud, Configuration, Logs
exl-id: dfbe1084-ad30-4489-af2d-d6f6b5eae1c4
---
# Set up notifications

By default, Adobe Commerce on cloud infrastructure writes build and deploy actions to the `app/var/log/cloud.log` file inside the Adobe Commerce root application directory. Optionally, you can send logs to a messaging system, such as Slack and email, to receive real-time notifications.

For example, you could send a Slack message to alert a group of people when a deployment fails, and prompt an investigation into what went wrong.

## Plan notifications

Before you configure notifications, consider the following:

-  What kind of notifications do you want to receive (Slack messages, email, both)?
-  How much detail do you want to see in the logs?
-  Where do you want to set up notifications (Integration, Staging, Production)?

For example, during initial development you may prefer email notifications that show detailed logs about your integration environment to help you debug issues before deploying to the Staging environment. When you are ready to deploy to the Staging or Production environment, you may prefer a Slack message that contains less detailed information.

>[!NOTE]
>
>The configuration file used to set up notifications is at the root of your project directory, so it applies when you push changes to any environment. If you want to customize notifications per environment, you must modify the configuration file before pushing it to that environment.

## Configure notifications

To configure notifications:

1. On your local workstation, change to your project directory.
1. In the `.magento.env.yaml` file in your project root, add your messaging system settings, including preferred notification [Log levels](log-handlers.md#log-levels).

    For example, to configure both Slack _and_ email configurations, use the following:

    ```yaml
    log:
      slack:
        token: "<your-slack-token>"
        channel: "<your-slack-channel>"
        username: "SlackHandler"
        min_level: "info"
      email:
        to: <your-email>
        from: <your-email>
        subject: "Log notification from Adobe Commerce"
        min_level: "notice"
    ```

   >[!NOTE]
   >
   >Adobe Commerce on cloud infrastructure only sends emails during the deployment phase.

1. Commit and push your changes to the remote server.

   ```bash
   git -A && git commit -m "Configure build/deploy notifications"
   ```

   ```bash
   git push origin <branch-name>
   ```

### Example Slack configuration

The following example shows a Slack-only configuration:

```yaml
log:
  slack:
    token: "<your-slack-token>"
    channel: "<your-slack-channel>"
    username: "SlackHandler"
    min_level: "info"
```

-  `token`—Your Slack [user token](https://api.slack.com/docs/token-types#user). Your user token authorizes Adobe Commerce on cloud infrastructure to send messages.
-  `channel`—Name of the Slack channel Adobe Commerce on cloud infrastructure sends notifications.
-  `username`—Username Adobe Commerce on cloud infrastructure uses to send notification messages in Slack.
-  `min_level`—Minimum log level for notification messages. We recommend using `info`.

### Example email configuration

The following example shows an email-only configuration:

>[!NOTE]
>
>Adobe Commerce on cloud infrastructure only sends emails during the deployment phase.

```yaml
log:
  email:
    to: <your-email>
    from: <your-email>
    subject: "Log notification from Adobe Commerce"
    min_level: "notice"
```

-  `to`—Email address Adobe Commerce on cloud infrastructure sends notification messages.
-  `from`—Email address for sending notification messages to recipients.
-  `subject`—Description of the email.
-  `min_level`—Minimum log level for notification messages. We recommend using `notice` or `warning`.
