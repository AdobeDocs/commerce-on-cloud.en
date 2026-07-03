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

[Redis](https://redis.io) is an optional, backend cache solution that replaces the Zend Framework Zend_Cache_Backend_File, which Adobe Commerce uses by default.

>[!IMPORTANT]
>
>Redis cache is not supported for Adobe Commerce 2.4.9, or patch releases later than 2.4.5-p16, 2.4.6-p14, 2.4.7-p9, and through 2.4.8-p5 release lines. Use Valkey for cache configuration where Redis is not supported. See [System Requirements](https://experienceleague.adobe.com/en/docs/commerce-operations/installation-guide/system-requirements) for supported cache services by release.

{{service-instruction}}

**To enable Redis**:

1. Add the required name and type to the `.magento/services.yaml` file.

   ```yaml
   myredis:
       type: redis:<version>
   ```

   To provide your own Redis configuration, add a `core_config` key in your `.magento/services.yaml` file:

   ```yaml
   cache:
       type: redis:<version>
   ```

1. Configure the relationships in the `.magento.app.yaml` file.

   ```yaml
   runtime:
       extensions:
           - redis

   relationships:
       redis: "redis:redis"
   ```

1. Add, commit, and push your code changes.

   ```bash
   git add .magento/services.yaml .magento.app.yaml && git commit -m "Enable redis service" && git push origin <branch-name>
   ```

1. [Verify the service relationships](services-yaml.md#service-relationships).

{{service-change-tip}}

## Customize the Redis configuration

For details on customizing the Redis configuration, see [Configure Redis](https://experienceleague.adobe.com/en/docs/commerce-operations/implementation-playbook/best-practices/planning/redis-valkey-service-configuration) in the _Implementation Playbook Best Practices Guide_.

## Using the Redis CLI

Assuming your Redis relationship is named `redis`, you can access it using the `redis-cli` tool.

1. Use SSH to connect to the integration environment with Redis installed and configured.

1. Open an SSH tunnel to a host.

   ```bash
   redis-cli -h redis.internal
   ```

## Get installed Redis version

Use the following command to get the Redis version installed on an integration environment:

```bash
redis-cli -h redis.internal info | grep version
```

Sample response:

```
redis_version:7.0.5
gcc_version:8.3.0
```

### Redis on Pro staging and production

To get the Redis version installed on a Staging or Production environment, use the `redis-server` command:

```bash
redis-server -v
```

```
Redis server v=7.0.5 ...
```

Use the following command to get the Redis configuration installed on a Pro Staging or Production environment:

```bash
echo $MAGENTO_CLOUD_RELATIONSHIPS | base64 -d | json_pp
```

Sample response:

```json
"redis" : [
    {
        "cluster" : "project-master-123abc4",
        "fragment" : null,
        "host" : "redis.internal",
        "host_mapped" : false,
        "hostname" : "oblahblahblahblahe.redis.service._.magentosite.cloud",
        "ip" : "169.254.10.10",
        "password" : null,
        "path" : null,
        "port" : 6379,
        "public" : false,
        "query" : {},
        "rel" : "redis",
        "scheme" : "redis",
        "service" : "redis",
        "type" : "redis:7.0.5",
        "username" : null
    }
]
```

## Troubleshooting Redis

See the following Adobe Commerce Support articles for help with troubleshooting Redis problems:

- [Redis issue delay Admin login or checkout](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/troubleshooting/miscellaneous/redis-issue-delay-magento-admin-login-or-checkout.html)
- [Extended Redis cache implementation Adobe Commerce 2.3.5+](https://experienceleague.adobe.com/docs/commerce-operations/implementation-playbook/best-practices/planning/redis-service-configuration.html)
- [Managed alerts on Adobe Commerce: Redis memory warning alert](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/support-tools/managed-alerts/managed-alerts-on-magento-commerce-redis-memory-warning-alert.html)
- [Managed alerts on Adobe Commerce: Redis memory critical alert](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/support-tools/managed-alerts/managed-alerts-on-magento-commerce-redis-memory-critical-alert.html)
