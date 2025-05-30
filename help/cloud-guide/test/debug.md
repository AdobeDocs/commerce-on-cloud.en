---
title: Configure [!DNL Xdebug]
description: Learn how to configure the Xdebug extension for debugging your Adobe Commerce on cloud infrastructure project development.
exl-id: 32857c9c-4a49-4337-9c15-a6e46c328df7
---
# Configure Xdebug

[!DNL Xdebug] is an extension for debugging your PHP. Although you can use an IDE of your choice, the following explains how to configure [!DNL Xdebug] and [!DNL PhpStorm] to debug in your local environment.

>[!NOTE]
>
>You can configure [!DNL Xdebug] to run in the Cloud Docker environment for local debugging without changing your Adobe Commerce on cloud infrastructure project configuration. See [Configure Xdebug for Docker](https://developer.adobe.com/commerce/cloud-tools/docker/test/configure-xdebug/).

To enable [!DNL Xdebug], you must configure a file in your Git repository, configure your IDE, and set up port forwarding. You can configure some settings in the `magento.app.yaml` file. After editing, push the Git changes across all Starter environments and Pro integration environments to enable [!DNL Xdebug]. [!DNL Xdebug] is already available in Pro Staging & Production environments.

Once configured, you can debug CLI commands, web requests, and code. Remember that all cloud infrastructure environments are read-only. Clone the code to your local development environment to perform debugging. For Pro Staging and Production environments, see [additional instructions](#debug-for-pro-staging-and-production) for [!DNL Xdebug].

## Requirements

To run and use [!DNL Xdebug], you need the SSH URL for the environment. You can locate the information through the [[!DNL Cloud Console]](../project/overview.md) or your [!DNL Cloud Onboarding UI].

## Configure Xdebug

To configure [!DNL Xdebug], follow these steps:

-  [Work in a branch to push file updates](#get-started-with-a-branch)
-  [Enable [!DNL Xdebug] for environments](#enable-xdebug-in-your-environment)
-  [Configure PHPStorm server](#configure-phpstorm-server)
-  [Set up port forwarding](#set-up-port-forwarding)

### Get started with a branch

To add [!DNL Xdebug], Adobe recommends working in [a development branch](../dev-tools/cloud-cli-overview.md#create-an-environment-branch).

### Enable Xdebug in your environment

You can enable [!DNL Xdebug] directly to all Starter environments and Pro integration environments. This configuration step is not required for Pro Production & Staging environments. See [Debug for Pro Staging and Production](#debug-for-pro-staging-and-production).

>[!VIDEO](https://video.tv.adobe.com/v/3437407?learn=on)

To enable [!DNL Xdebug] for your project, add `xdebug` to the `runtime:extensions` section of the `.magento.app.yaml` file.

**To enable Xdebug**:

1. In your local terminal, open the `.magento.app.yaml` file in a text editor.

1. In the `runtime` section, under `extensions`, add `xdebug`. For example:

   ```yaml
   runtime:
       extensions:
           - redis
           - xsl
           - newrelic
           - sodium
           - xdebug
   ```

1. Save your changes to the `.magento.app.yaml` file and exit the text editor.

1. Add, commit, and push the changes to redeploy the environment.

   ```bash
   git add .magento.app.yaml
   ```

   ```bash
   git commit -m "add xdebug"
   ```

   ```bash
   git push origin <environment-ID>
   ```

When deployed to Starter environments and Pro integration environments, [!DNL Xdebug] is now available. Continue configuring your IDE. For PhpStorm, see [Configure PhpStorm](#configure-phpstorm).

### Configure PhpStorm Server

>[!VIDEO](https://video.tv.adobe.com/v/3437409?learn=on)

The [PhpStorm](https://www.jetbrains.com/phpstorm/) IDE must be configured to properly work with [!DNL Xdebug].

**To configure PhpStorm to work with Xdebug**:

1. In your PhpStorm project, open the **Settings** panel.

   -  _macOS_—Select **PhpStorm** > **Settings**.
   -  _Windows/Linux_—Select **File** > **Settings**.

1. In the _Settings_ panel, expand the **PHP** section and click on **Servers**.

1. Click the **+** to add a server configuration. The project name is in gray at the top.

1. [Optional] Configure the following settings for the new server configuration. See [No debug server configured](https://www.jetbrains.com/help/phpstorm/troubleshooting-php-debugging.html#no-debug-server-is-configured) in the _PHPStorm_ documentation.

   -  **Name**—Enter the same as the hostname. This value must match the value for the `PHP_IDE_CONFIG` variable in [Debug CLI commands](#debug-cli-commands) to use CLI for debugging.
   -  **Host**—Enter the hostname.
   -  **Port**—Enter `443`.
   -  **Debugger**—Select `Xdebug`.

1. Select **Use path mappings**. In the _File/Directory_ pane, the root of the project for the `serverName` displays.

1. In the **Absolute path on the server** column, click the **Edit** icon and add a setting based on the environment.

   -  For all Starter environments and Pro integration environments, the remote path is `/app`.
   -  For Pro Staging and Production environments:

      -  Production: `/app/<project_code>/`
      -  Staging:  `/app/<project_code>_stg/`

1. Change the [!DNL Xdebug] port to `9000,9003` or you can limit it to just `9000` in the **PHP** > **Debug** > **Xdebug** > **Debug Port** panel.

1. Click **Apply**.

### Create the PHPStorm Run/Debug configuration

This enables the application to have the correct debug settings to handle the request from the Adobe Commerce application.

>[!VIDEO](https://video.tv.adobe.com/v/3437426?learn=on)

1. Open the PHPStorm application and click **[!UICONTROL Add Configuration]** in the upper-right side of the screen.

1. Click **[!UICONTROL Add new run configuration]**.

1. Select the **[!UICONTROL PHP Remote Debug]** option.

   - Enter a unique, but recognizable name.
   - Check the [!UICONTROL Filter debug connection by IDE key]** checkbox.
   - Select the server that you created in the [previous section](#configure-phpstorm-server). If you have not created it yet, you can create one now, but refer to that part of the setup guide.
   - In the **[!UICONTROL IDE key(session id)]** text field, enter `PHPSTORM` in capital letters. We will be using this in other parts of the setup, so keeping this the same is important. If you choose another string, you must remember to use it elsewhere in the setup and configuration process.

1. Click **[!UICONTROL Apply]** > **[!UICONTROL OK]**.

### Set up port forwarding

>[!VIDEO](https://video.tv.adobe.com/v/3437410?learn=on) 

Map the `XDEBUG` connection from the server to your local system. To do any type of debugging, you must forward port 9000 from your Adobe Commerce on cloud infrastructure server to your local machine. See one of the following sections:

-  [Port forwarding on Mac or UNIX&reg;](#port-forwarding-on-mac-or-unix)
-  [Port forwarding on Windows](#port-forwarding-on-windows)

#### Port forwarding on Mac or UNIX&reg;

**To set up port forwarding on a Mac or in a UNIX&reg; environment**:

1. Open a terminal.

1. Use SSH to establish the connection.

   ```bash
   ssh -R 9000:localhost:9000 <ssh url>
   ```

   Use the `-v` (verbose) option so that whenever a socket is connected to the port that is being forwarded it shows in the terminal.

   If an "unable to connect" or "could not listen to port on remote" error is displayed, there could be another active SSH session persisting on the server that is occupying port 9000. If that connection is not being used, you can terminate it.

**To troubleshoot the connection**:

1. Use SSH to log in to the remote integration, Staging, or Production environment.

1. View a list of SSH sessions: `who`

1. View existing SSH sessions by user. Be careful to not affect a user other than yourself!

   -  integration: usernames are similar to `dd2q5ct7mhgus`
   -  Staging: usernames are similar to `dd2q5ct7mhgus_stg`
   -  Production: usernames are similar to `dd2q5ct7mhgus`

1. For a user session that is older than yours, find the pseudo-terminal (PTS) value, such as `pts/0`.

1. Kill the process ID (PID) corresponding to the PTS value.

   ```bash
   ps aux | grep ssh
   kill <PID>
   ```

   Sample response:

   ```
   dd2q5ct7mhgus        5504  0.0  0.0  82612  3664 ?      S    18:45   0:00 sshd: dd2q5ct7mhgus@pts/0
   ```

   To terminate the connection, enter a kill command with the process ID (PID).

   ```bash
   kill 3664
   ```

#### Port forwarding on Windows

To set up port forwarding (SSH tunneling) on Windows, you must configure your Windows terminal application. This example steps through creating an SSH tunnel using [Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html). You can use other applications such as Cygwin. For more information on other applications, see the vendor documentation provided with those applications.

**To set up an SSH tunnel on Windows using Putty**:

1. If you have not already done so, download [Putty](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).

1. Start Putty.

1. In the Category pane, click **Session**.

1. Enter the following information:

   -  **Hostname (or IP address)** field: Enter the [SSH URL](../development/secure-connections.md#connect-to-a-remote-environment) for your Cloud server
   -  **Port** field: Enter `22`

   ![Set up Putty](../../assets/xdebug/putty-session.png)

1. In the _Category_ pane, click **Connection** > **SSH** > **Tunnels**.

1. Enter the following information:

   -  **Source port** field: Enter `9000`
   -  **Destination** field: Enter `127.0.0.1:9000`
   -  Click **Remote**

1. Click **Add**.

   ![Create an SSH tunnel in Putty](../../assets/xdebug/putty-tunnels.png)

1. In the _Category_ pane, click **Session**.

1. In the **Saved Sessions** field, enter a name for this SSH tunnel.

1. Click **Save**.

   ![Save your SSH tunnel](../../assets/xdebug/putty-session-save.png)

1. To test the SSH tunnel, click **Load**, then click **Open**.

   If an "unable to connect" error displays, verify the following:

   -  All Putty settings are correct
   -  You are running Putty on the machine on which your private Adobe Commerce on cloud infrastructure SSH keys are located

## SSH access to Xdebug environments

For initiating debugging, performing setup, and more, you need the SSH commands for accessing the environments. You can get this information through the [[!DNL Cloud Console]](../development/secure-connections.md#use-an-ssh-command) and your project spreadsheet.

For Starter environments and Pro integration environments, you can use the following `magento-cloud` CLI command to SSH into those environments:

```bash
magento-cloud environment:ssh --pipe -e <environment-ID>
```

To use [!DNL Xdebug], SSH to the environment as follows:

```bash
ssh -R <xdebug listen port>:<host>:<xdebug listen port> <SSH-URL>
```

For example,

```bash
ssh -R 9000:localhost:9000 pwga8A0bhuk7o-mybranch@ssh.us.magentosite.cloud
```

## Debug for Pro Staging and Production

>[!NOTE]
>
>On Pro Staging & Production environments, [!DNL Xdebug] is always available as these environments have a special setup for [!DNL Xdebug]. All normal web requests are routed to a dedicated PHP process that does not have [!DNL Xdebug]. Therefore, these requests are processed normally and are not subject to the performance degradation when [!DNL Xdebug] is loaded. When a web request is sent that has the [!DNL Xdebug] key, it is routed to a separate PHP process that has [!DNL Xdebug] loaded.

To use [!DNL Xdebug] specifically on Pro plan Staging and Production environment, you create a separate SSH tunnel and web session only you have access to. This usage differs from typical access, only providing access to you and not to all users.

You need the following:

-  SSH commands for accessing the environments. You can get this information through the [[!DNL Cloud Console]](../project/overview.md) or your [!DNL Cloud Onboarding UI].
-  The `xdebug_key` value set when configuring the Staging and Pro environments.

   The `xdebug_key` can be found by using SSH to log in to the primary node and executing:

   ```bash
   cat /etc/platform/*/nginx.conf | grep xdebug.sock | head -n1
   ```

**To set up an SSH tunnel to a Staging or Production environment**:

1. Open a terminal.

1. Clean up all SSH sessions for each web node of the cluster.

   ```bash
   ssh USERNAME@CLUSTER.ent.magento.cloud 'rm /run/platform/USERNAME/xdebug.sock'
   ```

1. Set up the SSH tunnel for Xdebug for each web node of the cluster.

   ```bash
   ssh -R /run/platform/USERNAME/xdebug.sock:localhost:9000 -N USERNAME@CLUSTER.ent.magento.cloud
   ```

>[!NOTE]
>
>To obtain the correct value for `USERNAME@CLUSTER.ent.magento.cloud`:
>- Method 1: magento-cloud CLI: `magento-cloud ssh --all`
>- Method 2: Commerce Console: https://CONSOLE-URL/ENVIRONMENT, click the `SSH v` dropdown

**To start debugging using the environment URL**:

This is a demonstration of the configurations used as well as a demonstration of the GET parameter to start a remote debugging session.

>[!VIDEO](https://video.tv.adobe.com/v/3437417?learn=on) 

1. Enable remote debugging; visit the site in the browser and append the following to the URL where `KEY` is value for `xdebug_key`.

   ```http
   ?XDEBUG_SESSION_START=KEY
   ```

   This step sets the cookie that sends browser requests to trigger [!DNL Xdebug].

1. Complete your debugging with [!DNL Xdebug].

1. When you are ready to end the session, use the following command to remove the cookie and end debugging through the browser where `KEY` is value for `xdebug_key`.

   ```http
   ?XDEBUG_SESSION_STOP=KEY
   ```

   >[!NOTE]
   >
   >The `XDEBUG_SESSION_START` passed by `POST` requests are not supported.

## Debug CLI commands

This section walks through debugging CLI commands.

To debug CLI commands:

1. SSH into the server you want to debug using CLI commands.

1. Create the following environment variables:

   ```bash
   export XDEBUG_CONFIG='PHPSTORM'
   ```

   ```bash
   export PHP_IDE_CONFIG="serverName=<name of the server that is configured in PHPSTORM>"
   ```

   These variables are removed when the SSH session ends.

1. Begin debugging

   On Starter environments and Pro integration environments, run the CLI command to debug.
   You may add runtime options, for example:

   ```bash
   php -d xdebug.profiler_enable=On -d xdebug.max_nesting_level=9999 bin/magento cache:clean
   ```

   On Pro Staging and Production environments, you must specify the path to the [!DNL Xdebug] PHP configuration file when debugging CLI commands, for example:

   ```bash
   php -c /etc/platform/USERNAME/php.xdebug.ini bin/magento cache:clean
   ```

## Debug web requests

The following steps help you debug web requests.

1. On the _Extension_ menu, click **Debug** to enable.

1. Right click, select the options menu, and set the IDE key to **PHPSTORM**.

1. Install the [!DNL Xdebug] client on the browser. Configure and enable it.

### Example: Chrome setup

This section discusses how to use [!DNL Xdebug] in Chrome using the [!DNL Xdebug] Helper extension. For information about [!DNL Xdebug] tools for other browsers, consult the browser documentation.

**To use Xdebug Helper with Chrome**:

1. Create an [SSH tunnel](#ssh-access-to-xdebug-environments) to the Cloud server.

1. Install the [Xdebug Helper extension](https://chromewebstore.google.com/detail/eadndfjplgieldjbigjakmdgkmoaaaoc) from the Chrome store.

1. Enable the extension in Chrome as shown in the following figure.

   ![Enable the Xdebug extension in Chrome](../../assets/xdebug/enable-chrome-ext.png)

1. In Chrome, right-click the green helper icon in the Chrome toolbar.

1. From the pop-up menu, click **Options**.

1. From the _IDE Key_ list, click **PhpStorm**.

1. Click **Save**.

   ![Xdebug Helper options](../../assets/xdebug/helper-options.png)

1. Open your PhpStorm project.

1. In the top navigation bar, click the **Start listening** icon.

   If the navigation bar is not displayed, click **View** > **Navigation Bar**.

1. In the PhpStorm navigation pane, double-click the PHP file to test.

## Debug local code

Because of the read-only environments, you must pull code to the local workstation from an environment or specific Git branch to perform debugging.

The method you choose is up to you. You have the following options:

-  Check out code from Git and run `composer install`

   This method works unless `composer.json` references packages in private repositories to which you do not have access. This method results in getting the entire Adobe Commerce codebase.

-  Copy the `vendor`, `app`, `pub`, `lib`, and `setup` directories

   This method results in your having all code you can possibly test. Depending on how many static assets you have, it could result in a long transfer with a large volume of files.

-  Copy the `vendor` directory only

   Because most of the code is in the `vendor` directory, this method is likely to result in good testing, although are not testing the entire codebase.

**To compress files and copy them to your local machine**:

1. Use SSH to log in to the remote environment.

1. Compress the files.

   ```bash
   tar -czf /tmp/<file-name>.tgz <directory list>
   ```

   For example, to compress the `vendor` directory only:

   ```bash
   tar -czf /tmp/vendor.tgz vendor
   ```

1. On your local environment, use PhpStorm to compress the files.

   ```bash
   cd <phpstorm project root dir>
   ```

   ```bash
   rsync <SSH-URL>:/tmp/<file-name>.tgz .
   ```

   ```bash
   tar xzf <file-name>.tgz
   ```
