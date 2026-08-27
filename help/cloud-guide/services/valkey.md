---
title: Set up Valkey service
description: Learn how to set up and optimize Valkey as a backend cache solution for Adobe Commerce on Cloud Infrastructure.
feature: Cloud, Cache, Services
exl-id: f8933e0d-a308-4c75-8547-cb26ab6df947
TQID: https://experienceleague.adobe.com/-aBnwClJGQlRkEfugtChxbjLObLzTu0xl1IvkYUVRsk
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: dac87252-6066-4d6e-a9d2-f6d84c323de7
    internal-label: Configuration
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Set up Valkey service

[Valkey](https://valkey.io) is an optional backend cache solution for Adobe Commerce on cloud infrastructure. Valkey is required when you override the default cache configuration on Adobe Commerce 2.4.9 and later, or on patch releases later than 2.4.5-p16, 2.4.6-p14, 2.4.7-p9, and 2.4.8-p4.

For cache, session, and L2 configuration recommendations, see [Best practices for Valkey and Redis service configuration](https://experienceleague.adobe.com/en/docs/commerce-operations/implementation-playbook/best-practices/planning/redis-valkey-service-configuration){target="_blank"} in the _Implementation Playbook Best Practices Guide_.

{{service-instruction}}

## Configure Valkey

To replace Redis with Valkey, update the following files:

- .magento/services.yaml
- .magento.app.yaml
- .magento.env.yaml

### Configure the service

In `.magento/services.yaml`, replace the Redis service definition with a Valkey service definition. Replace <version> with a Valkey version supported by your Adobe Commerce version and current Cloud template.

```yaml
cache:
  type: valkey:<version>
```

For example:
   
```yaml
cache:
  type: valkey:8.0
```

The example version is not universal. Actual default and supported service versions depend on your Adobe Commerce version and current Cloud template. Use the version specified by the current project template. See [Configure services](services-yaml.md#service-versions) for more information.

>[!WARNING]
>
>If you change the service ID, the existing service is removed and a new service is created. Existing data in the removed service is permanently deleted. Back up the environment before renaming a service.

### Configure the service relationship

In `.magento.app.yaml`, configure the relationship between the application and the Valkey service:

```yaml
relationships:
  valkey: "cache:valkey"
```

The relationship key, `valkey`, is the name used by the application to access the service. The value, `cache:valkey`, references the service ID and service type defined in `.magento/services.yaml`.

### Configure the Valkey backend

In `.magento.env.yaml`, configure the Valkey backend appropriate for your Adobe Commerce version.

For Adobe Commerce 2.4.8 and earlier versions that support Valkey, use the remote-synchronized cache backend:

```yaml
stage:
  deploy:
    VALKEY_BACKEND: '\Magento\Framework\Cache\Backend\RemoteSynchronizedCache'
```

For Adobe Commerce 2.4.9 and later, use the Symfony L2 cache implementation:

```yaml
stage:
  deploy:
    VALKEY_BACKEND: symfony_l2
```

The symfony_l2 implementation is supported with Valkey and is configured through the `VALKEY_BACKEND` deployment variable. Do not configure it manually in `app/etc/env.php`, because deployment can overwrite manual changes.

See [Deploy variables](../environment/variables-deploy.md) for additional configuration details.

### Enable the replica connection

>[!NOTE]
>
>`VALKEY_USE_SLAVE_CONNECTION` is supported for Adobe Commerce 2.4.8 and later on supported Pro Staging and Production cluster environments that provide a read-only Valkey replica. Before enabling it, verify that the environment provides the required replica connection details. Use the relationship inspection command in [Verify the service relationship](services-yaml.md#service-relationships).

If your Pro environment provides a replica, add the following configuration to `.magento.env.yaml`:

```yaml
stage:
  deploy:
    VALKEY_USE_SLAVE_CONNECTION: true
```

### Commit and deploy the changes

Add, commit, and push the configuration changes:

```terminal
git add .magento/services.yaml .magento.app.yaml .magento.env.yaml
git commit -m "Enable Valkey service"
git push origin <branch-name>
```

After the deployment completes, verify that the Valkey service relationship is available.

{{service-change-tip}}

{{valkey-newrelic}}

## Verify the service relationship

After deploying the configuration, run the following command from an application container to display the decoded `MAGENTO_CLOUD_RELATIONSHIPS` object:

Use SSH to connect to the remote Cloud environment, then run:

```terminal
echo "$MAGENTO_CLOUD_RELATIONSHIPS" | base64 -d | json_pp
```
The command displays all configured service relationships. Locate the valkey relationship to identify the Valkey connection details.

**Example output**

The following is an abbreviated, valid JSON example showing the `valkey` relationship.

```json
{
   "database" : [
      {
         "host" : "database.internal",
         "port" : 3306,
         "path" : "main",
         "scheme" : "mysql"
      }
   ],
   "opensearch" : [
      {
         "host" : "opensearch.internal",
         "port" : 9200,
         "path" : null,
         "scheme" : "http"
      }
   ],
   "valkey" : [
      {
         "host" : "valkey.internal",
         "port" : 6379,
         "path" : null,
         "scheme" : "valkey"
      }
   ]
}
```

The output varies by environment and service configuration. Do not hard-code hostnames, ports, IP addresses, cluster names, service versions, usernames, or passwords from this example. Use the values returned by `MAGENTO_CLOUD_RELATIONSHIPS` in the target environment.

To display only the Valkey relationship, run:

```terminal
printf '%s' "$MAGENTO_CLOUD_RELATIONSHIPS" \
  | base64 -d \
  | jq '{valkey: .valkey}'
```

For more information about service relationships, see [Configure services](services-yaml).

## Using the Valkey CLI

Assuming your Valkey relationship is named `valkey`, use the host and port returned by `MAGENTO_CLOUD_RELATIONSHIPS` to connect to Valkey:

```terminal
valkey-cli -h <host> -p <port>
```
**Example**

```terminal
valkey-cli -h valkey.internal -p 6379
```

### Get the installed Valkey version

>[!BEGINTABS]

>[!TAB Integration environment]

On an Integration environment, run:

```terminal
valkey-cli -h valkey.internal info | grep version
```
**Example response**

```text
valkey_version:8.0.1
gcc_version:12.2.0
```

The returned version may differ depending on the Valkey service provisioned for the environment.

>[!TAB Pro Staging and Production]

On Pro Staging and Production environments, run:

```terminal
valkey-server -v
```

**Example response**

```text
Valkey server v=8.0.1 ...
```

The version and build details may differ by environment. Treat the displayed version as the authoritative version for the environment where you run the command.
