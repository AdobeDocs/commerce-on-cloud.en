---
title: Optimize cloud deployment
description: Learn about ways to optimize the deployment process for Adobe Commerce on cloud infrastructure projects, including reducing downtime, static content deployment, scenario-based deployment, and smart wizards.
feature: Cloud, Deploy, SCD
exl-id: 4315e2f4-06af-4a5c-9db9-e7b2f63660df
TQID: https://experienceleague.adobe.com/bd9n9CFrpyn1UZG6SX8qkoZGBOFd2N7z9Hoa1hQ8rew
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
  - id: cdd65e7e-8839-44a2-bc21-0e03623b5dd1
    internal-label: Optimization
---
# Optimize deployment

Site performance can suffer during the deployment process. The length of time a site is in maintenance mode when deploying to a production site depends on many factors, such as environment configuration and the amount of content a site contains. The first best practice for optimizing your Cloud deployment is to [upgrade to use `ece-tools`](../dev-tools/install-package.md) to benefit from the package features, such as commands to create a backup of the database and verify environment configuration.

The following topics can help you to better understand how to optimize the deployment process:

-  [Cloud deployment process](process.md)
    There are three phases in the Cloud deployment process, and you can use the strengths and weaknesses of each phase to your advantage.

-  [Zero downtime deployment](reduce-downtime.md)
    Understand what happens during deployment and how to reduce the amount of downtime your store experiences during an update to the Production environment.

-  [Static content deployment](static-content.md)
    The best way to optimize your Cloud deployment is to control how and when to generate static content.

-  [Smart wizards](smart-wizards.md)
    The `ece-tools` package provides the smart wizard commands to quickly evaluate your project configuration.

-  [Track deployments with New Relic](../monitor/track-deployments.md)
   Use the New Relic service to monitor deployment events and analyze deployment impact to overall performance.

