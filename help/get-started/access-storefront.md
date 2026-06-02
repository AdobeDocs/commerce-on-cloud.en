---
title: Access your Commerce Admin panel
description: Learn how to access your Commerce Admin panel.
recommendations: noDisplay, catalog
exl-id: 827417b0-9048-44d8-8c82-07befba476c7
TQID: https://experienceleague.adobe.com/V3BXuCc9aqT5YuyIS8WAZgUdPAYNhQunAgg2i2FCaOs
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: ba9e5be9-7de1-4f71-a5d2-baead0e425ee
    internal-label: Security
  - id: dac87252-6066-4d6e-a9d2-f6d84c323de7
    internal-label: Configuration
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
topic_v2:
  - id: d095671a-1355-40aa-8b5f-06c33c68080b
    internal-label: Security
  - id: e1e0219c-f879-479f-8427-888ed2a6e9c2
    internal-label: Insights
---
# Access your Commerce Admin panel

Users that have administrative access to the Commerce Admin panel can add users, configure store services, complete store setup and customization work, and more.

For a new project, the first step after receiving the welcome email is to secure Admin access to the project by changing the password on the License Owner account. The default username for this account is the License Owner email address.

You can submit a password change request using either of the following methods:

- Locate the welcome email sent to the License Owner email address and follow the link and change your password.

- Copy the store URL from the [[!DNL Cloud Console]](../cloud-guide/project/overview.md) into a browser. Then, append `/admin` to the end of the URL to open the sign-in page. Click the **Forgot password?** link to send a password change request to the License Owner email address.

After you submit the password change request, check your email for the password reset notification. If you do not get the email, check your spam folder.

>[!TIP]
>
>If the password reset fails or you cannot sign in to the Admin panel, a user with admin access can connect to the project using SSH and add an admin user using the `admin:user:create` CLI command. See [Create, edit, or unlock an administrator account](https://experienceleague.adobe.com/docs/commerce-operations/installation-guide/tutorials/admin.html) in the _Installation guide_.

## Monitor site health

The [Site-Wide Analysis Tool](https://experienceleague.adobe.com/en/docs/commerce-operations/tools/site-wide-analysis-tool/intro) is a proactive self-service tool and central repository that includes detailed system insights and recommendations to ensure the security and operability of your Adobe Commerce installation. It provides 24/7 real-time performance monitoring, reports, and advice to identify potential issues and better visibility into site health, safety, and application configurations. It helps reduce resolution time and improve site stability and performance. You can access the Site-Wide Analysis Tool directly from the [Admin panel](https://experienceleague.adobe.com/en/docs/commerce-operations/tools/site-wide-analysis-tool/access#option-2-logging-in-to-your-site-wide-analysis-tool-dashboard-from-your-stores-admin-panel).
