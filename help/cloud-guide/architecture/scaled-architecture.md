---
title: Scaled architecture
description: Learn about the split-tier architecture and how it scales to meet demand.
feature: Cloud, Auto Scaling, Iaas, Logs
exl-id: 45c0cf14-99e6-4643-88f0-98ebcdb3a98c
---
# Scaled Architecture

The Cloud infrastructure scales according to your resource requirements to achieve greater efficiency. The Adobe Commerce on cloud infrastructure monitors your applications and can adjust capacity to maintain steady, predictable performance. Converting to this architecture helps to mitigate problems, such as latency or large spikes in traffic.

>[!NOTE]
>
>The scaled architecture is available for Adobe Commerce on cloud infrastructure accounts with the Pro 48 cluster or greater.

## Split-tier architecture

Historically, the Pro architecture consisted of three nodes, each containing a full tech stack. Now, there is a scalable infrastructure that provides a tiered architecture with a minimum of six nodes: three nodes for the core database and services and three nodes for the web server. This split-tier architecture provides the capability to scale tiers independently to achieve an optimal balance of performance.

### Service tier

There are three service nodes for data storage, cache, and services: **OpenSearch** or **Elasticsearch**, **MariaDB**, **Redis**, and more. When the service tier approaches capacity, the only way to scale is to increase the server size, such as boosting the CPU power and memory. Capacity is limited to the size of the node that is available. Because the database cluster is designed for high availability, you cannot scale horizontally in a reliable way with the technologies used.

![Service tier scaling](../../assets/scaling-service.png)

Consider an example that the service node instance type is _m5.2xlarge_ with 32-Gb RAM. A service, such as the database, uses a considerable amount of memory (30 Gb). Scaling to the next available instance size _m5.4xlarge_ provides 64-Gb RAM, which doubles the memory and accommodates the growing needs of the database.

You can further optimize the performance of the service tier by routing traffic based on the node type. By default, the database node is isolated from the web traffic. As an example, you can choose to serve web traffic on the database node.

### Web tier

There are three web nodes for processing requests and web traffic: **php-fpm** and **NGINX**. In addition to vertical scaling by increasing power and memory, the web tier can scale horizontally by adding web servers to an existing cluster when constricted at the PHP level. See [Auto scaling](autoscaling.md) to learn how the web nodes scale automatically.

![Web tier scaling](../../assets/scaling-web.png)

This complements the vertical scaling provided by the service tier. As the service tier scales in size and power to accommodate a growing database and service usage, the web tier scales in size, power, and instances to accommodate an increase in process requests and higher traffic requirements.

Consider an example that the web node instance type is _C5.2xlarge with eight CPUs and 16-Gb RAM_. The number of requests to the site increased greatly. You can add a C5.2xlarge node to handle the increase in php-fpm processes or you can change each instance type to _C5.4xlarge with 16 CPU and 32-Gb RAM_. Adding a node reduces the risk of insufficient surge capacity.

## Project structure

Minimally, Pro projects with the Scaled architecture have six nodes available.

- 3 web nodes c5.2xlarge (8 CPU, 16-Gb RAM)

- 3 service nodes m5.2xlarge (8 CPU, 32-Gb RAM)

Each project is unique, however, and requires performance monitoring to properly analyze resource management. Each account includes the [New Relic service](../monitor/new-relic-service.md), which automatically connects with the application data and performance analytics to provide dynamic server monitoring. Specifically, you can use the New Relic service to monitor CPU and RAM utilization to determine which nodes require additional resources. As a resource reaches capacity or you notice a degradation in performance based on the analytics, you can create a request to scale your infrastructure to meet the demand.

### SSH access

Certain files and logs, such as the `/app/<project-id>/var/log` directory, are not shared between nodes. Each node has a unique SSH access. You cannot use the `magento-cloud` CLI to log in to the service or web nodes, but you can find the node addresses in the SSH Access list in your [!DNL Cloud Console].

```bash
ssh <node>.<project-ID>-<environment>-<user-ID>@ssh.<region>.magento.com
```

- `node` 1 through 3—Addresses to access the service nodes

- `node` 4 through _n_—Addresses to access the web nodes

>[!TIP]
>
>After you log in, you can confirm the server ID and the role: service nodes use the _unified_ role, and web nodes use the _web_ role.

Example response as you log in to a **service node** includes the _unified_ role:

```
 __  __                   _          ___ _             _
|  \/  |__ _ __ _ ___ _ _| |_ ___   / __| |___ _  _ __| |
| |\/| / _` / _` / -_) ' \  _/ _ \ | (__| / _ \ || / _` |
|_|  |_\__,_\__, \___|_||_\__\___/  \___|_\___/\_,_\__,_|
            |___/

 Welcome to Magento Cloud.

 This is server unique-server-id, role project-id:unified.

project-id@server-id:~$
```

Example response as you log in to a **web node** includes the _web_ role:

```
 __  __                   _          ___ _             _
|  \/  |__ _ __ _ ___ _ _| |_ ___   / __| |___ _  _ __| |
| |\/| / _` / _` / -_) ' \  _/ _ \ | (__| / _ \ || / _` |
|_|  |_\__,_\__, \___|_||_\__\___/  \___|_\___/\_,_\__,_|
            |___/

 Welcome to Magento Cloud.

 This is server unique-server-id, role project-id:web.

project-id@server-id:~$
```

### Log locations

The log locations vary slightly depending on the node. For example, a database log, such as the **MySQL error log**, is available on a service node (`/var/log/mysql/mysql-error.log`), but it is not available on a web node.

Each Pro account includes the [New Relic Logs service](../monitor/new-relic-service.md), which automatically connects with log data from the application to provide dynamic log management. Aggregated log data from all nodes displays in the New Relic Logs application so that you can troubleshoot performance issues on specific nodes from a single dashboard.
