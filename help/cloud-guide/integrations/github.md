---
title: GitHub integration
description: Learn how to integrate your Adobe Commerce on cloud infrastructure project with GitHub.
feature: Cloud, Integration
last-substantial-update: 2023-05-25
exl-id: 08e569fa-5ab4-45c0-82e6-476f25c17fe0
---
# GitHub integration

The GitHub integration enables you to manage your Adobe Commerce on cloud infrastructure environments directly from your GitHub repository. The integration manages content already in GitHub and synchronizes with your Adobe Commerce on cloud infrastructure code repository. In essence, the code repository becomes a mirror of the GitHub repository.

{{private-repository}}

This integration enables you to:

-  Create an environment when you create a branch
-  Redeploy the environment when you merge a pull request
-  Delete the environment when you delete the branch

You must obtain a GitHub token and a webhook to continue the process.

## Prerequisites

-  Administrator access to the Adobe Commerce on cloud infrastructure project
-  GitHub repository
-  GitHub personal access token

## Generate a GitHub token

Create a classic personal access token in GitHub developer settings. You must be a member of a group with write-access to the GitHub repository, so that you can _push_ to the repository. Include the following scopes when creating your token:

- `admin:repo_hook`—Create web hooks
- `repo`—Integrate with your repository
- `read:org`—Integrate with your organizational repository

 See [GitHub: Create](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

## Prepare your repository

Clone your Adobe Commerce on cloud infrastructure project from an existing environment and migrate the project branches to a new, empty GitHub repository, preserving the same branch names. It is **critical** to retain an identical Git tree, so that you do not lose any existing environments or branches in your Adobe Commerce on cloud infrastructure project.

1. From the terminal, log in to your Adobe Commerce on cloud infrastructure project.

   ```bash
   magento-cloud login
   ```

1. List your projects and copy the project ID.

   ```bash
   magento-cloud project:list
   ```

1. Clone the project to your local environment.

   ```bash
   magento-cloud project:get <project-ID>
   ```

1. Add your GitHub repository as a remote.

   ```bash
   git remote add origin git@github.com:<user-name>/<repo-name>.git
   ```

   The default name for the remote connection may be `origin` or `magento`. If `origin` exists, you can choose a different name or you can rename or delete the existing reference. See [git-remote documentation](https://git-scm.com/docs/git-remote).

1. Verify that you added the GitHub remote correctly.

   ```bash
   git remote -v
   ```

   Expected response:

   ```
   origin git@github.com:<user-name>/<repo-name>.git (fetch)
   origin git@github.com:<user-name>/<repo-name>.git (push)
   ```

1. Push the project files to your new GitHub repository. Remember to keep all branch names the same.

   ```bash
   git push -u origin master
   ```

   If you are starting with a new GitHub repository, you may have to use the `-f` option, because the remote repository does not match your local copy.

1. Verify that your GitHub repository contains all of your project files.

## Enable the GitHub integration

Before you begin, your project code and environments must be in the GitHub repository. After enabling the integration, the GitHub repository becomes the code source. If you push code changes to the original `magento` repository, it is overwritten by the integration when you push code changes to your GitHub repository.

The following enables the GitHub integration and provides a Payload URL to use when creating a webhook.

>[!WARNING]
>
>The following command overwrites _all_ code in your Adobe Commerce on cloud infrastructure project with code from your GitHub repository, which includes all branches, including the `production` branch. This action happens instantly and cannot be undone. As a best practice, it is important to clone all of your branches from your Adobe Commerce on cloud infrastructure project and push them to your GitHub repository **before** adding the GitHub integration.

You can choose to step through the CLI prompts using `magento-cloud integration:add` or you can build the integration command with the following options:

| Option                  | Required? | Description                       |
| ----------------------- | --------- | --------------------------------- |
| `--base-url`            | Yes       | The base URL of the server installation, which may be `https://github.com/` or a custom. Omit this option if your repository is hosted with public Github or if your repository is not hosted on private servers. Omit this option if your repository URL is similar to `https://github.com/{account}/{repository-name}`. This can cause errors like `Unable to connect to GitHub: repository not found`.  |
| `--token`               | Yes       | The personal access token that you generated for GitHub |
| `--repository`          | Yes       | The repository name: `owner-or-organisation/repository` |
| `--build-pull-requests` | Optional  | Instructs Adobe Commerce on cloud infrastructure to deploy after you merge a pull request (`true` by default) |
| `--fetch-branches`      | Optional  | Causes Adobe Commerce on cloud infrastructure to track branches and deploy after you update a branch (`true` by default) |
| `--prune-branches`      | Optional  | Delete branches that do not exist on the remote (`true` by default) |

There are many more options, and you can see them using the help option:

```bash
magento-cloud integration:add --help
```

**To enable the GitHub integration**:

1. Enable the integration.

   ```bash
   magento-cloud integration:add --type=github --project=<project-ID> --token=<your-GitHub-token> {--repository=USER/REPOSITORY | --repository=ORGANIZATION/REPOSITORY} [--build-pull-requests={true|false} --fetch-branches={true|false}
   ```

   **Example 1**: Enable the GitHub integration for a personal, private repository:

   ```bash
   magento-cloud integration:add --type=github --project=ov58dlacU2e --base-url=https://github.com --token=<token> --repository=myUserName/myrepo
   ```

   **Example 2**: Enable the GitHub integration for an organization repository:

   ```bash
   magento-cloud integration:add --type=github --project=ov58dlacU2e --base-url=https://github.com --token=<token> --repository=Magento/teamrepo
   ```

1. Enter the required information when prompted.

1. Copy the **Payload URL** displayed by the return output.

   ```
   Created integration <integration-ID> (type: github)
   Repository: myUserName/myrepo
   Build PRs: yes
   Fetch branches: yes
   Payload URL: https://us.magento.cloud/api/projects/<project-id>/integrations/wO8a0eoamxwcg/hook
   ```

## Add the webhook in GitHub

To communicate events—such as a push—with your Cloud Git server, you must create a webhook for your GitHub repository:

1. In your GitHub repository, click the **Settings** tab.

1. In the left navigation bar, click **Webhooks**.

1. In the _Webhooks_ pane, click **Add webhook**.

1. In the _Webhooks/Add webhook_ form, edit the following fields:

   -  **Payload URL**: Enter the URL returned when you enabled the GitHub integration.
   -  **Content type**: Choose **application/json** from the list.
   -  **Secret**: Enter a verification secret.
   -  **Which events would you like to trigger this webhook?**: Select **Send me everything**.
   -  Select the **Active** checkbox.

1. Click **Add webhook**.

## Test the integration

After configuring the GitHub integration, you can verify that the integration is operational using the `magento-cloud` CLI:

```bash
magento-cloud integration:validate
```

Or you can test it by pushing a simple change to your GitHub repository.

1. Create a test file.

   ```bash
   touch test.md
   ```

1. Commit and push the change to your GitHub repository.

   ```bash
   git add . && git commit -m "Testing GitHub integration" && git push
   ```

1. Log in to the [[!DNL Cloud Console]](../project/overview.md) and verify that your commit message is displayed and your project deploying.

## Remove the integration

You can safely remove the GitHub integration from your project without affecting your code.

**To remove the GitHub integration**:

1. From the terminal, log in to your Adobe Commerce on cloud infrastructure project.

1. List your integrations. You need the GitHub integration ID to complete the next step.

   ```bash
   magento-cloud integration:list
   ```

1. Delete the integration.

   ```bash
   magento-cloud integration:delete <int-ID>
   ```

Also, you can remove the GitHub integration by logging in to your GitHub account and removing the web hook in the _Webhooks_ tab of the repository _Settings_.
