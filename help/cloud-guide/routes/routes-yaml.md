---
title: Configure routes
description: Learn how to define the routes for incoming HTTPS requests for the Adobe Commerce on cloud infrastructures environments.
feature: Cloud, Configuration, Routes
exl-id: f0d6eefa-1122-4753-8a7c-1fa0c77590f0
---
# Configure routes

The `routes.yaml` file in the `.magento/routes.yaml` directory defines routes for your Adobe Commerce on cloud infrastructure Integration, Staging, and Production environments. Routes determine how the application processes incoming HTTP and HTTPS requests.

The default `routes.yaml` file specifies the route templates for processing HTTP requests as HTTPS on projects that have a single default domain and on projects configured for multiple domains:

```yaml
"http://{default}/":
    type: upstream
    upstream: "mymagento:http"
"http://{all}/":
    type: upstream
    upstream: "mymagento:http"
```

Use the `magento-cloud` CLI to view a list of the configured routes:

```bash
magento-cloud environment:routes

+-------------------+----------+---------------+
| Route             | Type     | To            |
+-------------------+----------+---------------+
| http://{default}/ | upstream | mymagento     |
+-------------------+----------+---------------+
```

## Configuration updates to Pro environments

{{pro-self-service-warning}}

## Route templates

The `routes.yaml` file is a list of templated routes and their configurations. You can use the following placeholders in route templates:

-  The `{default}` placeholder represents the qualified domain name configured as the default for the project.

   For example, a project with the default domain `example.com` and the following route templates:

   ```text
   https://www.{default}/
   https://{default}/blog
   ```

   These templates resolve to the following URLs in a production environment:

   ```text
   https://www.example.com/
   https://example.com/blog
   ```

-  The `{all}` placeholder represents all the domain names configured for the project.

    For example, a project with `example.com` and `example1.com` domains with the following route templates:

    ```text
    https://www.{all}/

    https://{all}/blog
    ```

    These templates resolve to the following routes for all domains in the project:

    ```text
    https://www.example.com/

    https://www.example1.com/

    https://example.com/blog

    https://example1.com/blog
    ```

    The `{all}` placeholder is useful for projects configured for multiple domains. In a non-production branch, `{all}` is replaced with the project ID and environment ID for each domain.

    If a project does not have any domains configured, which is common during development, the `{all}` placeholder behaves in the same way as the `{default}` placeholder.

Adobe Commerce also generates routes for every active integration environment. For integration environments, the `{default}` placeholder is replaced with the following domain name:

```text
[branch]-[per-environment-random-string]-[project-id].[region].magentosite.cloud
```

For example, the `refactorcss` branch for the `mswy7hzcuhcjw` project hosted in the `us` cluster has the following the domain:

```text
https://refactorcss-oy3m2pq-mswy7hzcuhcjw.us.magentosite.cloud/
```

>[!NOTE]
>
>If your Cloud project supports multiple stores, follow the route configuration instructions for [multiple websites or stores](../store/multiple-sites.md).

### Trailing slash

Route definitions contain a trailing slash to indicate a folder or directory; however, the same content can be served with or without a trailing slash. The following URLs resolve the same but can be interpreted as _two different_ URLs:

```text
https://www.example.com/blog/

https://www.example.com/blog
```

>[!TIP]
>
>It is a best practice to use a trailing slash for directories, but whichever method you choose, it is important to **stay consistent** to avoid generating two locations.

## Route protocols

All environments support both HTTP and HTTPS automatically.

-  If the configuration specifies only the HTTP route, HTTPS routes are created automatically, allowing the site to be served from both HTTP and HTTPS without requiring redirects.

   For example, a project with the default domain `example.com` and the following route template:

   ```text
   http://{default}/
   ```

   This template resolves to the following URLs:

   ```text
   http://example.com/

   https://example.com/
   ```

-  If the configuration specifies only the HTTPS route, then all HTTP requests redirect to HTTPS.

   For example, a project with the default domain `example.com` with the following route template:

   ```text
   https://{default}/
   ```

   This template resolves to the following URL:

   ```text
   https://example.com/
   ```

   It also processes the following redirect:

   `http://example.com/` ==> `https://example.com/`

Serve all pages over TLS. For this configuration, you must configure redirects for all unencrypted request to the TLS equivalent using one of the following methods:

-  Change the protocol to HTTPS in the `routes.yaml` file.

   ```yaml
   "https://{default}/":
       type: upstream
       upstream: "mymagento:http"
   "https://{all}/":
       type: upstream
       upstream: "mymagento:http"
   ```

