---
title: Variable levels and options
description: Learn about the different variable levels and options used in customizing your Adobe Commerce on cloud infrastructure project runtime environment.
feature: Cloud, Configuration, Security
exl-id: 6761cb45-9c8d-4a4e-940f-d62e0e15dcb4
---
# Variable levels

Project variables apply to all environments within the project. Environment variables apply to a specific environment or branch. An environment _inherits_ variable definitions from the parent environment.

You can override an inherited value by defining the variable specifically for the environment. For example, to set variables for development, define the variable values in the `.magento.env.yaml` file in the integration environment. All environments branching from the integration environment inherit those values. See [Deployment configuration](configure-env-yaml.md) for details about configuring your environment using the `.magento.env.yaml` file.

>[!BEGINTABS]

>[!TAB CLI]

**To set variables using the Cloud CLI**:

- **Project-specific variables**—To set the same value for _all_ environments in your project. These variables are available at build and runtime in all environments.

    ```bash
    magento-cloud variable:create --level project --name <variable-name> --value <variable-value>
    ```

- **Environment-specific variables**—To set a unique value for a _specific_ environment. These variables are available at runtime and are inherited by child environments. Specify the environment in your command using the `-e` option.

    ```bash
    magento-cloud variable:create --level environment --name <variable-name> --value <variable-value>
    ```

After setting project-specific variables, you must manually redeploy the remote environment for the change to take effect. Push the new commits to trigger a redeployment.

>[!TAB Console]

**To set variables using the [!DNL Cloud Console]**:

1. In the _[!DNL Cloud Console]_, click the configuration icon on the right side of the project navigation.

   ![Configure project](../../assets/icon-configure.png){width="36"}

1. To set a project-level variable, under _Project Settings_ click **Variables**.

   ![Project variables](../../assets/ui-project-variables.png)

1. To set an environment-level variable, in the _Environments_ list, select an environment and click the **[!UICONTROL Variables]** tab.

   ![Environment variables tab](../../assets/ui-environment-variables.png)

1. Click **[!UICONTROL Create variable]**.

1. Provide a name and value for the variable. Choose from the options:

   - Available during runtime
   - Available during buildtime
   - JSON value
   - Sensitive variable (value hidden in the console and CLI responses)
   - Make inheritable (child environments can inherit environment-level variables)

1. Click **[!UICONTROL Create variable]**.

>[!CAUTION]
>
>Setting environment-specific variables in the [!DNL Cloud Console] automatically redeploys the environment.

>[!ENDTABS]

## Visibility

You can limit the visibility of a variable during build or runtime using the `--visible-<build|runtime>` command. Also, there are options to set inheritance and sensitivity.

Use the following options to prevent a variable from being seen or inherited:

- `--inheritable false`—disables inheritance for child environments. This is useful for setting production-only values on the `master` branch and allowing all other environments to use a project-level variable of the same name.
- `--sensitive true`—marks the variable as _non-readable_ in the [!DNL Cloud Console]. You cannot view the variable in the user interface; however, you can view the variable from the application container, like any other variable.

The following demonstrates a specific case for preventing a variable from being seen or inherited. You can only specify these options in the CLI. This case does not pertain to all available environment variables.

```bash
magento-cloud variable:create --name <variable-name> --value <variable-value> --inheritable false --sensitive true
```

## Verify variable levels and values

You can view a list of existing variables using the Cloud CLI.

```bash
magento-cloud variables
```

```
Variables on the project Project-Name (<project-id>), environment <environment-name>:
+----------------------------+-------------+-------------------------------------------+
| Name                       | Level       | Value                                     |
+----------------------------+-------------+-------------------------------------------+
| env:COMPOSER_AUTH          | project     | {                                         |
|                            |             |    "http-basic": {                        |
|                            |             |       "repo.magento.com": {               |
|                            |             |       "username":                         |
|                            |             | "<public-key>",                           |
|                            |             |       "password":                         |
|                            |             | "<private-key>"                           |
|                            |             |     }                                     |
|                            |             |   }                                       |
|                            |             | }                                         |
| ADMIN_EMAIL                | project     | admin@123.com                             |
| ADMIN_EMAIL                | environment | admin@123.com                             |
| ADMIN_PASSWORD             | environment | password                                  |
| ADMIN_URL                  | environment | admin123                                  |
| ADMIN_USERNAME             | environment | admin                                     |
| php:newrelic.license       | environment | xxxx71fb030366182117f955a22e4baf8exxxxxx  |
+----------------------------+-------------+-------------------------------------------+
```
