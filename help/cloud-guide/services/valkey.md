---
title: Set up Valkey service
description: Learn how to set up and optimize Valkey as a backend cache solution for Adobe Commerce on cloud infrastructure.
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
topic_v2:
  - id: b5ce8718-c3af-4fdb-a1a9-fca32f83a87c
    internal-label: Implementation
  - id: c1579802-ddd4-4214-8a91-97b2066abe11
    internal-label: Troubleshooting
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
---
# Set up Valkey service

[Valkey](https://valkey.io) is an optional backend cache solution for Adobe Commerce on cloud infrastructure. Valkey is required when you override the default cache configuration on Adobe Commerce 2.4.9 and later, or on patch releases later than 2.4.5-p16, 2.4.6-p14, 2.4.7-p9, and 2.4.8-p4.

{{service-instruction}}

## Configure Valkey

To replace Redis with Valkey, update the following files:

- `.magento/services.yaml`
- `.magento.app.yaml`

### Configure the service

In `.magento/services.yaml`, replace the Redis service definition with a Valkey service definition. Replace <version> with a Valkey version supported by your Adobe Commerce version and current Cloud template.

```yaml
cache:
  type: valkey:<version>
```

**Example**

```yaml
cache:
  type: valkey:8.0
```

The example version is not universal. Actual default and supported service versions depend on your Adobe Commerce version and current Cloud template. Use the version specified by the current project template. See [Configure services](services-yaml.md#service-versions) for more information.

>[!WARNING]
>
>If you change the service ID, the existing service is removed and a new service is created. Existing data in the removed service is permanently deleted. Back up the environment before renaming a service.

Do not assume that cache and session data carry over when you change the `type` value from `redis:<version>` to `valkey:<version>`, even when you keep the same service ID. Treat the migration as creating a fresh cache: existing cache and session data is not guaranteed to be preserved, and users may be logged out after the migration completes.

### Configure the service relationship

In `.magento.app.yaml`, configure the relationship between the application and the Valkey service:

```yaml
relationships:
  valkey: "cache:valkey"
```

The relationship key, `valkey`, is the name used by the application to access the service. The value, `cache:valkey`, references the service ID and service type defined in `.magento/services.yaml`.

>[!TIP]
>
>Adobe Commerce communicates with Valkey through the `credis` client library, which works over plain PHP sockets by default. To improve performance, enable the `redis` PHP extension in `.magento.app.yaml`. `credis` uses the compiled extension automatically when it is available.
>
>```yaml
>runtime:
>  extensions:
>    - redis
>```

### Commit and deploy the changes

Add, commit, and push the configuration changes:

```terminal
git add .magento/services.yaml .magento.app.yaml
git commit -m "Enable Valkey service"
git push origin <branch-name>
```

After the deployment completes, verify that the Valkey service relationship is available.

{{service-change-tip}}

{{valkey-newrelic}}

## Customize the Valkey configuration

For cache, session, L2, and replica-connection recommendations, see [Best practices for Valkey and Redis service configuration](https://experienceleague.adobe.com/en/docs/commerce-operations/implementation-playbook/best-practices/planning/redis-valkey-service-configuration) in the _Implementation Playbook Best Practices Guide_.

## Verify the service relationship

After deploying the configuration, run the following command from an application container to display the decoded `MAGENTO_CLOUD_RELATIONSHIPS` object:

Use SSH to connect to the remote Cloud environment, then run:

```terminal
echo "$MAGENTO_CLOUD_RELATIONSHIPS" | base64 -d | json_pp
```

The command displays all configured service relationships. Locate the valkey relationship to identify the Valkey connection details.

**Example output**

The following abbreviated example shows the `valkey` relationship. It is not a universal schema.

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

For more information about service relationships, see [Configure services](services-yaml.md).

## Using the Valkey CLI

Assuming your Valkey relationship is named `valkey`, use the host and port returned by `MAGENTO_CLOUD_RELATIONSHIPS` to connect to Valkey:

```terminal
valkey-cli -h <host> -p <port>
```

**Example**

```terminal
valkey-cli -h valkey.internal -p 6379
```

## Get the installed Valkey version

>[!BEGINTABS]

>[!TAB Integration environment]

On an Integration environment, use the host and port returned by the `valkey` relationship to run:

```terminal
valkey-cli -h <host> -p <port> info | grep version
```

**Example response**

```text
valkey_version:<installed-version>
gcc_version:<gcc-version>
```

The version and build details vary by environment. Do not treat a displayed example version as a required or universal service version.

>[!TAB Pro Staging and Production]

On Pro Staging and Production environments, run:

```terminal
valkey-server -v
```

**Example response**

```text
Valkey server v=<installed-version> ...
```

The version and build details vary by environment. Do not treat a displayed example version as a required or universal service version.

>[!ENDTABS]

## Troubleshooting Valkey

### Cache-clean errors reference Redis on a Valkey-configured cache

A pre-deploy cache-clean failure can display error code `[107]` (`clean-redis-cache`) and a `Connection to Redis` message even when the `cache` service is configured as Valkey. `ece-tools` uses this legacy Redis-oriented error code and message for the cache-clean step regardless of which service backs the `cache` relationship, so the wording does not indicate that Redis is installed.

If the underlying error is a DNS failure, such as `Name or service not known` for the relationship host, the deploy step ran before the service relationship was available, or the relationship name in `.magento.app.yaml` does not match the service ID in `.magento/services.yaml`. See [Verify the service relationship](#verify-the-service-relationship).
