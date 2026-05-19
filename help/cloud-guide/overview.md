---
title: Commerce on Cloud Infrastructure
description: Learn about building, deploying, and managing Commerce on Cloud infrastructure.
exl-id: a37d0403-df14-4bb9-8cc4-25436560ba0c
TQID: https://experienceleague.adobe.com/-sgz85xapPKNipyFVB4yMrLilEku3ff5IJg3OddymsA
product_v2:
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
feature_v2:
  - id: ba9e5be9-7de1-4f71-a5d2-baead0e425ee
    internal-label: Security
  - id: dac87252-6066-4d6e-a9d2-f6d84c323de7
    internal-label: Configuration
  - id: e8818fe6-9c8b-4bc0-9ef8-377a10b7bc75
    internal-label: Architecture
subfeature_v2:
  - id: f8ddfd3b-6194-46e8-a176-0e918039be56
    internal-label: Cloud architecture
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
topic_v2:
  - id: d095671a-1355-40aa-8b5f-06c33c68080b
    internal-label: Security
---
# Commerce on Cloud Infrastructure

Adobe Commerce on cloud infrastructure provides an automated hosting platform with a **self-service** approach to building, deploying, and managing your [!DNL Commerce] application in a cloud-native environment. Adobe Commerce on cloud infrastructure comes with additional features that set it apart from the on-premises Adobe Commerce and Magento Open Source platforms:

- A pre-provisioned infrastructure that includes PHP, MySQL (MariaDB), Redis, message queue services ([!DNL RabbitMQ] or [!DNL ActiveMQ]), and supported search engine technologies.
- Git-based workflow with automatic build and deploy for efficient Rapid development and Continuous deployment every time you push code changes in a Platform as a Service (PaaS) environment.
- Highly Customizable environment configuration files and command-line interface (CLI) manage and deploy tools.
- Amazon Web Services (AWS) hosting that offers a Scalable and Secure environment for online sales and retailing.

![Cloud benefits](../assets/CloudBenefits.svg)

>[!NOTE] 
>
>For more information on security, refer to the [security launch checklist](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/launch/checklist#security-configuration).

View the [Technology stack](architecture/tech-stack.md) in detail or learn more about specific features and supported products in [Cloud architecture for Commerce](architecture/cloud-architecture.md).

<div id="recs-overview-body-1"></div>
<div id="recs-overview-body-2"></div>
<div id="recs-overview-body-3"></div>
<div id="recs-overview-body-4"></div>
<div id="recs-overview-body-5"></div>
<div id="recs-overview-body-6"></div>

## Cloud regions

The following sections provide details about the different AWS and Azure regions that are available for Adobe Commerce on cloud infrastructure.

## AWS regions

![Diagram showing AWS regions](../assets/aws-regions.svg){zoomable="yes"}

>[!NOTE]
>
> Only on-premises in China and Russia.

## Azure regions

![Diagram showing Azure regions](../assets/azure-regions.svg){zoomable="yes"}

>[!NOTE]
>
> Only on-premises in China and Russia. All merchants that require Integration environments must use US regions.

## Adobe Commerce documentation

The Commerce on cloud infrastructure guide assumes that you have some working knowledge and understanding of the Adobe Commerce application. You can refer to the [!DNL Commerce] Developer and User guides below:

- [Adobe Commerce Developer Documentation](https://developer.adobe.com/commerce/docs/) (Adobe Developer site)—Develop, customize, integrate, extend, and use advanced capabilities

- [Adobe Commerce Documentation](https://experienceleague.adobe.com/docs/commerce.html) (Adobe Experience League)—Plan, implement, operate, upgrade, and maintain your [!DNL Commerce] projects

{{$include /help/_includes/templated/whats-new.md}}


<!-- Last updated from includes: 2026-05-07 12:29:15 -->
