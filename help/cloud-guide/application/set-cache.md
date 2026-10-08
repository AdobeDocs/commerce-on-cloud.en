---
title: Set cache for static files
description: Learn to set cache storage options in the [!DNL Commerce] application configuration file.
feature: Cloud, Configuration, Cache, SCD
exl-id: 0f577974-85d7-4972-8f03-856aa6accaae
TQID: 'https://experienceleague.adobe.com/ZA0WRB9p4Gpi7kjWxNPS5uCSfaTmrkrqxc4SgC9y9og'
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: dac87252-6066-4d6e-a9d2-f6d84c323de7
    internal-label: Configuration
  - id: 5a951749-fac9-5bc7-9a98-ebe4ff066437
    internal-label: Cloud
  - id: d05f97c9-0a96-5792-92cf-f66ce7326e3a
    internal-label: SCD
  - id: e7dae43f-215c-4cdf-90d3-c5a461a6e669
    internal-label: Admin tools and workspace
subfeature_v2:
  - id: b673188e-f9fa-492a-b470-c8f949bf7827
    internal-label: Cache
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Set cache for static files

The cache TTL (time-to-live) for your media and static files is set in the `.magento.app.yaml` configuration file using the `expires` key.

>[!NOTE]
>
>Before updating your Production environment, it is important to test changes in your Staging environment. [Submit an Adobe Commerce Support ticket](https://experienceleague.adobe.com/en/docs/support-resources/adobe-support-tools-guide/adobe-commerce-support/adobe-commerce-help-center-user-guide#submit-ticket) for help with updating the configuration on these environments.

1. Specify the TTL time (in seconds) in the [`web` property](web-property.md) of the `.magento.app.yaml` file. You can add the `expires` key under `locations` or under `"/media"` and `"/static"`.

   To prevent the cache from expiring, use the `expires: -1` key-value pair. See the following example:

   ```yaml
   # The configuration of app when it is exposed to the web.
   web:
     locations:
       "/media":
         ...
         expires: -1

       "/static":
         ...
         expires: -1
   ```

1. Add, commit, and push your code changes.

   ```bash
   git add -A && git commit -m "Set cache TTL for static files" && git push origin <branch-name>
   ```

