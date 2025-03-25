---
title: Set up Redis service
description: Learn how to set up and optimize Redis as a backend cache solution for Adobe Commerce on cloud infrastructure.
feature: Cloud, Cache, Services
exl-id: be6f2462-0878-47e3-b906-ebdd4aa319f2
---
# Set up Redis service

[Valkey](https://valkey.io) is an optional, backend cache solution that replaces the Zend Framework Zend_Cache_Backend_File, which Adobe Commerce uses by default.

See [Configure Valkey](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cache/valkey/config-valkey.html) in the _Configuration guide_.

{{service-instruction}}

**To enable Valkey**:

1. Add the required name and type to the `.magento/services.yaml` file.

   ```yaml
   cache:
       type: valkey:<version>
   ```

   To provide your own Valkey configuration, add a `core_config` key in your `.magento/services.yaml` file:

   ```yaml
   cache:
       type: valkey:<version>
   ```

1. Configure the relationships in the `.magento.app.yaml` file.

   ```yaml

   relationships:
       valkeycache: "cache:valkey"
   ```

1. Add, commit, and push your code changes.

   ```bash
   git add .magento/services.yaml .magento.app.yaml && git commit -m "Enable valkey service" && git push origin <branch-name>
   ```

1. [Verify the service relationships](services-yaml.md#service-relationships).

{{service-change-tip}}

## Using the Valkey CLI

Assuming your Valkey relationship is named `valkey`, you can access it using the `valkey-cli` tool.

1. Use SSH to connect to the integration environment with Valkey installed and configured.

1. Open an SSH tunnel to a host.

   ```bash
   valkey-cli -h valkey.internal
   ```

## Get installed Valkey version

Use the following command to get the Valkey version installed on an integration environment:

```bash
valkey-cli -h valkey.internal info | grep version
```

Sample response:

```
valkey_version:7.0.5
gcc_version:8.3.0
```

### Valkey on Pro staging and production

To get the Valkey version installed on a Staging or Production environment, use the `valkey-server` command:

```bash
valkey-server -v
```

```
Valkey server v=7.0.5 ...
```

Use the following command to get the Valkey configuration installed on a Pro Staging or Production environment:

```bash
echo $MAGENTO_CLOUD_RELATIONSHIPS | base64 -d | json_pp
```

Sample response:

```json
"valkeycache" : [
    {
        "cluster" : "ram4yord7vqs6-dev-54ta5gq",
        "epoch" : 0,
        "fragment" : null,
        "host" : "valkeycache.internal",
        "host_mapped" : false,
        "hostname" : "msmntiftwxp3ctdesyp3qeypgq.cache.service._.magentosite.cloud",
        "instance_ips" : [
        "246.158.240.103"
        ],
        "ip" : "169.254.135.174",
        "password" : null,
        "path" : null,
        "port" : 6379,
        "public" : false,
        "query" : {},
        "rel" : "valkey",
        "scheme" : "valkey",
        "service" : "cache",
        "type" : "valkey:8.0",
        "username" : null
    }
]
```

## Troubleshooting Valkey

See the following Adobe Commerce Support articles for help with troubleshooting Valkey problems:

- [Valkey issue delay Admin login or checkout](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/troubleshooting/miscellaneous/redis-issue-delay-magento-admin-login-or-checkout.html)
- [Extended Valkey cache implementation Adobe Commerce 2.3.5+](https://experienceleague.adobe.com/docs/commerce-operations/implementation-playbook/best-practices/planning/redis-service-configuration.html)
- [Managed alerts on Adobe Commerce: Valkey memory warning alert](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/support-tools/managed-alerts/managed-alerts-on-magento-commerce-redis-memory-warning-alert.html)
- [Managed alerts on Adobe Commerce: Valkey memory critical alert](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/support-tools/managed-alerts/managed-alerts-on-magento-commerce-redis-memory-critical-alert.html)
