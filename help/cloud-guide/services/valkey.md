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

[Valkey](https://valkey.io) is an optional, backend cache solution for Adobe Commerce on cloud infrastructure. For Adobe Commerce 2.4.9 and later, and for patch releases later than 2.4.5-p16, 2.4.6-p14, 2.4.7-p9, and the 2.4.8-p4 release lines, Valkey is required when you override the default cache configuration.

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

For examples:
   
```yaml
cache:
  type: valkey:8.0
```

Actual default and supported service versions depend on your Adobe Commerce version and Cloud template. See [Configure services](services-yaml.md#service-versions) for more information.

### Configure the service relationship

In `.magento.app.yaml`, configure the relationship between the application and the Valkey service:

```yaml
relationships:
  valkey: "cache:valkey"
```

The relationship key, valkey, is the name used by the application to access the service. The value, cache:valkey, references the service ID and service type defined in .magento/services.yaml.

### Configure the Valkey backend

In `.magento.env.yaml`, configure the Valkey backend appropriate for your Adobe Commerce version.

For Adobe Commerce 2.4.8 and earlier versions that support Valkey, use the remote-synchronized cache backend:

```yaml
stage:
  deploy:
    VALKEY_USE_SLAVE_CONNECTION: true
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
>Before enabling this setting, verify that the environment provides a replica relationship. Use the relationship inspection command described in [Verify the service relationship](services-yaml.md#service-relationships).

The `VALKEY_USE_SLAVE_CONNECTION` variable is supported only on Pro Staging and Production cluster environments that provide a read-only Valkey replica. It is not supported on Starter projects or Integration environments.

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

The `MAGENTO_CLOUD_RELATIONSHIPS` environment variable contains base64-encoded JSON with connection information for the services configured in the environment.

Use SSH to connect to the remote Cloud environment, then run:

```terminal
echo $MAGENTO_CLOUD_RELATIONSHIPS | base64 -d | json_pp
```

The command displays the complete decoded JSON object. The output can contain multiple relationships, such as database, opensearch, and valkey.

### Example output

The following is an abbreviated example that shows the valkey relationship. The actual output from your environment may contain additional service relationships and different generated values.

```terminal
echo "$MAGENTO_CLOUD_RELATIONSHIPS" | base64 -d | json_pp
```

The output varies by environment and service configuration, but if the configuration updates applied correctly, the output includses the `valkey` array.

```terminal
[
  {
    "host": "valkey.internal",
    "port": 6379,
    "path": null,
    "scheme": "valkey"
  }
]

## Using the Valkey CLI

Assuming the Valkey relationship is named `valkey` and the service host is `valkey.internal`, use the valkey-cli tool to connect to Valkey:

```terminal
valkey-cli -h valkey.internal
```
The actual host and port are environment-specific. Use the values returned by MAGENTO_CLOUD_RELATIONSHIPS rather than hard-coding values from the documentation example.

### Get the installed Valkey version

>[!BEGINTABS]

>[!TAB Integration environment]

On an Integration environment, run:

```terminal
valkey-cli -h valkey.internal info | grep version
```
**Example response**

```terminal
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

Valkey server v=8.0.1 ...

The version and build details may differ by environment. Treat the displayed version as the authoritative version for the environment where you run the command.
