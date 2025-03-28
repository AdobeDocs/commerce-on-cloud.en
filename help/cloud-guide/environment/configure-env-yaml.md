---
title: Configure environment
description: Learn how to configure build and deploy actions across all Commerce on cloud infrastructure environments, including Pro Staging and Production, using environment variables.
feature: Cloud, Build, Configuration, Deploy, SCD
role: Developer
exl-id: f39c73fc-351a-41ed-9e74-2c3f14871246
---
# Configure environment variables for deployment

The `.magento.env.yaml` file uses environment variables to centralize the management of build and deploy actions across all of your environments, including Pro Staging and Production. To configure unique actions in each environment, you must modify this file in each environment.

>[!TIP]
>
>YAML files are case sensitive and do not allow tabs. Be careful to use consistent indentation throughout the `.magento.env.yaml` file or your configuration may not work as expected. The examples in the documentation and in the sample file use _two-space_ indentation. Use the [ece-tools validate command](#validate-configuration-file) to check your configuration.

## File structure

The `.magento.env.yaml` file contains two sections: `stage` and `log`. The `stage` section controls actions that occur during the phases of the [Cloud deployment process](../deploy/process.md).

- `stage`—Use the stage section to define certain actions for the following stages of deployment:
    - `global`—Controls actions in both the build, deploy, and post-deploy phases. You can override these settings in the build, deploy, and post-deploy sections.
    - `build`—Controls actions in the build phase only. If you do not specify settings in this section, the build phase uses settings from the global section.
    - `deploy`—Controls actions in the deploy phase only. If you do not specify settings in this section, the deploy phase uses settings from the global section.
    - `post-deploy`—Controls actions _after_ deploying your application and _after_ the container begins accepting connections.
- `log`—Use the log section to configure [notifications](set-up-notifications.md), including notification types and level of detail.
    - `slack`—Configure a message to send to a Slack bot.
    - `email`—Configure an email to send to one or more email recipients.
    - [log handlers](log-handlers.md)—Configure hardware and software application messages sent to a remote logging server.

### Environment variables

The `ece-tools` package sets values in the `env.php` file based on values from [Cloud variables](variables-cloud.md), variables set in the [!DNL Cloud Console], and the `.magento.env.yaml` configuration file. The environment variables in the `.magento.env.yaml` file customize the Cloud environment by overriding your existing Commerce configuration. If a default value is `Not Set`, then the `ece-tools` package takes **NO** action and uses the [!DNL Commerce] default or the value from the MAGENTO_CLOUD_RELATIONSHIPS configuration. If the default value is set, then the `ece-tools` package acts to set that default.

The following topics contain detailed definitions, such as whether a default value is set or not set, of all variables that you can use in the `.magento.env.yaml` file:

-  [Global](variables-global.md)—variables control actions in each phase: build, deploy, and post-deploy
-  [Build](variables-build.md)—variables control build actions
-  [Deploy](variables-deploy.md)—variables control deploy actions
-  [Post-deploy](variables-post-deploy.md)—variables control actions after deploy

### Create configuration file from CLI

You can generate a `.magento.env.yaml` configuration file for a Cloud environment using the following `ece-tools` commands.

>Creates a configuration file

```bash
php ./vendor/bin/ece-tools cloud:config:create `<configuration-json>`
```

>Update values in the configuration file

```bash
php ./vendor/bin/ece-tools cloud:config:update `<configuration-json>`
```

Both commands require a single argument: a JSON-formatted array that specifies a value for at least one build, deploy, or post-deploy variable. For example, the following command sets values for the `SCD_THREADS` and `CLEAN_STATIC_FILES` variables:

```bash
php vendor/bin/ece-tools cloud:config:create '{"stage":{"build":{"SCD_THREADS":5}, "deploy":{"CLEAN_STATIC_FILES":false}}}'
```

And creates a `.magento.env.yaml` file with the following settings:

```yaml
stage:
  build:
    SCD_THREADS: 5
  deploy:
    CLEAN_STATIC_FILES: false
```

You can use the `cloud:config:update` command to update the new file. For example, the following command changes the `SCD_THREADS` value and adds the `SCD_COMPRESSION_TIMEOUT` configuration:

```bash
php vendor/bin/ece-tools cloud:config:update '{"stage":{"build":{"SCD_THREADS":3, "SCD_COMPRESSION_TIMEOUT":1000}}}'
```

The updated file contains the following configuration:

```yaml
stage:
  build:
    SCD_THREADS: 3
    SCD_COMPRESSION_TIMEOUT: 1000
  deploy:
    CLEAN_STATIC_FILES: false
```

### Validate configuration file

Use the following `ece-tools` command to validate the `.magento.env.yaml` configuration file before pushing changes to the remote Cloud environment.

```bash
php ./vendor/bin/ece-tools cloud:config:validate
```

The following sample response provides a list of items to correct:

```
Environment configuration is not valid. Correct the following items in your .magento.env.yaml file:
The SCD_THREADS variable contains an invalid value of type string. Use the following type: integer.
The SCD_STRATEGY variable contains an invalid value fast. Use one of the available value options: compact, quick, standard.
The NOT_EXIST_OPTION variable is not allowed in configuration.
```

## PHP constants

You can use PHP constants in `.magento.env.yaml` file definitions instead of hard-coding values. The following example defines the `driver_options` using a PHP constant:

```yaml
stage:
  deploy:
    DATABASE_CONFIGURATION:
      connection:
        default:
          driver_options:
            !php/const:\PDO::MYSQL_ATTR_LOCAL_INFILE : 1
        indexer:
          driver_options:
            !php/const:\PDO::MYSQL_ATTR_LOCAL_INFILE : 1
      _merge: true
```

>[!WARNING]
>
>Constant parsing does not work when using a `symfony/yaml` package version earlier than 3.2.

## Error handling

When a failure occurs because of an unexpected value in the `.magento.env.yaml` configuration file, you receive an error message. For example, the following error message presents a list of suggested changes to each item with an unexpected value, sometimes providing valid options:

```
- Environment configuration is not valid. Please correct .magento.env.yaml file with next suggestions:
  Item CRON_CONSUMERS_RUNNER is not supposed to be in stage build. Please move it to one of possible stages: global, deploy
  Item SKIP_SCD has unexpected type string. Please use one of next types: boolean
  Item VERBOSE_COMMANDS has unexpected type boolean. Please use one of next types: string
  Item SKIP_HTML_MINIFICATION has unexpected type string. Please use one of next types: boolean
  Item CRON_CONSUMERS_RUNNER has unexpected type boolean. Please use one of next types: array
  Item VAR_WARM_UP_PAGES is not allowed in configuration.
  Item WARM_UP_PAGES has unexpected type string. Please use one of next types: array
```

Make any corrections, commit, and push the changes. If you do not receive an error message, then the changes to your configuration file pass the validation.

## Configuration management optimization

If you have enabled Configuration Management after dumping the configurations, you should move the SCD_* variables from the deploy to the build stage. See [Static content deployment strategies](../deploy/static-content.md).

>Before Configuration Management:

```yaml
  deploy:
    CRON_CONSUMERS_RUNNER:
      cron_run: true
      consumers: []
    SCD_STRATEGY: compact
    SCD_MATRIX:
      ...
    REDIS_USE_SLAVE_CONNECTION: 1
```

>After enabling Configuration Management, move the SCD_* variables to the build stage:

```yaml
  deploy:
    CRON_CONSUMERS_RUNNER:
      cron_run: true
      consumers: []
    REDIS_USE_SLAVE_CONNECTION: 1
  build:
    SCD_STRATEGY: compact
    SCD_MATRIX:
      ...
```
