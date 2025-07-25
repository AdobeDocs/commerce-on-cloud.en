---
title: Deploy variables
description: See the list of environment variables that control actions in the Adobe Commerce on cloud infrastructure deploy phase.
feature: Cloud, Configuration, Cache, Deploy, SCD, Storage, Search
recommendations: noDisplay, catalog
role: Developer
exl-id: 980ec809-8c68-450a-9db5-29c5674daa16
---
# Deploy variables

The following _deploy_ variables control actions in the deploy phase and can inherit and override values from the [Global variables](variables-global.md). Insert these variables in the `deploy` stage of the `.magento.env.yaml` file:

```yaml
stage:
  deploy:
    DEPLOY_VARIABLE_NAME: value
```

For more information about customizing the build and deploy process:

- [Deployment configuration](configure-env-yaml.md)
- [Deployment process](../deploy/process.md)

## `CACHE_CONFIGURATION`

-  **Default**—_Not set_
-  **Version**—Adobe Commerce 2.1.4 and later

Configure Redis page and default caching. When setting the `cm_cache_backend_redis` parameter, you must specify the `server`, `port`, and `database` options.

```yaml
stage:
  deploy:
    CACHE_CONFIGURATION:
      frontend:
        default:
          backend: file
        page_cache:
          backend: file
```

{{merge-options}}

The following example merges new values to an existing configuration:

```yaml
stage:
  deploy:
    CACHE_CONFIGURATION:
      _merge: true
      frontend:
        default:
          backend_options:
            database: 10
        page_cache:
          backend_options:
            database: 11
```

