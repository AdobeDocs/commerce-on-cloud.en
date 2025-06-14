---
title: Cloud Docker package
description: See a list of the latest improvements to the Cloud Docker package.
feature: Cloud, Docker, Release Notes
recommendations: noDisplay, catalog
last-substantial-update: 2025-06-03
exl-id: 95cf4f30-6bce-4bac-8e11-cfe53cac2c70
---
# Cloud Docker package

The [`magento/magento-cloud-docker`](https://github.com/magento/magento-cloud-docker) package provides functionality and Docker images to deploy Adobe Commerce to a local Cloud environment. These release notes describe the latest improvements to this package, which is a component of [Cloud Tools Suite for Commerce](cloud-tools-suite.md).

The `magento/magento-cloud-docker` package uses the following version sequence: `<major>.<minor>.<patch>`

The release notes include:

-  ![new icon](../../assets/new.svg) New features
-  ![fix icon](../../assets/fix.svg) Fixes and improvements

<!--Add release notes below-->

## v1.4.3 {#latest}

Release date: June 03, 2025

-  ![fix icon](../../assets/fix.svg) **Improved compatibility with 2.4.8**-Updated 3rd-party libraries for better compatibility with 2.4.8<!-- MCLOUD-13707	 - -->

## v1.4.2 

Release date: April 7, 2025

-  ![new icon](../../assets/new.svg) **PHP 8.4**—Added `php-cli` 8.4 and `php-fpm` 8.4 images.


## v1.4.1

Release date: February 6, 2025

-  ![new icon](../../assets/new.svg) **PHP 8.4**—Added support for PHP 8.4.


## v1.4.0

Release date: October 7, 2024

-  ![fix icon](../../assets/fix.svg) **Refactored code**—Removed support of old PHP versions (7.4, 7.3, 7.2) and related libraries and images.

## v1.3.7

Release date: April 8, 2024

-  ![new icon](../../assets/new.svg) **PHP** — Added support for PHP 8.3 and PHP 8.3 images.
-  ![new icon](../../assets/new.svg) **Nginx** — Added image nginx v. 1.24.
-  ![new icon](../../assets/new.svg) **Opensearch** - Added image OpenSearch v. 2.12, 1.3.
-  ![new icon](../../assets/new.svg) **Composer** - Updated Composer version to 2.2.23.

## v1.3.6

Release date: July 31, 2023

-  ![new icon](../../assets/new.svg) **Added new service version**—OpenSearch 2.5.
-  ![new icon](../../assets/new.svg) **Enable Composer cache**—Now you can extend the Docker configuration to enable Composer clear cache when starting the Docker container. See [Extend the Docker configuration](https://developer.adobe.com/commerce/cloud-tools/docker/configure/extend-docker-configuration/) in the _Cloud Docker for Commerce_ guide.

## v1.3.5

Release date: March 10, 2023

-  ![new icon](../../assets/new.svg) **ionCube**—Added the ionCube extension for the PHP 8.1 image.
-  ![new icon](../../assets/new.svg) **Added new service versions**—OpenSearch 2.3 and 2.4, PHP 8.2, Varnish 7.1.1.
-  ![new icon](../../assets/new.svg) **Enhanced support for PHP 8.2**—Fixed compatibility issues with certain PHP 8.2.x versions to support Commerce 2.4.6.
-  ![fix icon](../../assets/fix.svg) **Composer issue**—Fixed issues that occurred after updating the Composer version within the Docker containers.

## v1.3.4

Release date: October 27, 2022

-  ![new icon](../../assets/new.svg) **Added new Varnish images**—Added images for Varnish 6.5, 7.0, and 7.1.<!-- MCLOUD-7879 -->

## v1.3.3

Release date: September 13, 2022

-  ![new icon](../../assets/new.svg) **Apple M1 (ARM64) support**—Added changes to Docker images to enable support for Apple M1 (ARM64) architecture.<!-- MCLOUD-7989-2 MCLOUD-7989 -->
-  ![fix icon](../../assets/fix.svg) **Mailhog**—Fixed an issue where the Mailhog service did not catch emails while in developer mode.<!-- MCLOUD-8643 -->
-  ![fix icon](../../assets/fix.svg) **init-docker.sh**—Fixed the service versions validator in the `init-docker.sh` script.<!-- MCLOUD-8765 -->

## v1.3.2

Release date: March 31, 2022

-  ![new icon](../../assets/new.svg) **Added Elasticsearch 7.10 image**<!-- MCLOUD-8548 -->

## v1.3.1

Release date: March 10, 2022

-  ![new icon](../../assets/new.svg) **Support PHP 8.1**—Added support for PHP 8.1.
-  ![new icon](../../assets/new.svg) **OpenSearch**—Added images of OpenSearch versions 1.1 and 1.2.
-  ![new icon](../../assets/new.svg) **Composer 2.1**—Set composer 2.1.x by default in PHP 8.x images.
-  ![new icon](../../assets/new.svg) **PHP images improvements**—

   -  Added PHP 8.1 images
   -  Upgraded xDebug version 3.1.2
   -  Upgraded xmlrpc 1.0.0RC3

-  ![fix icon](../../assets/fix.svg) **Elasticsearch & OpenSearch improvements**—Improvements in Elasticsearch and OpenSearch Dockerfiles; removed the Elasticsearch 5.2 image.
-  ![fix icon](../../assets/fix.svg) **Sodium extension**—Enabled the `sodium` extension by default in all PHP images.
-  ![fix icon](../../assets/fix.svg) **Composer cache volume**—Fixed path for Composer cache volume to have cached Composer packages.
-  ![fix icon](../../assets/fix.svg) **Memory limitation in nginx**—Fixed limitation of memory in NGINX image.

## v1.3.0

Release date: October 25, 2021

-  ![fix icon](../../assets/fix.svg) **Improve Developer mode workflow**—Previously, you needed to specify the mode in the build and deploy steps. Now, the `--mode` option in the `build` step determines the mode in the later `deploy` step. Setting the mode after the deployment is no longer required. See [Developer mode](https://developer.adobe.com/commerce/cloud-tools/docker/deploy/developer-mode/).<!-- ACMP-1086 -->
-  ![fix icon](../../assets/fix.svg) **Improvements for read-only filesystem**—<!-- ACMP-1106 -->
   -  Fix issue starting a PHP container for mail configuration.
   -  Can use environment variables in INI files.
   -  Ensure PHP entry points do not need write permission.
-  ![fix icon](../../assets/fix.svg) **Update Node**—Update the bundled Node version; when installing Node in PHP-CLI images, it now uses the current LTS version.<!-- ACMP-1539 -->
-  ![fix icon](../../assets/fix.svg) **Update Symfony**—Updated the Symfony config dependencies to be compatible with Adobe Commerce 2.4.4.<!-- ACMP-1533 -->

## v1.2.4

Release date: July 29, 2021

-  ![new icon](../../assets/new.svg) **New `Zookeeper` container**—Added a [Zookeeper container](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#zookeeper-container) to manage lock provider configuration for projects that are not deployed to Adobe Commerce on Cloud infrastructure.<!--MCLOUD-8000-->

-  ![new icon](../../assets/new.svg) **Added support for Composer 2.0.**—Added Composer version 2.0 to the Composer configuration file to support upgrades from Composer 1.0 which is approaching end-of-life.<!--MCLOUD-8003-->

## v1.2.3

Release date: June 14, 2021

-  ![new icon](../../assets/new.svg) **Added PHP 8.0**—Updated PHP to version 8.0, allowing you take advantage of all the new features and optimizations PHP 8.0 includes.<!--MCLOUD-7941-->
-  ![new icon](../../assets/new.svg) **Updated to Varnish 6.6 and Elasticsearch 7.11.2**—The following links provide release information on [Varnish Cache 6.6](https://varnish-cache.org/releases/rel6.6.0.html#rel6-6-0) and Elasticsearch 7.11.2.<!--MCLOUD-7921-->
-  ![new icon](../../assets/new.svg) **Added `ioncube` extension for PHP 7.4 image**—The `ioncube` extension has been re-added to the PHP 7.4 image after having been initially excluded from the PHP 7.3 to PHP 7.4 upgrade. *[Submitted by mattskr](https://github.com/magento/magento-cloud-docker/pull/314).*<!--PR #314-->
-  ![new icon](../../assets/new.svg) **Added a file sync option: `manual-native`**—The `manual-native` file synchronization option provides manual control over synchronization, which provides the best performance for macOS and Windows environments. Read about using the `manual-native` option in [Developer mode](https://developer.adobe.com/commerce/cloud-tools/docker/deploy/developer-mode/) and [Synchronizing data in a Docker developer environment](https://developer.adobe.com/commerce/cloud-tools/docker/setup/synchronize-data/#file-synchronization-options).<!--MCLOUD-7977-->
-  ![new icon](../../assets/new.svg) **Removed volume deletions from `up` and `down` commands**—The `--volume` option was removed from the `bin/magento-docker up` and `bin/magento-docker down` commands, replaced by the new `bin/magento-docker init` command with a data loss warning. This change helps prevent the accidental data loss. *[Submitted by joeshelton-wagento](https://github.com/magento/magento-cloud-docker/pull/319).*<!--PR #319-->
-  ![fix icon](../../assets/fix.svg) **Updated `CN` value for the generated certificate**—Removed the hardcoded `CN` value from the Dockerfile. This value created a certificate error (`NET::ERR_CERT_INVALID`) that caused the `--host` option for the `ece-docker build:compose` command to be ignored.<!--MCLOUD-7934-->

## v1.2.2

Release date: April 20, 2021

-  ![new icon](../../assets/new.svg) **Updated `host.docker.internal` to be platform independent**—You can now create the same Docker Compose scripts for Ubuntu, Windows, and macOS. Using Xdebug on Ubuntu no longer requires a separate environment variable. [Fix submitted by Igor Vitol](https://github.com/magento/magento-cloud-docker/pull/299).<!--Issue #298-->
-  ![new icon](../../assets/new.svg) **Updated init-docker.sh**—Added the `mounts` object to the `MAGENTO_CLOUD_APPLICATION` environment variable. [Fix submitted by Chiranjeevi](https://github.com/magento/magento-cloud-docker/pull/299).<!--Issue #299-->
-  ![new icon](../../assets/new.svg) **Updated init-docker.sh**—Updated the `init-docker.sh` script with PHP 7.4 and Cloud Docker 1.2.1 versions. [Fix submitted by Adarsh Manickam](https://github.com/magento/magento-cloud-docker/pull/300).<!--Issue #300-->
-  ![new icon](../../assets/new.svg) **Sodium enabled by default**—Enabled the `sodium` PHP extension by default within PHP Docker images.<!--MCLOUD-7548-->
-  ![new icon](../../assets/new.svg) **`custom-registry` option**—Added a `--custom-registry` option to `php ./vendor/bin/ece-docker build:compose` command for using your own images registry.<!--MCLOUD-7476-->

   ```bash
   ./vendor/bin/ece-docker build:compose --custom-registry=my-registry.example.com
   ```

-  ![new icon](../../assets/new.svg) **Removed old Elasticsearch versions**—Removed Elasticsearch versions 1.7 and 2.4 from the Elasticsearch images.<!--MCLOUD-7504-->
-  ![new icon](../../assets/new.svg) **Auto-generating NGINX certificates**—Removed the existing certificates from the NGINX image. The NGINX certificates are now auto-generated with each new deployment for improved security.<!--MCLOUD-7396-->
-  ![fix icon](../../assets/fix.svg) **Enabled `opcache.validate_timestamps`**—Enabled the `opcache.validate_timestamps` PHP setting by default in developer mode. Enabling this setting fixed the issue where changes to the filesystem were not recognized in Docker.<!--MCLOUD-7466-->
-  ![fix icon](../../assets/fix.svg) **Fixed `build:custom:compose`**—Fixed the `build:custom:compose` command to throw an error when files cannot be overwritten during the build process. Throwing an error prevents situations where `docker-compose up` could be using the wrong files.<!--MCLOUD-7457-->
-  ![fix icon](../../assets/fix.svg) **Fixed `--sync_engine="native"` option**—Fixed the issue where in production mode (`--mode="production"`), the `--sync_engine="native"` option would not create any entries for local folders in the `docker.composer.yml` file.<!--MCLOUD-7254-->
-  ![fix icon](../../assets/fix.svg) **Fixed service version validation errors**—Added service versions for [!DNL RabbitMQ], Elasticsearch, and other services to the `type` property in the `MAGENTO_CLOUD_RELATIONSHIP` variable. Adding these versions to the `relationships` variable fixed the validation errors that occurred during the deploy phase.<!--MCLOUD-7572-->

## v1.2.1

Release date: December 21, 2020

-  ![new icon](../../assets/new.svg) **NGINX command options**—Added build command options to change the number of NGINX `worker_processes` and NGINX `worker_connections` for TLS and Web services. The `worker_process` parameter retains the ability to set the value to `auto`. Examples: <!--MCLOUD-7259-->

    ```bash
    ./vendor/bin/ece-docker build:compose --nginx-worker-processes=2
    ./vendor/bin/ece-docker build:compose --nginx-worker-connections=2048
    ```

-  ![new icon](../../assets/new.svg) **TLS command option**—Added build command option to create a configuration without the TLS service. Example: <!--MCLOUD-7259-->

   ```bash
   ./vendor/bin/ece-docker build:compose --no-tls
   ```

-  ![new icon](../../assets/new.svg) **NGINX memory consumption**—Reduced the memory consumed by the NGINX process for TLS and Web services.<!--MCLOUD-7259-->

-  ![new icon](../../assets/new.svg) **Blackfire**—Disabled Blackfire PHP extension by default in the Cloud Docker image.

-  ![fix icon](../../assets/fix.svg) **PHP-FPM container**—Fixed PHP-FPM container health check by changing the `WEB_PORT` from `80` to `8080`.<!--MCLOUD-7232-->

-  ![fix icon](../../assets/fix.svg) **Invalid volume naming**—Fixed an error with invalid volume naming in developer mode.<!--MCLOUD-7442-->

-  ![fix icon](../../assets/fix.svg) **NGINX upstream port**—Updated the Docker NGINX 1.19 image to use port 8080 to avoid an infinite loop. [Fix submitted by Adarsh Manickam](https://github.com/magento/magento-cloud-docker/pull/296).<!--Issue 295-->

## v1.2.0

Release date: November 9, 2020

-  ![new icon](../../assets/new.svg) **Container updates—**

   -  ![new icon](../../assets/new.svg) **PHP-FPM container**—Added support for the gnupg PHP extension. [Fix submitted by G Arvind from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/210).<!--MCLOUD-5981-->

   -  ![fix icon](../../assets/fix.svg) **Database container**—Fixed the database container health check by adding the required database password to the health check command.<!--MCLOUD-7122-->

   -  ![new icon](../../assets/new.svg) **Elasticsearch container**

      -  Added support for Elasticsearch 7.9 for compatibility with upcoming Adobe Commerce releases.<!--MCLOUD-7190-->

      -  **Elasticsearch plugin configuration**—Added support to use the Elasticsearch plugin configuration information from the `services.yaml` file to generate the `docker-compose.yaml` file for a Cloud Docker for Commerce environment. See [Elasticsearch plugins](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#elasticsearch-plugins).<!--MCLOUD-2789-->

      -  **Elasticsearch plugin support**—Added support for the following Elasticsearch plugins: `analysis-icu`, `analysis-phonetic`, `analysis-stempel`, and `analysis-nori`. The `analysis-icu` and `analysis-phonetic` plugins are installed by default. You can add or remove the `analysis-stempel` and `analysis-nori` plugins as needed.<!--MCLOUD-2789-->

   -  ![new icon](../../assets/new.svg) **CLI container**

      -  **Run commands inside Docker PHP containers**—Now you can use the Cloud Docker CLI to run commands inside PHP containers in your Docker environment without having to install PHP on the host. For example, the following command builds the configuration:  `./bin/magento-docker php 7.3 vendor/bin/ece-docker build:compose`. See [Cloud Docker CLI](https://developer.adobe.com/commerce/cloud-tools/docker/quick-reference/#cloud-docker-cli). [Fix submitted by G Arvind from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/209).<!--MCLOUD-5982-->

      -  Added the OpenSSH-client to PHP CLI containers. Now, you can use ssh-agent forwarding for Composer if the `composer.json` file contains private git repositories that require an ssh client to use Composer commands.<!--MCLOUD-6008-->

   -  ![fix icon](../../assets/fix.svg) **TLS container**—Now, the [TLS container](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#tls-container) is based on the `https://hub.docker.com/r/magento/magento-cloud-docker-nginx` Docker image instead of the CentOS image. This change fixes issues that caused errors when sending HTTPS requests between containers in the Cloud Docker environment.<!--MCLOUD-6469-->

   -  ![new icon](../../assets/new.svg) **Test container**—Added a test container for application testing, and added the `--with-test` option to the Docker `build:compose` command to create the container only when testing in the Docker environment. See [application testing](https://developer.adobe.com/commerce/cloud-tools/docker/test/application-testing/).<!--MCLOUD-6394-->

   -  ![new icon](../../assets/new.svg) **FPM-XDEBUG container**

      -  ![new icon](../../assets/new.svg) **Configure Xdebug on Linux**—Added the `--set-docker-host` option to the `ece-docker build:compose` command to configure the `host.docker.internal` value in the Xdebug container. This option is required to use Xdebug on Linux systems. See [Configure Xdebug for Docker](https://developer.adobe.com/commerce/cloud-tools/docker/test/configure-xdebug/).<!--MCLOUD-6430-->

      -  ![fix icon](../../assets/fix.svg) Fixed the Xdebug variable configuration for the Docker ENTRYPOINT to resolve `uninitialized "with_xdebug" variable` errors in the logs. [Fix submitted by Florent Olivaud](https://github.com/magento/magento-cloud-docker/pull/218)<!--MCLOUD-6043-->

-  ![new icon](../../assets/new.svg) **Docker configuration changes**

   -  **MailHog configuration**—Now you can use the following `ece-docker build:compose` command options to disable MailHog and specify ports: `--no-mailhog`, `--mailhog-http-port`, and `--mailhog-smtp-port`. See [Set up email](https://developer.adobe.com/commerce/cloud-tools/docker/configure/#set-up-email).<!--MCLOUD-6898, MCLOUD-6660-->

   -  For Cloud Docker for Commerce 1.2.0 and later, Adobe now provides Docker images for each patch version, and the Docker configuration generator creates the Docker configuration with a specified patch version instead of using the latest. Previously, the Docker configuration generator built the configuration using the latest patch version which could break Cloud Docker for Commerce environments built using an earlier version.<!--MCLOUD-7093-->

   -  **Specify custom images and versions in custom Cloud Docker configuration**—Updated the `build:custom:compose` command with options to specify custom images and versions when generating a custom Docker compose configuration file (`docker-compose.yaml`). See [Build a custom Docker Compose configuration](https://developer.adobe.com/commerce/cloud-tools/docker/configure/custom-docker-compose/). <!--MCLOUD-7089-->

   -  Updated the Docker host configuration to expose port 443 to enable access to Adobe Commerce (`https://magento2.docker`) from all CLI containers. You can change the default port by adding the `--tls-port` option when you generate the Docker configuration file.<!--MCLOUD-6806-->

-  ![fix icon](../../assets/fix.svg) Fixed an issue that caused the Cloud Docker for Commerce build to fail if the `app/etc/env.php` file exists.<!--MCLOUD-6732-->

-  ![fix icon](../../assets/fix.svg) Updated the build configuration to replace named volumes with regular volumes to prevent issues when deploying Cloud Docker for Commerce on Linux or Windows Subsystem for Linux (WSL2).<!--MCLOUD-6732-->

-  ![fix icon](../../assets/fix.svg) Updated the Cloud Docker for Commerce functional tests to support Composer 2.0.<!--MCLOUD-7183-->

## v1.1.2

Release date: September 9, 2020

-  ![new icon](../../assets/new.svg) Added support for Elasticsearch 7.7<!--MCLOUD-6219-->

## v1.1.1

Release date: August 5, 2020

-  ![fix icon](../../assets/fix.svg) **Updated email configuration**—Updated the default Cloud Docker for Commerce configuration to support the MailHog service instead of using SendMail. See [Set up email](https://developer.adobe.com/commerce/cloud-tools/docker/configure/#set-up-email).<!--MCLOUD-5624-->

-  ![fix icon](../../assets/fix.svg) Restored the PS library to the Cloud Docker environment configuration to fix `ps:  command not found` errors.<!--MCLOUD-6621-->

-  ![fix icon](../../assets/fix.svg) Updated the default Cloud Docker for Commerce configuration to remove automatic mounting of the database entrypoint and MariaDB volumes to fix `Cannot create container for service db` errors that can occur when starting your Cloud Docker environment.

   Now, you can configure the Cloud Docker environment to mount the database directories by adding the following options to the `ece-docker build:compose` command: `--with-entry-point` and `with-mariadb-conf`. See [Service configuration options](https://developer.adobe.com/commerce/cloud-tools/docker/containers/#service-configuration-options).<!--MCLOUD-6424-->

-  ![new icon](../../assets/new.svg) **CLI command updates**

| Action                                                                          | Command                                                        |
| ------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| Add an entrypoint to the database container to restore the database from backup | `./vendor/bin/ece-docker build:compose --db --with-entrypoint` |
| Add a MariaDB configuration volume                                              | `./vendor/bin/ece-docker build:compose --db --mariadb-conf`    |

## v1.1.0

Release date: June 25, 2020

-  ![new icon](../../assets/new.svg) **Added support for the split database performance solution**—Now you can configure and deploy a store using the Split database performance solution in the Cloud Docker environment.<!--MCLOUD-3740-->

-  ![new icon](../../assets/new.svg) **Support for Adobe Commerce and Magento Open Source deployment**—Now you can use Cloud Docker for Commerce to deploy a local development environment for projects that are not hosted on Adobe Commerce on cloud infrastructure.<!--MCLOUD-5667-->

-  ![new icon](../../assets/new.svg) **Blackfire.io support**—Added support to use the [Blackfire.io extension](https://developer.adobe.com/commerce/cloud-tools/docker/test/blackfire/) for automated performance testing. [Fix submitted by Adarsh Manickam from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/202)<!--MCLOUD-5857-->

-  ![new icon](../../assets/new.svg) **Container updates**

   -  **Varnish**—Now Varnish is the default cache when you deploy Adobe Commerce in a Cloud Docker environment using a supported version of the Cloud application template. See [Varnish container](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#varnish-container).<!--MCLOUD-2634-->

   -  Added the `--no-varnish` option to skip Varnish service installation when you generate the Cloud Docker configuration file.<!--MCLOUD-2634-->

   -  ![new icon](../../assets/new.svg) **Database**

      -  Added the support for the MySQL database. Now, you can configure the Cloud Docker environment with either MariaDB or MySQL. See [Service configuration options](https://developer.adobe.com/commerce/cloud-tools/docker/containers/#service-configuration-options).<!--MCLOUD-5691-->

      -  Added the ability to set the increment and offset settings for database replication when you generate the Docker compose file. See [Service containers](https://developer.adobe.com/commerce/cloud-tools/docker/containers/#service-containers).<!--MCLOUD-5735-->

   -  ![new icon](../../assets/new.svg) **PHP-FPM**

      -  Added support for PHP 7.4. [Fix submitted by Mohanela Murugan from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/198)<!--MCLOUD-198-->

      -  Added ability to copy a `php.ini` file in the root project directory to the Cloud Docker environment and apply custom PHP settings to the PHP-FPM and CLI containers. See [Customize PHP settings](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#customize-php-settings). [Fix submitted by Mathew Beane from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/130).<!--MCLOUD-6012-->

      -  Added a container health check. [Fix submitted by Visanth Sampath from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/188).<!--MCLOUD-5752-->

   -  ![fix icon](../../assets/fix.svg) **Node.js**—Updated the default Node.js version from version 8 to version 10 to improve security. Node.js version 8 is deprecated and no longer updated with bug fixes or security patches. [Fix submitted by Mohan Elamurugan from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/183).<!--MCLOUD-5586-->

   -  ![new icon](../../assets/new.svg) **Elasticsearch**

      -  Added support for Elasticsearch 6.8, 7.2, 7.5, and 7.6.<!--MCLOUD-4050, MCLOUD-5855,MCLOUD-5860-->

      -  Added the ability to customize the [Elasticsearch container configuration](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#elasticsearch-container) when you generate the Docker compose configuration file.<!--MCLOUD-3059-->

      -  Added the `--no-es` option to the service configuration options for generating the Docker Compose configuration file. Use this option to skip the Elasticsearch container installation and use MySQL search instead. This option is supported only for Adobe Commerce versions 2.3.5 and earlier.<!--MCLOUD-3766-->

   -  ![new icon](../../assets/new.svg) **FPM-XDEBUG container**—Added a service configuration option to install and configure Xdebug for debugging PHP in your Cloud Docker environment. See [Configure Xdebug](https://developer.adobe.com/commerce/cloud-tools/docker/test/configure-xdebug/).<!--MCLOUD-4098-->

-  ![new icon](../../assets/new.svg) **Docker configuration changes**

   -  Added health checks for the PHP-FPM, Redis, Elasticsearch, and MySQL Docker service containers.<!--MCLOUD-3335 and MCLOUD-5856-->

   -  Changed the default file synchronization mode to `native` in Developer mode.<!--MCLOUD-3890 -->

   -  Added version information to the generic Docker service container image when generating the `docker-compose.yml` file.<!--MCLOUD-3878-->

   -  Improved ability to handle large responses from the upstream PHP-FPM container by increasing the `fastcgi_buffers` value for the Nginx server.<!--MCLOUD-5980-->

   -  Improved mutagen file synchronization performance by adding a second sync session to synchronize files in the `vendor` directory. This change prevents mutagen from getting stuck during the file synchronization process. [Fix submitted by Mathew Beane from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/127).<!--MCLOUD-6010-->

   -  ![new icon](../../assets/new.svg) **CLI command updates**

| Action   | Command         |
| -------- | --------------- |
| Clear Redis cache | `bin/magento-docker flush-redis`  |
| Clear Varnish cache | `bin/magento-docker flush-varnish` |
| Skip default Varnish installation | `.vendor/bin/ece-docker build:compose --no-varnish`<!--MCLOUD-2634-->  |
| [Customize Elasticsearch options](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#elasticsearch-container) | `.vendor/bin/ece-docker build:compose --es-env-var`<!--MCLOUD-3059-->   |
| [Remove Elasticsearch configuration](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#elasticsearch-container) | `.vendor/bin/ece-docker build:compose --no-es`<!--MCLOUD-3766-->     |
| Configure DB container with MySQL version 5.6 or 5.7 | `./vendor/bin/ece-docker build:compose --db <mysql-version-number> --db-image mysql`<!--MCLOUD-5691-->  |
| Specify custom base URL | `./vendor/bin/ece-docker build:compose --host=<hostname> --port=<port-number>`<!--MCLOUD-3063--> |
| [Add container for Xdebug configuration](https://developer.adobe.com/commerce/cloud-tools/docker/test/configure-xdebug/)  | `.vendor/bin/ece-docker build:compose --mode developer --sync-engine native --with-xdebug`<!--MCLOUD-4098--> |

-  ![fix icon](../../assets/fix.svg) Fixed the configuration of mutagen file synchronization to prevent mutagen from creating stale sessions. [Fix submitted by Mathew Beane from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/127).<!--MCLOUD-6010-->

-  ![fix icon](../../assets/fix.svg) Fixed a configuration issue that caused syntax errors in the Docker compose log when starting the PHP-FPM container. [Fix submitted by Mathew Beane from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/129)<!--MCLOUD-3958-->

-  ![fix icon](../../assets/fix.svg) Fixed volume conflict errors that sometimes occurred when using multiple Docker environments. [Fix submitted by G Arvind from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/168).

-  ![fix icon](../../assets/fix.svg) Fixed an issue that caused the `ece-docker build:compose` command to fail if the configuration included Blackfire.io. [Fix submitted by G Arvind from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/199). <!--MCLOUD-5797-->

-  ![fix icon](../../assets/fix.svg) Updated the PHP CLI image configuration to prevent out-of-memory errors that occurred when installing multiple packages using Cloud Docker for Commerce. [Fix submitted by Mohan Elamurugan from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/197).*<!--MCLOUD-5818-->

-  ![fix icon](../../assets/fix.svg) Added support for multiple MySQL users in the Cloud Docker environment. In earlier releases, the `build:compose` operation failed if the `magento.app.yaml` file specified multiple database users. [Fix submitted by G Arvind from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/181).<!--MCLOUD-5670-->

-  ![fix icon](../../assets/fix.svg) Removed `rsyslog` from the Cloud Docker for Commerce PHP containers to resolve compatibility issues that caused warning notifications during deployment. Cloud Docker does not use the rsyslog utility.<!--MCLOUD-6173-->

## v1.0.0

Release date: Feb 5, 2020

-  ![new icon](../../assets/new.svg) **Created a separate package to deliver `Cloud Docker for Commerce`**—Moved the source code to deliver Cloud Docker for Commerce from the `ece-tools` repository to the [new `magento-cloud-docker` repository](https://github.com/magento/magento-cloud-docker) to maintain code quality and provide independent releases. The new package is a dependency for ECE-Tools v2002.1.0 and later.

   When you update ece-tools, you also update the `magento/magento-cloud-docker` package to version 1.0.0. If you used Cloud Docker for Commerce with an earlier `ece-tools` release (2002.0.x), review the [backward incompatibilities](backward-incompatible-changes.md) and update your project as scripts, commands, and processes as needed.

-  ![new icon](../../assets/new.svg) **Added versioning to the Docker images**—You must now update the `magento/magento-cloud-docker` package to get the updated images.<!--MAGECLOUD-4737-->

-  ![new icon](../../assets/new.svg) **Container updates**—

   -  ![new icon](../../assets/new.svg) **PHP-FPM container**—

      -  ![new icon](../../assets/new.svg) **Added Node.js support**—Updated the PHP-FPM image to support node, npm, and the grunt-cli capabilities inside the PHP container.<!--MAGECLOUD-3953-->

      -  ![new icon](../../assets/new.svg) **Added support for [ionCube](https://www.ioncube.com/)**—Updated the default Docker configuration to support ionCube in the local Docker development environment.<!--MAGECLOUD-4354-->

   -  ![new icon](../../assets/new.svg) **Web container**—

      -  ![new icon](../../assets/new.svg) **Customize NGINX configuration**—Added the capability to mount a custom `nginx.conf` file to the Cloud Docker for Commerce environment. See [Web container](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#web-container).<!--MAGECLOUD-4204-->

      -  ![new icon](../../assets/new.svg) **Auto-generated NGINX certificates**—The Docker configuration file now includes the configuration to auto-generate NGINX certificates for the Web container.<!--MAGECLOUD-4258-->

   -  ![new icon](../../assets/new.svg) **New Selenium container**—Added a [Selenium container](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#selenium-container) to support Adobe Commerce application testing using the Magento Functional Testing Framework (MFTF).<!--MAGECLOUD-4040-->

   -  ![new icon](../../assets/new.svg) **[!DNL RabbitMQ] version support**—Updated the [!DNL RabbitMQ] container configuration to support [!DNL RabbitMQ] version 3.8.<!--MAGECLOUD-4674-->

   -  ![fix icon](../../assets/fix.svg) **Persistent database container**—The `magento-db: /var/lib/mysql` database volume now persists after you stop and remove the Docker configuration and restores when you restart the Docker configuration. Now, you must manually delete the database volume. See [Database containers].<!--MAGECLOUD-3978-->

   -  ![new icon](../../assets/new.svg) **TLS container**—

      -  ![new icon](../../assets/new.svg) **Updated the container base image to use official image**—The [Cloud TLS container](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#tls-container) image is now based on the official `debian:jessie` Docker image.—<!--MAGECLOUD-4163-->

      -  ![new icon](../../assets/new.svg) **Added support for the [Pound TLS Termination Proxy]**—The [Pound configuration file](https://github.com/magento/magento-cloud-docker/blob/1.0/images/tls/) adds the following ENV variables to customize the Docker configuration for the TLS container:

         -  **`TimeOut`**—Sets the Time to First Byte (TTFB) timeout value. The default value is 300 seconds.

         -  **`RewriteLocation`**—Determines whether the Pound proxy rewrites the location to the request URL by default. Defaults to `0` to prevent the rewrite from breaking redirects to outside websites like an external SSO site. [Fix submitted by Sorin Sugar](https://github.com/magento/magento-cloud-docker/pull/37)<!--MAGECLOUD-4061-->

      -  ![new icon](../../assets/new.svg) Increased the timeout value in the TLS container configuration from 15 to 300 seconds. [Fix submitted by Mathew Beane from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/78)<!--MAGECLOUD-4460-->

   -  ![new icon](../../assets/new.svg) **Varnish container**—

      -  ![new icon](../../assets/new.svg) **Updated the container base image to use official image**—The [Cloud Varnish container](https://developer.adobe.com/commerce/cloud-tools/docker/containers/service/#varnish-container) is now based on the official `centos` Docker image.<!--MAGECLOUD-4163-->

      -  ![new icon](../../assets/new.svg) **Improved default timeout configuration**-Added `.first_byte_timeout` and `.between_bytes_timeout` configuration to the Varnish container. Both timeout values default to `300s` (5 minutes). [Fix submitted by Mathew Beane from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/78)<!--MAGECLOUD-4460-->

      -  ![fix icon](../../assets/fix.svg) **Skip Varnish during Xdebug sessions**—Updated the Varnish container configuration to return `pass` on requests received when Xdebug is enabled. In previous releases, you could not use Xdebug if the Docker environment included Varnish. [Fix submitted by Mathew Beane from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/111).<!--MAGECLOUD-4873-->

-  ![new icon](../../assets/new.svg) **Docker configuration changes**—

   -  ![new icon](../../assets/new.svg) **Manage mounts and volumes for your project**—Added the ability to manage mounts and volumes when launching a Docker environment for local development. See [Sharing project data].<!--MAGECLOUD-3248-->

   -  ![new icon](../../assets/new.svg) **Support for network bridge mode**—Added support for network bridge mode to enable connections between Docker containers over the local network.<!--MAGECLOUD-4165-->

   -  ![new icon](../../assets/new.svg) **Cron container disabled by default**—To improve performance, the Cron container is no longer configured by default when you build the Docker environment. You can use the `--with-cron` option on the Docker build command to add a Cron container to your environment. See [Managing cron jobs](https://developer.adobe.com/commerce/cloud-tools/docker/configure/manage-cron-jobs/).<!--MAGECLOUD-5181-->

   -  ![new icon](../../assets/new.svg) **Stop synchronizing large backup files**—Added DB dumps and archive files—ZIP, SQL, GZ, and BZ2—to the exclusion list in the `dist/docker-sync.yml` and `dist/mutagen.sh` files. Synchronizing large files (>1 GB) can cause a period of inactivity and backup files do not normally require synchronization since you can regenerate them.<!--MAGECLOUD-3979-->

-  ![new icon](../../assets/new.svg) **Command changes**—

   -  ![fix icon](../../assets/fix.svg) Renamed the `./bin/docker` file to `./bin/magento-docker` to fix an issue that caused some Docker environments to break because the `./bin/docker` file overwrites existing Docker binary files. This is a [backward incompatible change](backward-incompatible-changes.md) that requires updates to your scripts and commands.<!-- MAGECLOUD-4038 -->

   -  ![new icon](../../assets/new.svg) **Added a service configuration option to expose the database port to the host**—Use the `--expose-db-port= [Fix submitted by Adarsh Manickam from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/101).<PORT>` option to expose the database port to the host when building the `docker-compose.yml` file: `bin/ece-docker build:compose --expose-db-port=<PORT>`<!--MAGECLOUD-4454-->

   -  ![new icon](../../assets/new.svg) **New post-deploy command**—Previously, the post-deploy hooks defined in the `.magento.app.yaml` file ran automatically after you deployed Adobe Commerce to a Cloud Docker container using the `cloud-deploy` command. Now, you must issue a separate `cloud-post-deploy` command to run the post-deploy hooks after you deploy. See the updated launch instructions for [developer](https://developer.adobe.com/commerce/cloud-tools/docker/deploy/developer-mode/) and [production](https://developer.adobe.com/commerce/cloud-tools/docker/deploy/production-mode/) mode.<!--MAGECLOUD-3996-->

   -  ![new icon](../../assets/new.svg) Added the `--rm` option to `./bin/magento-docker` commands for the build and deploy containers. This removes the container after the task is complete.<!--MAGECLOUD-4205-->

   -  ![new icon](../../assets/new.svg) **Updates to `build:compose` command**—

      -  ![new icon](../../assets/new.svg) Added the `--sync-engine="native"` option to the `docker-build` command to disable file synchronization when you generate the Docker Compose configuration file in developer mode. Use this option when developing on Linux systems, which do not require file synchronization for local Docker development. See [Synchronizing data in the Docker environment](https://developer.adobe.com/commerce/cloud-tools/docker/setup/synchronize-data/).<!--MCLOUD-3231, MCLOUD-3890-->

   -  ![new icon](../../assets/new.svg) Changed the default file synchronization setting from `docker-sync` to `native`. [Fix submitted by Mathew Beane from Zilker Technology](https://github.com/magento/magento-cloud-docker/pull/124).<!--MAGECLOUD-5066-->

-  ![new icon](../../assets/new.svg) **Validation improvements**—

   -  ![new icon](../../assets/new.svg) Added validation to the deployment process for local Docker development environments to verify that the Cloud environment configuration includes the encryption key required to decrypt the database. Now, you get an error message in the log if the environment configuration does not specify a value for the encryption key.<!--MAGECLOUD-4423-->

   -  ![new icon](../../assets/new.svg) Added a container health check to the Elasticsearch service to ensure that the service is ready before continuing with build and deploy processing. If the health check returns an error, the container restarts automatically.<!--MAGECLOUD-4456-->
