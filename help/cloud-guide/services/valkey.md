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

[Valkey](https://valkey.io) is an optional, backend cache solution that replaces the `Zend Framework Zend_Cache_Backend_File`, which Adobe Commerce uses by default.

See [Configure Valkey](https://experienceleague.adobe.com/en/docs/commerce-operations/implementation-playbook/best-practices/planning/redis-valkey-service-configuration){target="_blank"} in the _Configuration guide_.

{{service-instruction}}

**To replace Redis with Valkey, update the configuration in the following three files**:

1. Replace the Redis configuration with the required Valkey name and type in the `.magento/services.yaml` file.

   ```yaml
   cache:
       type: valkey:<version>
   ```

   To provide your own Valkey configuration, add a `core_config` key in your `.magento/services.yaml` file:

   ```yaml
   cache:
       type: valkey:8.0
   ```

1. Configure the relationships in the `.magento.app.yaml` file.

   ```yaml
   relationships:
       valkey: "cache:valkey"
   ```

1. Configure `.magento.env.yaml` to replace the Redis configuration as follows:.
   
   ```yaml
    stage:
        deploy:
        VALKEY_USE_SLAVE_CONNECTION: true
        VALKEY_BACKEND: '\Magento\Framework\Cache\Backend\RemoteSynchronizedCache'
   ```

1. Add, commit, and push your code changes.

   ```bash
   git add .magento/services.yaml .magento.app.yaml .magento.env.yaml && git commit -m "Enable valkey service" && git push origin <branch-name>
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

Response:

```
valkey_version:8.0.1
gcc_version:12.2.0
```

### Valkey on Pro staging and production

To get the Valkey version installed on a Staging or Production environment, use the `valkey-server` command:

```bash
valkey-server -v
```

```bash
Valkey server v=8.0.1 ...
```

Use the following command to get the Valkey configuration installed on a Pro Staging or Production environment:

```bash
echo $MAGENTO_CLOUD_RELATIONSHIPS | base64 -d | json_pp
```

Response:

```json
"valkey" : [
    {
        "cluster" : "project-master-abc0003",
        "epoch" : 0,
        "fragment" : null,
        "host" : "valkeycache.internal",
        "host_mapped" : false,
        "hostname" : "oblahblahblahblahe.cache.service._.magentosite.cloud",
        "instance_ips" : [
        "123.456.789.012"
        ],
        "ip" : "123.456.789.012",
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
