---
title: Set up Valkey service
description: Learn how to set up and optimize Valkey as a backend cache solution for Adobe Commerce on Cloud Infrastructure.
feature: Cloud, Cache, Services
---
# Set up Valkey service

[Valkey](https://valkey.io) is an optional, backend cache solution that replaces the `Zend Framework Zend_Cache_Backend_File`, which Adobe Commerce uses by default.

See [Configure Valkey](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cache/valkey/config-valkey.html) {target="_blank"} in the _Configuration guide_.

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
       type: valkey:8.0
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
   valkey-cli -h valkeycache.internal
   ```

## Get installed Valkey version

Use the following command to get the Valkey version installed on an integration environment:

  ```bash
  valkey-cli -h valkeycache.internal info | grep version
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
"valkeycache" : [
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