-  For Staging and Production environments, enable the [Force TLS on Fastly](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/how-to/redirect-http-to-https-for-all-pages-on-cloud-force-tls.html) option from the Admin UI. When you use this option, Fastly handles the redirection to HTTPS, so you do not have to update the `routes.yaml` configuration.

## Route options

Configure each route separately using the following properties:

| Property         | Description |
| ---------------- | ----------- |
| `type: upstream` | Serves an application. Also, it has an `upstream` property that specifies the name of the application (as defined in `.magento.app.yaml`) followed by the `:http` endpoint. |
| `type: redirect` | Redirects to another route. It is followed by the `to` property, which is an HTTP redirection to another route identified by its template. |
| `cache:`         | Controls [caching for the route](caching.md). |
| `redirects:`     | Controls [redirect rules](redirects.md). |
| `ssi:`           | Controls enabling of [Server Side Includes](server-side-includes.md). |

## Simple routes

In the following examples, the route configuration routes the apex domain and the `www` subdomain to the `mymagento` application. This route does not redirect HTTPS requests.

**Example 1:**

```yaml
"http://{default}/":
    type: upstream
    upstream: "mymagento:http"

"http://www.{default}/":
    type: redirect
    to: "http://{default}/"
```

In this example, the request routing follows these rules:

-  The server responds directly to requests with the following URL pattern:

   ```text
   http://example.com/path
   ```

-  The server issues a _301 redirect_ for requests with the following URL pattern:

   ```text
   http://www.example.com/mypath
   ```

   These requests redirect to the apex domain, for example:

   ```text
   http://example.com/mypath
   ```

In the following example, the route configuration does not redirect URLs from the www domain to the apex domain. Instead, requests are served from both the www and apex domain.

**Example 2:**

```yaml
"http://{default}/":
    type: upstream
    upstream: "mymagento:http"

"http://www.{default}/":
    type: upstream
    upstream: "mymagento:http"
```

## Wildcard routes

Adobe Commerce on cloud infrastructure supports wildcard routes, so you can map multiple subdomains to the same application. This works for redirect and upstream routes. You prefix the route with an asterisk (\*). For example, the following routes to the same application:

-  `*.example.com`
-  `www.example.com`
-  `blog.example.com`
-  `us.example.com`

This functions as a catch-all domain in a live environment.

### Routing a non-mapped domain

You can route to a system that is not mapped to a domain using a dot (`.`) to separate the subdomain.

**Example:**

A project with an `add-theme` branch routes to the following URL:

```text
http://add-theme-projectID.us.magento.com/
```

If you define the following route template:

```text
http://www.{default}/
```

The route resolves to the following URL:

```text
http://www.add-theme-projectID.us.magento.com/
```

You can insert any subdomain before the dot and the route resolves.

**Example:**

Define the following route template:

```text
http://*.{default}/
```

This template resolves both of the following URLs:

```text
http://foo.add-theme-projectID.us.magentosite.cloud/
http://bar.add-theme-projectID.us.magentosite.cloud/
```

You can view the route pattern for non-mapped domains by establishing an SSH connection to the environment, and using the `magento-cloud` CLI to list the routes:

```bash
vendor/bin/ece-tools env:config:show routes

Magento Cloud Routes:
+------------------------------------------+--------------------------------------------------------------+
| Route configuration                      | Value                                                        |
+------------------------------------------+--------------------------------------------------------------+
| http://www.add-theme-projectID.us.magento.com/:                                                         |
+------------------------------------------+--------------------------------------------------------------+
| primary                                  | false                                                        |
| id                                       | null                                                         |
| attributes                               |                                                              |
| type                                     | upstream                                                     |
| to                                       | mymagento                                                    |
| original_url                             | https:/{default}/                                            |
+------------------------------------------+--------------------------------------------------------------+
| https://*.add-theme-projectID.us.magentosite.cloud/:                                                    |
+------------------------------------------+--------------------------------------------------------------+
| primary                                  | false                                                        |
| id                                       | null                                                         |
| attributes                               |                                                              |
| type                                     | upstream                                                     |
| to                                       | mymagento                                                    |
| original_url                             | https://*.{default}/                                         |
+------------------------------------------+--------------------------------------------------------------+
```

## Redirects and caching

As discussed in more detail in [Redirects](redirects.md), you can manage complex redirection rules, such as _partial redirects_, and specify rules for route-based [caching](caching.md):

```yaml
https://www.{default}/:
    type: redirect
    to: https://{default}/
https://{default}/:
    cache:
        cookies: [""]
        default_ttl: 0
        enabled: true
        headers:
            - Accept
            - Accept-Language
    ssi:
        enabled: false
    type: upstream
    upstream: mymagento:http
```
