---
title: Set up ActiveMQ service
description: Learn how to enable the ActiveMQ Artemis service to manage message queues for Adobe Commerce on cloud infrastructure.
feature: Cloud, Services
exl-id: TBD
---
# Set up [!DNL ActiveMQ] service

The [Message Queue Framework (MQF)](https://experienceleague.adobe.com/docs/commerce-operations/configuration-guide/message-queues/message-queue-framework.html) is a system within Adobe Commerce that allows a [module](https://experienceleague.adobe.com/en/docs/commerce-operations/implementation-playbook/glossary#module) to publish messages to queues. It also defines the consumers that receive the messages asynchronously.

The MQF can use [ActiveMQ Artemis](https://activemq.apache.org/components/artemis/) as the messaging broker, which provides a scalable platform for sending and receiving messages. It also includes a mechanism for storing undelivered messages. [!DNL ActiveMQ Artemis] supports the STOMP (Streaming Text Oriented Messaging Protocol) protocol for messaging.

>[!NOTE]
>
>[!DNL ActiveMQ Artemis] is available as an alternative to RabbitMQ for managing message queues. It is particularly useful when you need features specific to ActiveMQ or want to use STOMP protocol.

>[!WARNING]
>
>If you prefer using an existing message broker service, like [!DNL ActiveMQ], instead of relying on Adobe Commerce on cloud infrastructure to create it for you, use the [`QUEUE_CONFIGURATION`](../environment/variables-deploy.md#queue_configuration) environment variable to connect it to your site.

{{service-instruction}}

**To enable ActiveMQ Artemis**:

1. Add the required name, type, and disk value (in MB) to the `.magento/services.yaml` file along with the installed ActiveMQ version.

   ```yaml
   activemq-artemis:
       type: activemq-artemis:<version>
       disk: 1024
   ```

1. Configure the relationships in the `.magento.app.yaml` file.

   ```yaml
   relationships:
       activemq-artemis: "activemq-artemis:activemq-artemis"
   ```

1. Add, commit, and push your code changes.

   ```bash
   git add .magento/services.yaml .magento.app.yaml
   ```

   ```bash
   git commit -m "Enable ActiveMQ Artemis service"
   ```

   ```bash
   git push origin <branch-name>
   ```

1. [Verify the service relationships](services-yaml.md#service-relationships).

{{service-change-tip}}

## Connect to ActiveMQ for debugging

For debugging purposes, it is useful to directly connect to a service instance in one of the following ways:

- Connect from your local development environment
- Connect from the application
- Connect from your PHP application

### Connect from your local development environment

1. Log in to the `magento-cloud` CLI and project:

   ```bash
   magento-cloud login
   ```

1. Check out the environment with ActiveMQ Artemis installed and configured.

   ```bash
   magento-cloud environment:checkout <environment-id>
   ```

1. Use SSH to connect to the Cloud environment:

   ```bash
   magento-cloud ssh
   ```

1. Retrieve the ActiveMQ connection details and login credentials from the [$MAGENTO_CLOUD_RELATIONSHIPS](../application/properties.md#relationships) variable:

   ```bash
   echo $MAGENTO_CLOUD_RELATIONSHIPS | base64 -d | json_pp
   ```

   or

   ```bash
   php -r 'print_r(json_decode(base64_decode($_ENV["MAGENTO_CLOUD_RELATIONSHIPS"])));'
   ```

   In the response, find the ActiveMQ information. The relationship name depends on how you configured it in your `.magento.app.yaml` file. For example, if you used `activemq-artemis` as the relationship name:

   ```json
   {
      "activemq-artemis" : [
         {
            "password" : "guest",
            "ip" : "246.0.129.2",
            "scheme" : "stomp",
            "port" : 61616,
            "host" : "activemq-artemis.internal",
            "username" : "guest"
         }
      ]
   }
   ```

1. Enable local port forwarding to ActiveMQ (if your project is located on a different region such as US-3, EU-5, or AP-3 region, substitute ``us-3``/``eu-5``/``ap-3`` for ``us``)

   ```bash
   ssh -L <port-number>:activemq-artemis.internal:<port-number> <project-ID>-<branch-ID>@ssh.us.magentosite.cloud
   ```

   An example for accessing the ActiveMQ Artemis web console at `http://localhost:8161` is:

   ```bash
   ssh -L 8161:activemq-artemis.internal:8161 <project-ID>-<branch-ID>@ssh.us.magentosite.cloud
   ```

   >[!NOTE]
   >
   >ActiveMQ Artemis uses port 61616 for STOMP messaging and port 8161 for the web console.

1. While the session is open, you can access the ActiveMQ Artemis web console at `http://localhost:8161` using the username and password from the MAGENTO_CLOUD_RELATIONSHIPS variable.

### Connect from the application

To connect to ActiveMQ running in an application, you need to install a STOMP client library in your PHP application.

### Connect from your PHP application

To connect to ActiveMQ using your PHP application, add a PHP STOMP library to your source tree. Adobe Commerce uses the STOMP protocol for ActiveMQ communication, and the configuration is automatically set up during deployment when ActiveMQ Artemis is detected as a configured service.

## Protocol support

ActiveMQ Artemis in Adobe Commerce on cloud infrastructure uses the STOMP (Streaming Text Oriented Messaging Protocol) protocol:

- **STOMP**: The messaging protocol used for queue operations (port 61616)
- **Web Console**: Management interface accessible via HTTP (port 8161)

## Differences from RabbitMQ

While both [!DNL ActiveMQ Artemis] and [!DNL RabbitMQ] serve as message brokers for Adobe Commerce, there are some differences:

- **Protocol**: ActiveMQ Artemis uses STOMP protocol, while RabbitMQ uses AMQP
- **Configuration**: When ActiveMQ Artemis is configured, Adobe Commerce automatically uses STOMP protocol
- **Priority**: If both ActiveMQ and RabbitMQ are configured, ActiveMQ takes precedence for STOMP-based operations, while AMQP operations use RabbitMQ
- **Web Console**: ActiveMQ provides a web-based management console for monitoring queues and messages

## Queue configuration

When ActiveMQ Artemis is configured as a service, Adobe Commerce automatically configures the queue system to use the STOMP protocol. The configuration is written to the `app/etc/env.php` file during deployment:

```php
'queue' => [
    'stomp' => [
        'host' => 'activemq-artemis.internal',
        'port' => '61616',
        'user' => 'guest',
        'password' => 'guest'
    ],
    'default_connection' => 'stomp'
]
```

You can override this configuration using the [`QUEUE_CONFIGURATION`](../environment/variables-deploy.md#queue_configuration) environment variable if needed.