The following example uses the [Redis preload feature](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cache/redis/redis-pg-cache.html#redis-preload-feature) as defined in the _Configuration guide_:

```yaml
stage:
  deploy:
    CACHE_CONFIGURATION:
      _merge: true
      frontend:
        default:
          id_prefix: '061_'
          backend_options:
            preload_keys:
              - '061_EAV_ENTITY_TYPES:hash'
              - '061_GLOBAL_PLUGIN_LIST:hash'
              - '061_DB_IS_UP_TO_DATE:hash'
              - '061_SYSTEM_DEFAULT:hash'
```

To use a custom [REDIS_BACKEND](#redis_backend) model (not only from the allowed list), set the `_custom_redis_backend` option  to `true` to enable the correct validation as in the following example:

```yaml
stage:
  deploy:
    CACHE_CONFIGURATION:
      frontend:
        default:
          _custom_redis_backend: true
          backend: '\CustomRedisModel'
```

## `CLEAN_STATIC_FILES`

-  **Default**—`true`
-  **Version**—Adobe Commerce 2.1.4 and later

Enables or disables cleaning [static content files](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cli/static-view/static-view-file-deployment.html) generated during the build or deploy phase. Use the default value _true_ in development as a best practice.

-  **`true`**—Removes all existing static content before deploying the updated static content.
-  **`false`**—The deployment only overwrites existing static content files if the generated content contains a newer version.

If you modify static content through a separate process, set the value to _false_.

```yaml
stage:
  deploy:
    CLEAN_STATIC_FILES: false
```

Failure to clean static view files before deploying can cause problems if you deploy updates to existing files without removing the previous versions. Because of [static file fallback](https://developer.adobe.com/commerce/frontend-core/guide/caching/#clean-static-files-cache) rules, fallback operations can display the wrong file if the directory contains multiple versions of the same file.

## `CRON_CONSUMERS_RUNNER`

-  **Default**—`cron_run = false`, `max_messages = 1000`
-  **Version**—Adobe Commerce 2.2.0 and later

Use this environment variable to confirm that message queues are running after a deployment.

-  `cron_run`—A boolean value that enables or disables the `consumers_runner` cron job (default = `false`).
-  `max_messages`—A number specifying the maximum number of messages each consumer must process before terminating (default = `1000`). You can set the value to `0` to prevent the consumer from terminating.
-  `consumers`—An array of strings specifying which consumers to run. An empty array runs _all_ consumers.

-  `multiple_processes`-A number specifying the number of processes to spawn for each consumer. Supported in Commerce **2.4.4** or greater.

>[!NOTE]
>
>To return a list of message queue `consumers`, run the `./bin/magento queue:consumers:list` command in the remote environment.

Example array that runs specific `consumers` and the `multiple_processes` to spawn for each consumer:

```yaml
stage:
  deploy:
    CRON_CONSUMERS_RUNNER:
      cron_run: true
      max_messages: 1000
      consumers:
        - example_consumer_1
        - example_consumer_2
-     multiple_processes:
        example_consumer_1: 4
        example_consumer_2: 3
```

Example of an empty array that runs all `consumers`:

```yaml
stage:
  deploy:
    CRON_CONSUMERS_RUNNER:
      cron_run: true
      max_messages: 1000
      consumers: []
```

By default, the deployment process overwrites all settings in the `env.php` file. See [Manage message queues](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/message-queues/manage-message-queues.html) in the _Commerce Configuration Guide_ for on-premises Adobe Commerce.

## `CONSUMERS_WAIT_FOR_MAX_MESSAGES`

-  **Default**—`false`
-  **Version**—Adobe Commerce 2.2.0 and later

Configure how `consumers` process messages from the message queue by choosing one of the following options:

-  `false`—`Consumers` process available messages in the queue, close the TCP connection, and terminate. `Consumers` do not wait for additional messages to enter the queue, even if the number of processed messages is less than the `max_messages` value specified in the `CRON_CONSUMERS_RUNNER` deploy variable.

-  `true`—`Consumers` continue to process messages from the message queue until reaching the maximum number of messages (`max_messages`) specified in the `CRON_CONSUMERS_RUNNER` deploy variable before closing the TCP connection and terminating the consumer process. If the queue empties before reaching `max_messages`, the consumer waits for more messages to arrive.

>[!WARNING]
>
>If you use workers to run `consumers` instead of using a cron job, set this variable to true.

```yaml
stage:
  deploy:
    CONSUMERS_WAIT_FOR_MAX_MESSAGES: false
```

## `CRYPT_KEY`

-  **Default**—_Not set_
-  **Version**—Adobe Commerce 2.1.4 and later

>[!WARNING]
>
>Set the `CRYPT_KEY` value through the [!DNL Cloud Console] instead of the `.magento.env.yaml` file to avoid exposing the key in the source code repository for your environment. See [Set environment and project variables](https://experienceleague.adobe.com/docs/commerce-on-cloud/user-guide/project/overview.html#configure-environment).

When you move the database from one environment to another without an installation process, you need the corresponding cryptographic information. Adobe Commerce uses the encryption key value set in the [!DNL Cloud Console] as the `crypt/key` value in the `env.php` file.

## `DATABASE_CONFIGURATION`

-  **Default**—_Not set_
-  **Version**—Adobe Commerce 2.1.4 and later

If you defined a database in the [relationships property](../application/properties.md#relationships) of the `.magento.app.yaml` file, you can customize your database connections for deployment.

```yaml
stage:
  deploy:
    DATABASE_CONFIGURATION:
      some_config: 'some_value'
```

{{merge-options}}

The following example merges new values to an existing configuration:

```yaml
stage:
  deploy:
    DATABASE_CONFIGURATION:
      some_config: 'some_new_value'
      _merge: true
```

Also, you can configure a table prefix.

>[!WARNING]
>
>If you do not use the merge option with the table prefix, you must provide default connection settings or the deploy fails validation.

The following example uses the `ece_` table prefix with default connection settings instead of using the `_merge` option:

```yaml
stage:
  deploy:
    DATABASE_CONFIGURATION:
      connection:
        default:
          username: user
          host: host
          dbname: magento
          password: password
      table_prefix: 'ece_'
```

Sample output:

```
MariaDB [main]> SHOW TABLES;
+-------------------------------------+
| Tables_in_main                      |
+-------------------------------------+
| ece_admin_passwords                 |
| ece_admin_system_messages           |
| ece_admin_user                      |
| ece_admin_user_session              |
| ece_adminnotification_inbox         |
| ece_amazon_customer                 |
| ece_authorization_rule              |
| ece_cache                           |
| ece_cache_tag                       |
| ece_captcha_log                     |
...
```

## `ELASTICSUITE_CONFIGURATION`

-  **Default**—_Not set_
-  **Version**—Adobe Commerce 2.2.0 and later

Retains customized [!DNL Elastic Suite] service settings between deployments and uses it in the 'system/default/smile_elasticsuite_core_base_settings' section of the main [!DNL Elastic Suite] configuration. If the [!DNL Elastic Suite] composer package is installed, it is configured automatically.

```yaml
stage:
  deploy:
    ELASTICSUITE_CONFIGURATION:
      es_client:
        servers: 'remote-host:9200'
      indices_settings:
        number_of_shards: 1
        number_of_replicas: 0
```

>[!NOTE]
>
>On a Pro Staging/Production cluster that has three nodes (or three service nodes on [Scaled Architecture](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/architecture/scaled-architecture#service-tier), the `indices_settings` should be set as follows:
>
>```yaml
>      indices_settings:
>        number_of_shards: 3
>        number_of_replicas: 2
>```

{{merge-options}}

The following example merges a new value to the existing configuration:

```yaml
stage:
  deploy:
    ELASTICSUITE_CONFIGURATION:
      indices_settings:
        number_of_shards: 3
        number_of_replicas: 2
      _merge: true
```

**Known limitations**:

-  Changing the search engine to any type other than `elasticsuite` causes a deploy failure accompanied by an appropriate validation error
-  Removing the Elasticsearch service causes a deploy failure accompanied by an appropriate validation error

>[!NOTE]
>
>For details on using or troubleshooting the [!DNL Elastic Suite] plugin with Adobe Commerce, see the [[!DNL Elastic Suite] documentation](https://github.com/Smile-SA/elasticsuite).

## `ENABLE_GOOGLE_ANALYTICS`

-  **Default**—`false`
-  **Version**—Adobe Commerce 2.1.4 and later

Enables and disables Google Analytics when deploying to Staging and Integration environments. By default, Google Analytics is true only for the Production environment. Set this value to `true` to enable Google Analytics in the Staging and Integration environments.

-  **`true`**—Enables Google Analytics on Staging and Integration environments.
-  **`false`**—Disables Google Analytics on Staging and Integration environments.

Add the `ENABLE_GOOGLE_ANALYTICS` environment variable to the `deploy` stage in the `.magento.env.yaml` file:

```yaml
stage:
  deploy:
    ENABLE_GOOGLE_ANALYTICS: true
```

>[!NOTE]
>
>The deploy process always enables Google Analytics on Production environments.

## `FORCE_UPDATE_URLS`

-  **Default**—`true`
-  **Version**—Adobe Commerce 2.1.4 and later

On deployment to Pro or Starter Staging and Production environments, this variable replaces Adobe Commerce base URLs in the database with the project URLs specified by the [`MAGENTO_CLOUD_ROUTES`](variables-cloud.md) variable. Use this setting to override the default behavior of the [UPDATE_URLS](#update_urls) deploy variable, which is ignored when deploying to Staging or Production environments.

```yaml
stage:
  deploy:
    FORCE_UPDATE_URLS: true
```

## `LOCK_PROVIDER`

-  **Default**—`file`
-  **Version**—Adobe Commerce 2.2.5 and later

The lock provider prevents the launch of duplicate cron jobs and cron groups. Use the `file` lock provider in the Production environment. Starter environments and the Pro integration environment do not use the [MAGENTO_CLOUD_LOCKS_DIR](variables-cloud.md) variable, so `ece-tools` applies the `db` lock provider automatically.

```yaml
stage:
  deploy:
    LOCK_PROVIDER: "db"
```

See [Configure the lock](https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/tutorials/lock-provider.html) in the _Install guide_.

## `MYSQL_USE_SLAVE_CONNECTION`

-  **Default**—`false`
-  **Version**—Adobe Commerce 2.1.4 and later

>[!TIP]
>
>The `MYSQL_USE_SLAVE_CONNECTION` variable is supported only on Adobe Commerce on cloud infrastructure Staging and Production Pro cluster environments and is not supported on Starter projects.

Adobe Commerce can read multiple databases asynchronously. Set to `true` to automatically use a _read-only_ connection to the database to receive read-only traffic on a non-master node. This connection improves performance through load balancing, because only one node handles read-write traffic. Set to `false` to remove any existing read-only connection array from the `env.php` file.

```yaml
stage:
  deploy:
    MYSQL_USE_SLAVE_CONNECTION: true
```

When the `MYSQL_USE_SLAVE_CONNECTION` variable is set to `true`, the `synchronous_replication` parameter is set to `true` by default in the `env.php` file on Pro Staging and Production environments. When the `MYSQL_USE_SLAVE_CONNECTION` is set to `false`, the `synchronous_replication` parameter is not configured.

## `QUEUE_CONFIGURATION`

-  **Default**—_Not set_
-  **Version**—Adobe Commerce 2.1.4 and later

Use this environment variable to retain customized AMQP service settings between deployments. For example, if you prefer using an existing message queue service instead of relying on the cloud infrastructure to create it for you, use the `QUEUE_CONFIGURATION` environment variable to connect it to your site:

```yaml
stage:
  deploy:
    QUEUE_CONFIGURATION:
      amqp:
        host: test.host
        port: 1234
      amqp2:
        host: test.host2
        port: 12345
      mq:
        host: mq.host
        port: 1234
```

{{merge-options}}

The following example merges new values to an existing configuration:

```yaml
stage:
  deploy:
    QUEUE_CONFIGURATION:
      _merge: true
      amqp:
        host: changed1.host
        port: 5672
      amqp2:
        host: changed2.host2
        port: 12345
      mq:
        host: changedmq.host
        port: 1234
```

## `REDIS_BACKEND`

-  **Default**—`Cm_Cache_Backend_Redis`
-  **Version**—Adobe Commerce 2.3.0 and later

Specifies the backend model configuration for the Redis cache.

Adobe Commerce version 2.3.0 and later includes the following backend models:

-  `Cm_Cache_Backend_Redis`
-  `\Magento\Framework\Cache\Backend\Redis`
-  `\Magento\Framework\Cache\Backend\RemoteSynchronizedCache`

The example how to set `REDIS_BACKEND`

```yaml
stage:
  deploy:
    REDIS_BACKEND: '\Magento\Framework\Cache\Backend\RemoteSynchronizedCache'
```

>[!NOTE]
>
>If you specify `\Magento\Framework\Cache\Backend\RemoteSynchronizedCache` as the Redis backend model to enable [L2 cache](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cache/level-two-cache.html), `ece-tools` generates the cache configuration automatically. See an example [configuration file](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cache/level-two-cache.html#configuration-example) in the _Adobe Commerce Configuration Guide_. To override the generated cache configuration, use the [CACHE_CONFIGURATION](#cache_configuration) deploy variable.

## `REDIS_USE_SLAVE_CONNECTION`

-  **Default**—`false`
-  **Version**—Adobe Commerce 2.1.16 and later

>[!WARNING]
>
>Do _not_ enable this variable on a [scaled architecture](../architecture/scaled-architecture.md) project. It causes Redis connection errors. Redis slaves are still active but are not used for Redis reads. As an alternative, Adobe recommends using Adobe Commerce 2.3.5 or later, implement a new Redis backend configuration, and implement L2 caching for Redis.

>[!TIP]
>
>The `REDIS_USE_SLAVE_CONNECTION` variable is supported only on Adobe Commerce on cloud infrastructure Staging and Production Pro cluster environments and is not supported on Starter projects.

Adobe Commerce can read multiple Redis instances asynchronously. Set to `true` to automatically use a _read-only_ connection to a Redis instance to receive read-only traffic on a non-master node. This connection improves performance through load balancing, because only one node handles read-write traffic. Set to `false` to remove any existing read-only connection array from the `env.php` file.

```yaml
stage:
  deploy:
    REDIS_USE_SLAVE_CONNECTION: true
```

You must have a Redis service configured in the `.magento.app.yaml` file and in the `services.yaml` file.

[ECE-Tools version 2002.0.18](../release-notes/cloud-release-archive.md#v2002018) and later uses more fault-tolerant settings. If Adobe Commerce cannot read data from the Redis _slave_ instance, then it reads data from the Redis _master_ instance.

The read-only connection is not available for use in the integration environment or if you use the [`CACHE_CONFIGURATION` variable](#cache_configuration).

## `VALKEY_BACKEND`

-  **Default**—`Cm_Cache_Backend_Redis`
-  **Version**—Adobe Commerce 2.8.0 and later

`VALKEY_BACKEND` specifies the backend model configuration for the Valkey cache.

Adobe Commerce version 2.8.0 and later includes the following backend models:

-  `Cm_Cache_Backend_Redis`
-  `\Magento\Framework\Cache\Backend\Redis`
-  `\Magento\Framework\Cache\Backend\RemoteSynchronizedCache`

The following example describes how to set `VALKEY_BACKEND`:

```yaml
stage:
  deploy:
  VALKEY_USE_SLAVE_CONNECTION: true
  VALKEY_BACKEND: '\Magento\Framework\Cache\Backend\RemoteSynchronizedCache'
```

>[!NOTE]
>
>If you specify `\Magento\Framework\Cache\Backend\RemoteSynchronizedCache` as the Valkey backend model to enable [L2 cache](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cache/level-two-cache.html), `ece-tools` generates the cache configuration automatically. See an example [configuration file](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cache/level-two-cache.html#configuration-example) in the _Adobe Commerce Configuration Guide_. To override the generated cache configuration, use the [CACHE_CONFIGURATION](#cache_configuration) deploy variable.

## `VALKEY_USE_SLAVE_CONNECTION`

-  **Default**—`false`
-  **Version**—Adobe Commerce 2.4.8 and later

>[!WARNING]
>
>Do _not_ enable this variable on a [scaled architecture](../architecture/scaled-architecture.md) project. It causes Valkey connection errors. Redis slaves are still active but are not used for Redis reads. Alternatively, Adobe recommends using Adobe Commerce 2.4.8 or later, implementing a new Valkey backend configuration, and implementing L2 caching for Valkey.

>[!TIP]
>
>The `VALKEY_USE_SLAVE_CONNECTION` variable is supported only on Adobe Commerce on cloud infrastructure Staging and Production Pro cluster environments and is not supported on Starter projects.

Adobe Commerce can read multiple Redis instances asynchronously. `VALKEY_USE_SLAVE_CONNECTION` Set to `true` to automatically use a _read-only_ connection to a Redis instance to receive read-only traffic on a non-master node. This connection improves performance through load balancing, because only one node handles read-write traffic. Set `VALKEY_USE_SLAVE_CONNECTION` to `false` to remove any existing read-only connection array from the `env.php` file.

```yaml
stage:
  deploy:
    VALKEY_USE_SLAVE_CONNECTION: true
```

You must have a Redis service configured in the `.magento.app.yaml` file and in the `services.yaml` file.

[ECE-Tools version 2002.0.18](../release-notes/cloud-release-archive.md#v2002018) and later uses more fault-tolerant settings. If Adobe Commerce cannot read data from the Valkey _slave_ instance, then it reads data from the Redis _master_ instance.

The read-only connection is not available for use in the integration environment or if you use the [`CACHE_CONFIGURATION` variable](#cache_configuration).

## `RESOURCE_CONFIGURATION`

-  **Default**—Not set
-  **Version**—Adobe Commerce 2.1.4 and later

Maps a resource name to a database connection. This configuration corresponds to the `resource` section of the `env.php` file.

{{merge-options}}

The following example merges new values to an existing configuration:

```yaml
stage:
  deploy:
    RESOURCE_CONFIGURATION:
      _merge: true
      default_setup:
        connection: default
```

## `SCD_COMPRESSION_LEVEL`

-  **Default**—`4`
-  **Version**—Adobe Commerce 2.1.4 and later

Specifies which [gzip](https://www.gnu.org/software/gzip) compression level (`0` to `9`) to use when compressing static content; `0` disables compression.

```yaml
stage:
  deploy:
    SCD_COMPRESSION_LEVEL: 5
```

## `SCD_COMPRESSION_TIMEOUT`

-  **Default**—`600`
-  **Version**—Adobe Commerce 2.1.4 and later

When the time it takes to compress the static assets exceeds the compression timeout limit, it interrupts the deployment process. Set the maximum execution time, in seconds, for the static content compression command.

```yaml
stage:
  deploy:
    SCD_COMPRESSION_TIMEOUT: 800
```

## `SCD_MATRIX`

-  **Default**—_Not set_
-  **Version**—Adobe Commerce 2.1.4 and later

You can configure multiple locales per theme. This customization speeds up the deployment process by reducing the number of unnecessary theme files. For example, you can deploy the _magento/backend_ theme in English and a custom theme in other languages.

The following example deploys the `Magento/backend` theme with three locales:

```yaml
stage:
  deploy:
    SCD_MATRIX:
      "magento/backend":
        language:
          - en_US
          - fr_FR
          - af_ZA
```

Also, you can choose to _not_ deploy a theme:

```yaml
stage:
  deploy:
    SCD_MATRIX:
      "magento/backend": [ ]
```

## `SCD_MAX_EXECUTION_TIME`

-  **Default**—_Not set_
-  **Version**—Adobe Commerce 2.2.0 and later

Allows you to increase the maximum expected execution time for static content deployment.

By default, Adobe Commerce sets the maximum expected execution to 900 seconds, but in some scenarios you might need more time to complete the static content deployment for a Cloud project.

```yaml
stage:
  deploy:
    SCD_MAX_EXECUTION_TIME: 3600
```

{{scd-timing-warning}}

## `SCD_NO_PARENT`

-  **Default**—`false`
-  **Version**—Adobe Commerce 2.4.2 and later

On the deploy phase, set `SCD_NO_PARENT: true` so that the generation of static content for parent themes does not occur during the deploy phase. This setting minimizes deployment time and prevents site downtime that can occur if the static content build fails during the deployment. See [Static content deployment](../deploy/static-content.md).

```yaml
stage:
  deploy:
    SCD_NO_PARENT: true
```

## `SCD_STRATEGY`

-  **Default**—`quick`
-  **Version**—Adobe Commerce 2.2.0 and later

Allows you to customize the [deployment strategy](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cli/static-view/static-view-file-strategy.html) for static content. See [Deploy static view files](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/cli/static-view/static-view-file-deployment.html).

Use these options _only_ if you have more than one locale:

-  `standard`—deploys all static view files for all packages.
-  `quick`—(_default_) minimizes deployment time.
-  `compact`—conserves disk space on the server. In Adobe Commerce version 2.2.4 and earlier, this setting overrides the value for `scd_threads` with a value of `1`.

```yaml
stage:
  deploy:
    SCD_STRATEGY: "compact"
```

## `SCD_THREADS`

-  **Default**—Automatic
-  **Version**—Adobe Commerce 2.1.4 and later

Sets the number of threads for static content deployment. The default value is set based on the detected CPU thread count and does not exceed a value of 4. Increasing the number of threads speeds up static content deployment; decreasing the number of threads slows it down. You can set the thread value, for example:

```yaml
stage:
  deploy:
    SCD_THREADS: 2
```

To further reduce deployment time, use [Configuration Management](../store/store-settings.md) with the `scd-dump` command to move static deployment into the build phase.

## `SEARCH_CONFIGURATION`

-  **Default**—_Not set_
-  **Version**—Adobe Commerce 2.1.4 and later

Use this environment variable to retain customized search service settings between deployments. For example:

Elasticsearch configuration:

```yaml
stage:
  deploy:
    SEARCH_CONFIGURATION:
      engine: elasticsearch
      elasticsearch_server_hostname: http://elasticsearch.internal
      elasticsearch_server_port: '9200'
      elasticsearch_index_prefix: magento2
      elasticsearch_server_timeout: '15'
```

OpenSearch configuration (for Commerce 2.4.6 and later):

```yaml
stage:
  deploy:
    SEARCH_CONFIGURATION:
      engine: opensearch
      opensearch_server_hostname: 'http://opensearch.internal'
      opensearch_server_port: '9200'
      opensearch_index_prefix: 'magento2'
      opensearch_server_timeout: '15'
```

{{merge-options}}

The following example merges a new value to the existing configuration:

```yaml
stage:
  deploy:
    SEARCH_CONFIGURATION:
      engine: elasticsearch
      elasticsearch_server_port: '9200'
      _merge: true
```

## `SESSION_CONFIGURATION`

-  **Default**—_Not set_
-  **Version**—Adobe Commerce 2.1.4 and later

Configure Redis session storage. Requires the `save`, `redis`, `host`, `port`, and `database` options for the session storage variable. For example:

```yaml
stage:
  deploy:
    SESSION_CONFIGURATION:
      redis:
        bot_first_lifetime: 100
        bot_lifetime: 10001
        database: 0
        disable_locking: 1
        host: redis.internal
        max_concurrency: 10
        max_lifetime: 10001
        min_lifetime: 100
        port: 6379
      save: redis
```

{{merge-options}}

The following example merges a new value to the existing configuration:

```yaml
stage:
  deploy:
    SESSION_CONFIGURATION:
      _merge: true
      redis:
        max_concurrency: 10
```

## `SKIP_SCD`

-  **Default**— _Not set_
-  **Version**—Adobe Commerce 2.1.4 and later

Set to `true` to skip static content deployment during the deploy phase.

On the deploy phase, set `SKIP_SCD: true` so that the static content build does not happen during the deploy phase. This setting minimizes deployment time and prevents site downtime that can occur if the static content build fails during the deployment. See [Static content deployment](../deploy/static-content.md).

```yaml
stage:
  deploy:
    SKIP_SCD: true
```

## `UPDATE_URLS`

-  **Default**—`true`
-  **Version**—Adobe Commerce 2.1.4 and later

On deployment, replace Adobe Commerce base URLs in the database with the project URLs specified by the [`MAGENTO_CLOUD_ROUTES`](variables-cloud.md) variable. This configuration is useful for local development, where base URLs are set up for your local environment. When you deploy to a Cloud environment, the URLs update so you can access your storefront and Admin using the project URLs.

If you must update URLs when deploying to Pro or Starter Staging and Production environments,  use the [`FORCE_UPDATE_URLS`](#force_update_urls) variable.

```yaml
stage:
  deploy:
    UPDATE_URLS: false
```

## `VERBOSE_COMMANDS`

-  **Default**—_Not set_
-  **Version**—Adobe Commerce 2.1.4 and later

Enable or disable the [Symfony](https://symfony.com/doc/current/console/verbosity.html) debug verbosity level for `bin/magento` CLI commands performed during the deployment phase.

>[!NOTE]
>
>To use the VERBOSE_COMMANDS setting to control the detail in command output for both successful and failed `bin/magento` CLI commands, you must set [MIN_LOGGING_LEVEL](variables-global.md#minlogginglevel) `debug`.

Choose the level of detail provided in the logs:

- `-v`= normal output
- `-vv`= more verbose output
- `-vvv` = verbose output ideal for debug

```yaml
stage:
  deploy:
    VERBOSE_COMMANDS: "-vv"
```
