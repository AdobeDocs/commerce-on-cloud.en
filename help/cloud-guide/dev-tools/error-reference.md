---
title: Error messages for ECE-Tools package
description: See a list of error codes and messages that can occur during the Adobe Commerce on cloud infrastructure build, deploy, and post-deploy processes.
recommendations: noDisplay
role: Developer
exl-id: e240c268-b171-44e9-9fa4-f0e91b0d9899
---
# Error messages for ECE-Tools

This error message reference provides information to troubleshoot errors that can occur during the Adobe Commerce on cloud infrastructure build, deploy, and post-deploy processes.

All critical and warning error messages that occur during deployment are written to both the `var/log/cloud.log` and `/var/log/cloud.error.log` files. The cloud error log file contains only errors from the latest deployment. An empty file indicates a successful deployment with no errors.

In the `cloud.error.log` file, each entry is formatted as a JSON string for easier parsing:

```json
{"errorCode":1006,"stage":"build","step":"validate-config","suggestion":"No stores/website/locales found in config.php\n  To speed up the deploy process do the following:\n  1. Using SSH, log in to your Magento Cloud account\n  2. Run \"php ./vendor/bin/ece-tools config:dump\"\n  3. Using SCP, copy the app/etc/config.php file to your local repository\n  4. Add, commit, and push your changes to the app/etc/config.php file","title":"The configured state is not ideal","type":"warning"}
```

Error messages are categorized by one of the deployment stages: build, deploy, and post-deploy. Each section provides a list of associated errors with the following information for each error:

-  **Error code**: The Adobe Commerce-assigned identifier for the error message
-  **Stage**: Indicates whether the error occurred during the build, deploy, or post-deploy stage
-  **Step**: Indicates the step in the deployment scenario that can return the error. If the _Step_ column is blank, the error is a general error that can be returned by multiple steps, or during pre-processing operations. See [Scenario-based deployment](../deploy/scenario-based.md) for more information about the build, deploy, and post-deploy steps.
-  **Suggestion**: Provides guidance to troubleshoot and resolve the error
-  **Title (Error description)**: A description that summarizes the cause of the error
-  **Type**: Indicates whether the error is a critical error or a warning

{{$include /help/_includes/automated/ece-tools-error-codes.md}}

<!-- Last updated from includes: 2025-05-28 21:01:41 -->
