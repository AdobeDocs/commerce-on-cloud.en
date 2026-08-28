---
title: Set up Redis service
description: Learn how to set up and optimize Redis as a backend cache solution for Adobe Commerce on cloud infrastructure.
feature: Cloud, Cache, Services
exl-id: be6f2462-0878-47e3-b906-ebdd4aa319f2
TQID: https://experienceleague.adobe.com/Q3w1Y1sRuQSwqmbxGfEBavrvHe0ecI9qWJjsfVc2yPU
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
topic_v2:
  - id: b5ce8718-c3af-4fdb-a1a9-fca32f83a87c
    internal-label: Implementation
  - id: c1579802-ddd4-4214-8a91-97b2066abe11
    internal-label: Troubleshooting
---
# Set up Redis service

[Redis](https://redis.io) is an optional, backend cache solution that replaces the `Zend Framework Zend_Cache_Backend_File`, which Adobe Commerce uses by default.

>[!IMPORTANT]
>
>Redis cache is not supported for Adobe Commerce 2.4.9 or patch releases later than 2.4.5-p16, 2.4.6-p14, 2.4.7-p9, and 2.4.8-p4. Use [Valkey](valkey.md) for cache configuration where Redis is not supported. See [System Requirements](https://experienceleague.adobe.com/en/docs/commerce-operations/installation-guide/system-requirements) for supported cache services by release.

{{service-instruction}}

## Enable Redis

To enable Redis, update the following files:

- `.magento/services.yaml`
- `.magento.app.yaml`

### Configure the service

In `.magento/services.yaml`, add the Redis service definition. Replace `<version>` with a Redis version supported by your Adobe Commerce version and current Cloud template.

```yaml
cache:
  type: redis:<version>
```

For example, for a Commerce release and Cloud template that support Redis 7.2:

```yaml
cache:
  type: redis:7.2
```

The example version is not universal. Actual default and supported service versions depend on your Adobe Commerce version, patch level, and current Cloud template. Verify the supported combination in [System Requirements](https://experienceleague.adobe.com/en/docs/commerce-operations/installation-guide/system-requirements) and the current project template.

### Configure the service relationship

In `.magento.app.yaml`, configure the relationship between the application and the Redis service:

```yaml
runtime:
  extensions:
    - redis

relationships:
  redis: "cache:redis"
```

The relationship key, `redis`, is the name used by the application to access the service. The value, `cache:redis`, consists of the service ID (`cache`) and service type (`redis`) defined in `.magento/services.yaml`.

### Commit and deploy the changes

Add, commit, and push the configuration changes:

```terminal
git add .magento/services.yaml .magento.app.yaml
git commit -m "Enable Redis service"
git push origin <branch-name>
```

After the deployment completes, verify that the Redis service relationship is available.

{{service-change-tip}}

## Verify the service relationship

After deploying the configuration, run the following command from an application container to display the decoded `MAGENTO_CLOUD_RELATIONSHIPS` object:

Use SSH to connect to the remote Cloud environment, then run:

```terminal
echo "$MAGENTO_CLOUD_RELATIONSHIPS" | base64 -d | json_pp
```

The command displays all configured service relationships. Locate the `redis` relationship to identify the Redis connection details.

The following abbreviated example shows the `redis` relationship. It is not a universal schema.

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
   "redis" : [
      {
         "host" : "redis.internal",
         "port" : 6379,
         "path" : null,
         "scheme" : "redis"
      }
   ]
}
```

The output varies by environment and service configuration. Do not hard-code hostnames, ports, IP addresses, cluster names, service versions, usernames, or passwords from this example. Use the values returned by `MAGENTO_CLOUD_RELATIONSHIPS` in the target environment.

If `jq` is available, use the following command to display only the Redis relationship:

```terminal
printf '%s' "$MAGENTO_CLOUD_RELATIONSHIPS" \
  | base64 -d \
  | jq '{redis: .redis}'
```

For more information about service relationships, see [Configure services](services-yaml.md).

## Customize the Redis configuration

For cache, session, L2, and replica-connection recommendations, see [Best practices for Valkey and Redis service configuration](https://experienceleague.adobe.com/en/docs/commerce-operations/implementation-playbook/best-practices/planning/redis-valkey-service-configuration) in the _Implementation Playbook Best Practices Guide_.

## Using the Redis CLI

Assuming your Redis relationship is named `redis`, use the host and port returned by `MAGENTO_CLOUD_RELATIONSHIPS` to connect to Redis.

Connect to the environment with Redis installed and configured, and run the following command:

```terminal
redis-cli -h <host> -p <port>
```

**Example**

```terminal
redis-cli -h redis.internal -p 6379
```

## Get the installed Redis version

>[!BEGINTABS]

>[!TAB Integration environment]

On an Integration environment, use the host and port returned by the `redis` relationship to run:

```terminal
redis-cli -h <host> -p <port> info | grep version
```

**Example response**

```text
redis_version:<installed-version>
gcc_version:<installed-version>
```

The version and build details vary by environment. Do not treat a displayed example version as a required or universal service version.

>[!TAB Pro Staging and Production]

On Pro Staging and Production environments, run:

```terminal
redis-server -v
```

**Example response**

```text
Redis server v=<installed-version> ...
```

The version and build details vary by environment. Do not treat a displayed example version as a required or universal service version.

## Troubleshooting Redis

See the following Adobe Commerce Support articles for help with troubleshooting Redis problems:

- [Managed alerts on Adobe Commerce: Redis memory warning alert](https://experienceleague.adobe.com/en/docs/commerce-operations/tools/managed-alerts-for-adobe-commerce/managed-alerts-on-magento-commerce-redis-memory-warning-alert)
- [Managed alerts on Adobe Commerce: Redis memory critical alert](https://experienceleague.adobe.com/en/docs/commerce-operations/tools/managed-alerts-for-adobe-commerce/managed-alerts-on-magento-commerce-redis-memory-critical-alert)
