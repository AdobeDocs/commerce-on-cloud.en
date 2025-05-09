---
title: Redirects
description: Learn how to manage redirection rules for your Adobe Commerce on cloud infrastructure project.
feature: Cloud, Routes
exl-id: f70a9035-bbae-4d23-bb7c-c0de6a7ccf6c
---
# Redirects

Managing redirection rules is a common requirement for web applications, especially in cases where you do not want to lose incoming links that have changed or been removed over time.

The following demonstrates how to manage redirection rules on your Adobe Commerce on cloud infrastructure projects using the `routes.yaml` configuration file. If the redirection methods discussed in this topic do not work for you, you can use caching headers to do the same thing.

{{route-placeholder}}

## Updates to Pro environments

{{pro-self-service-warning}}

>[!WARNING]
>
>For Adobe Commerce on cloud infrastructure projects, configuring numerous non-regex redirects and rewrites in the `routes.yaml` file can cause performance issues. If your `routes.yaml` file is 32 KB or larger, offload your non-regex redirects and rewrites to Fastly. See [Offload non-regex redirects to Fastly instead of Nginx (routes)](https://experienceleague.adobe.com/docs/commerce-knowledge-base/kb/troubleshooting/miscellaneous/offload-non-regex-redirects-to-fastly-instead-of-nginx-routes.html) in the _Adobe Commerce Help Center_.

## Whole-route redirects

Using whole-route redirects, you can define simple routes using the `routes.yaml` file. For example, you can redirect from an apex domain to a `www` subdomain as follows:

```yaml
http://{default}/:
    type: redirect
    to: http://www.{default}/
```

## Partial-route redirects

In the `.magento/routes.yaml` file, you can add partial redirect rules to existing routes based on pattern matching:

```yaml
http://{default}/:
    redirects:
        expires: 1d
        paths:
          "/from": { to: "http://example.com/" }
          "/regexp/(.*)/matching": { to: "http://example.com/$1", regexp: true }
```

Partial redirects work with any type of route, including routes served directly by the application.

Two keys are available under `redirects`:

-  **expires**—Optional, specifies the amount of time to cache the redirect in the browser. Examples of valid values include `3600s`, `1d`, `2w`, `3m`.

-  **paths**—One or more key-value pairs that specify the configuration for partial-route redirect rules.

   For each redirect rule, the key is an expression to filter request paths for redirection. The value is an object that specifies the target destination for the redirect and options for processing the redirect.

   The value object has the following properties:

   | Property   | Description |
   | ---------- | ----------- |
   | `to`       | Required, a partial absolute path, URL with protocol and host, or pattern that specifies the target destination for the redirect rule. |
   | `regexp`   | Optional, defaults to `false`. Specifies whether the path key should be interpreted as a PCRE regular expression. |
   | `prefix`   | Specifies whether the redirect applies to both the path and all its children, or just the path itself. Defaults to `true`. This value is not supported if `regexp` is `true`. |
   | `append_suffix`| Determines if the suffix is carried over with the redirect. Defaults to `true`. This value is not supported if the `regexp` key is `true` or* if the `prefix` key is `false`. |
   | `code`     | Specifies the HTTP status code. Valid status codes are [`301` (Moved Permanently)](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html#sec10.3.2), [`302`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html#sec10.3.3), [`307`](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html#sec10.3.8), and [`308`](https://www.rfc-editor.org/rfc/rfc7238). Defaults to `302`. |
   | `expires`  | Optional, specifies the amount of time to cache the redirect in the browser. Defaults to the `expires` value defined directly under the `redirects` key, but at this level you can fine-tune the cache expiration for individual partial redirects. |

## Examples of partial-route redirects

The following examples show how to specify partial-route redirects in the `routes.yaml` file using various `paths` configuration options.

### Regular expression pattern matching

Use the following format to configure redirect requests based on a regular expression.

```yaml
http://{default}/:
    type: upstream
    redirects:
      paths:
        "/regexp/(.*)/match": { to: "http://example.com/$1", regexp: true }
```

This configuration filters request paths against a regular expression and redirects matching requests to `https://example.com`. For example, a request to `https://example.com/regexp/a/b/c/match` redirects to `https://example.com/a/b/c`.

### Prefix pattern matching

Use the following format to configure redirect requests for paths that begin with a specified prefix pattern.

```yaml
http://{default}/:
    type: upstream
    redirects:
      paths:
        "/from": { to: "https://{default}/to", prefix: true }
```

This configuration works as follows:

-  Redirects requests that match the pattern `/from` to the path `http://{default}/to`.

-  Redirects requests that match the pattern `/from/another/path` to `https://{default}/to/another/path`.

-  If you change the `prefix` property to `false`, requests that match the `/from` pattern trigger a redirect, but requests that match the `/from/another/path` pattern do not.

### Suffix pattern matching

Use the following format to configure redirect requests which append the path suffix from the request to the target destination:

```yaml
http://{default}/:
    type: upstream
    redirects:
      paths: "/from": { to: "https://{default}/to", append_suffix: false }
```

This configuration works as follows:

-  Redirects requests that match the pattern `/from/path/suffix` to the path `https://{default}/to`.

-  If you change the `append_suffix` property to `true`, then requests that match `/from/path/suffix`  redirect to the path `https://{default}/to/path/suffix`.

### Path-specific cache configuration

Use the following format to customize the time to cache a redirect from a specific path:

```yaml
http://{default}/:
    type: upstream
    redirects:
    expires: 1d
      paths:
        "/from": { to: "https://example.com/" }
        "/here": { to: "https://example.com/there", expires: "2w" }
```

This configuration works as follows:

-  Redirects from the first path (`/from`) are cached for one day.

-  Redirects from the second path (`/here`) are cached for two weeks.
