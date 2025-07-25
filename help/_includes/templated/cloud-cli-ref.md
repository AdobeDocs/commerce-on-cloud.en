# magento-cloud (Adobe Commerce on cloud infrastructure)

<!-- The template to render with above values -->

**Version**: 1.46.1

This reference contains 119 commands available through the `magento-cloud` command-line tool.
The initial list is auto generated using the `magento-cloud list` command at Adobe Commerce on cloud infrastructure.

## General

This reference is generated from the application codebase. To change the content, you can update the source code for the corresponding command implementation in the [codebase](https://github.com/magento/magento-cloud-cli) repository and submit your changes for review. Another way is to _Give us feedback_ (find the link at the upper right). For contribution guidelines, see [Code Contributions](https://developer.adobe.com/commerce/contributor/guides/code-contributions/).

### Global options

#### `--help`, `-h`

Display this help message

- Default: `false`
- Does not accept a value

#### `--verbose`, `-v|-vv|-vvv`

Increase the verbosity of messages

- Default: `false`
- Does not accept a value

#### `--version`, `-V`

Display this application version

- Default: `false`
- Does not accept a value

#### `--yes`, `-y`

Answer "yes" to confirmation questions; accept the default value for other questions; disable interaction

- Default: `false`
- Does not accept a value

#### `--no-interaction`

Do not ask any interactive questions; accept default values. Equivalent to using the environment variable: MAGENTO_CLOUD_CLI_NO_INTERACTION=1

- Default: `false`
- Does not accept a value


## `clear-cache`

```bash
magento-cloud cc
```

Clear the CLI cache

### Options

For global options, see [Global options](#global-options).


## `decode`

```bash
magento-cloud decode [-P|--property PROPERTY] [--] <value>
```

Decode an encoded string such as MAGENTO_CLOUD_VARIABLES

### Arguments

#### `value`

The variable value to decode

- Required

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The property to view within the variable

- Requires a value


## `docs`

```bash
magento-cloud docs [--browser BROWSER] [--pipe] [--] [<search>]...
```

Open the online documentation

### Arguments

#### `search`

Search term(s)

- Default: `[]`
- Array
   
### Options

For global options, see [Global options](#global-options).

#### `--browser`

The browser to use to open the URL. Set 0 for none.

- Requires a value

#### `--pipe`

Output the URL to stdout.

- Default: `false`
- Does not accept a value


## `help`

```bash
magento-cloud help [--format FORMAT] [--raw] [--] [<command_name>]
```

Displays help for a command

```
The help command displays help for a given command:

  magento-cloud help list

You can also output the help in other formats by using the --format option:

  magento-cloud help --format=json list

To display the list of available commands, please use the list command.
```

### Arguments

#### `command_name`

The command name

- Default: `help`

### Options

For global options, see [Global options](#global-options).

#### `--format`

The output format (txt, json, or md)

- Default: `txt`
- Requires a value

#### `--raw`

To output raw command help

- Default: `false`
- Does not accept a value


## `list`

```bash
magento-cloud list [--raw] [--format FORMAT] [--all] [--] [<namespace>]
```

Lists commands

```
The list command lists all commands:

  magento-cloud list

You can also display the commands for a specific namespace:

  magento-cloud list project

You can also output the information in other formats by using the --format option:

  magento-cloud list --format=xml

It's also possible to get raw list of commands (useful for embedding command runner):

  magento-cloud list --raw
```

### Arguments

#### `command`

The command to execute

- Required


#### `namespace`

The namespace name

### Options

For global options, see [Global options](#global-options).

#### `--raw`

To output raw command list

- Default: `false`
- Does not accept a value

#### `--format`

The output format (txt, xml, json, or md)

- Default: `txt`
- Requires a value

#### `--all`

Show all commands, including hidden ones

- Default: `false`
- Does not accept a value


## `multi`

```bash
magento-cloud multi [-p|--projects PROJECTS] [--continue] [--sort SORT] [--reverse] [--] <cmd> (<cmd>)...
```

Execute a command on multiple projects

### Arguments

#### `cmd`

The command to execute

- Default: `[]`
- Required

- Array
   
### Options

For global options, see [Global options](#global-options).

#### `--projects`, `-p`

A list of project IDs, separated by commas and/or whitespace

- Requires a value

#### `--continue`

Continue running commands even if an exception is encountered

- Default: `false`
- Does not accept a value

#### `--sort`

A property by which to sort the list of project options

- Default: `title`
- Requires a value

#### `--reverse`

Reverse the order of project options

- Default: `false`
- Does not accept a value


## `web`

```bash
magento-cloud web [--browser BROWSER] [--pipe] [-p|--project PROJECT] [-e|--environment ENVIRONMENT]
```

Open the project in the Web UI

### Options

For global options, see [Global options](#global-options).

#### `--browser`

The browser to use to open the URL. Set 0 for none.

- Requires a value

#### `--pipe`

Output the URL to stdout.

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `activity:cancel`

```bash
magento-cloud activity:cancel [-t|--type TYPE] [-x|--exclude-type EXCLUDE-TYPE] [-a|--all] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<id>]
```

Cancel an activity

### Arguments

#### `id`

The activity ID. Defaults to the most recent cancellable activity.

### Options

For global options, see [Global options](#global-options).

#### `--type`, `-t`

Filter by type (when selecting a default activity). Values may be split by commas (e.g. "a,b,c") and/or whitespace. The % or * characters can be used as a wildcard for the type, e.g. '%var%' to select variable-related activities.

- Default: `[]`
- Requires a value

#### `--exclude-type`, `-x`

Exclude by type (when selecting a default activity). Values may be split by commas (e.g. "a,b,c") and/or whitespace. The % or * characters can be used as a wildcard to exclude types.

- Default: `[]`
- Requires a value

#### `--all`, `-a`

Check recent activities on all environments (when selecting a default activity)

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `activity:get`

```bash
magento-cloud activity:get [-P|--property PROPERTY] [-t|--type TYPE] [-x|--exclude-type EXCLUDE-TYPE] [--state STATE] [--result RESULT] [-i|--incomplete] [-a|--all] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT] [--] [<id>]
```

View detailed information on a single activity

### Arguments

#### `id`

The activity ID. Defaults to the most recent activity.

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The property to view

- Requires a value

#### `--type`, `-t`

Filter by type (when selecting a default activity). Values may be split by commas (e.g. "a,b,c") and/or whitespace. The % or * characters can be used as a wildcard for the type, e.g. '%var%' to select variable-related activities.

- Default: `[]`
- Requires a value

#### `--exclude-type`, `-x`

Exclude by type (when selecting a default activity). Values may be split by commas (e.g. "a,b,c") and/or whitespace. The % or * characters can be used as a wildcard to exclude types.

- Default: `[]`
- Requires a value

#### `--state`

Filter by state (when selecting a default activity): in_progress, pending, complete, or cancelled. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--result`

Filter by result (when selecting a default activity): success or failure

- Requires a value

#### `--incomplete`, `-i`

Include only incomplete activities (when selecting a default activity). This is a shorthand for --state=in_progress,pending

- Default: `false`
- Does not accept a value

#### `--all`, `-a`

Check recent activities on all environments (when selecting a default activity)

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value


## `activity:list`

```bash
magento-cloud activities [-t|--type TYPE] [-x|--exclude-type EXCLUDE-TYPE] [--limit LIMIT] [--start START] [--state STATE] [--result RESULT] [-i|--incomplete] [-a|--all] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT]
```

Get a list of activities for an environment or project

### Options

For global options, see [Global options](#global-options).

#### `--type`, `-t`

Filter activities by type Values may be split by commas (e.g. "a,b,c") and/or whitespace. The first part of the activity name can be omitted, e.g. 'cron' can select 'environment.cron' activities. The % or * characters can be used as a wildcard, e.g. '%var%' to select variable-related activities.

- Default: `[]`
- Requires a value

#### `--exclude-type`, `-x`

Exclude activities by type. Values may be split by commas (e.g. "a,b,c") and/or whitespace. The first part of the activity name can be omitted, e.g. 'cron' can exclude 'environment.cron' activities. The % or * characters can be used as a wildcard to exclude types.

- Default: `[]`
- Requires a value

#### `--limit`

Limit the number of results displayed

- Default: `10`
- Requires a value

#### `--start`

Only activities created before this date will be listed

- Requires a value

#### `--state`

Filter activities by state: in_progress, pending, complete, or cancelled. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--result`

Filter activities by result: success or failure

- Requires a value

#### `--incomplete`, `-i`

Only list incomplete activities

- Default: `false`
- Does not accept a value

#### `--all`, `-a`

List activities on all environments

- Default: `false`
- Does not accept a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: id*, created*, description*, progress*, state*, result*, completed, environments, type (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `activity:log`

```bash
magento-cloud activity:log [--refresh REFRESH] [-t|--timestamps] [--type TYPE] [-x|--exclude-type EXCLUDE-TYPE] [--state STATE] [--result RESULT] [-i|--incomplete] [-a|--all] [--date-fmt DATE-FMT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<id>]
```

Display the log for an activity

### Arguments

#### `id`

The activity ID. Defaults to the most recent activity.

### Options

For global options, see [Global options](#global-options).

#### `--refresh`

Activity refresh interval (seconds). Set to 0 to disable refreshing.

- Default: `3`
- Requires a value

#### `--timestamps`, `-t`

Display a timestamp next to each message

- Default: `false`
- Does not accept a value

#### `--type`

Filter by type (when selecting a default activity). Values may be split by commas (e.g. "a,b,c") and/or whitespace. The % or * characters can be used as a wildcard for the type, e.g. '%var%' to select variable-related activities.

- Default: `[]`
- Requires a value

#### `--exclude-type`, `-x`

Exclude by type (when selecting a default activity). Values may be split by commas (e.g. "a,b,c") and/or whitespace. The % or * characters can be used as a wildcard to exclude types.

- Default: `[]`
- Requires a value

#### `--state`

Filter by state (when selecting a default activity): in_progress, pending, complete, or cancelled. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--result`

Filter by result (when selecting a default activity): success or failure

- Requires a value

#### `--incomplete`, `-i`

Include only incomplete activities (when selecting a default activity). This is a shorthand for --state=in_progress,pending

- Default: `false`
- Does not accept a value

#### `--all`, `-a`

Check recent activities on all environments (when selecting a default activity)

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `app:config-get`

```bash
magento-cloud app:config-get [-P|--property PROPERTY] [--refresh] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [-i|--identity-file IDENTITY-FILE]
```

View the configuration of an app

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The configuration property to view

- Requires a value

#### `--refresh`

Whether to refresh the cache

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--identity-file`, `-i`

[Deprecated option, no longer used]

- Requires a value


## `app:list`

```bash
magento-cloud apps [--refresh] [--pipe] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header]
```

List apps in the project

### Options

For global options, see [Global options](#global-options).

#### `--refresh`

Whether to refresh the cache

- Default: `false`
- Does not accept a value

#### `--pipe`

Output a list of app names only

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: name*, type*, disk, path, size (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value


## `auth:api-token-login`

```bash
magento-cloud auth:api-token-login
```

Log in to Magento Cloud using an API token

```
Use this command to log in to your Magento Cloud account using an API token.

You can create an account at:
    https://business.adobe.com/products/magento/magento-commerce.html

If you have an account, but you do not already have an API token, you can create one here:
    https://accounts.magento.cloud/user/api-tokens

Alternatively, to log in to the CLI with a browser, run:
    magento-cloud auth:browser-login
```

### Options

For global options, see [Global options](#global-options).


## `auth:browser-login`

```bash
magento-cloud login [-f|--force] [--browser BROWSER] [--pipe]
```

Log in to Magento Cloud via a browser

```
Use this command to log in to the Magento Cloud CLI using a web browser.

It launches a temporary local website which redirects you to log in if
necessary, and then captures the resulting authorization code.

Your system's default browser will be used. You can override this using the
--browser option.

Alternatively, to log in using an API token (without a browser), run:
magento-cloud auth:api-token-login

To authenticate non-interactively, configure an API token using the
MAGENTO_CLOUD_CLI_TOKEN environment variable.
```

### Options

For global options, see [Global options](#global-options).

#### `--force`, `-f`

Log in again, even if already logged in

- Default: `false`
- Does not accept a value

#### `--browser`

The browser to use to open the URL. Set 0 for none.

- Requires a value

#### `--pipe`

Output the URL to stdout.

- Default: `false`
- Does not accept a value


## `auth:info`

```bash
magento-cloud auth:info [--no-auto-login] [-P|--property PROPERTY] [--refresh] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--] [<property>]
```

Display your account information

### Arguments

#### `property`

The account property to view

### Options

For global options, see [Global options](#global-options).

#### `--no-auto-login`

Skips auto login. Nothing will be output if not logged in, and the exit code will be 0, assuming no other errors.

- Default: `false`
- Does not accept a value

#### `--property`, `-P`

The account property to view (alternate syntax)

- Requires a value

#### `--refresh`

Whether to refresh the cache

- Default: `false`
- Does not accept a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value


## `auth:logout`

```bash
magento-cloud logout [-a|--all] [--other]
```

Log out of Magento Cloud

### Options

For global options, see [Global options](#global-options).

#### `--all`, `-a`

Log out from all local sessions

- Default: `false`
- Does not accept a value

#### `--other`

Log out from other local sessions

- Default: `false`
- Does not accept a value


## `blackfire:setup`

```bash
magento-cloud blackfire:setup [--server_id SERVER_ID] [--server_token SERVER_TOKEN] [-p|--project PROJECT] [-W|--no-wait] [--wait]
```

Setup Blackfire.io integration for the project

### Options

For global options, see [Global options](#global-options).

#### `--server_id`

The server id

- Requires a value

#### `--server_token`

The server token

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `certificate:add`

```bash
magento-cloud certificate:add [--cert CERT] [--key KEY] [--chain CHAIN] [-p|--project PROJECT] [-W|--no-wait] [--wait]
```

Add an SSL certificate to the project

### Options

For global options, see [Global options](#global-options).

#### `--cert`

The path to the certificate file

- Requires a value

#### `--key`

The path to the certificate private key file

- Requires a value

#### `--chain`

The path to the certificate chain file

- Default: `[]`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `certificate:delete`

```bash
magento-cloud certificate:delete [-p|--project PROJECT] [-W|--no-wait] [--wait] [--] <id>
```

Delete a certificate from the project

### Arguments

#### `id`

The certificate ID (or the start of it)

- Required

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `certificate:get`

```bash
magento-cloud certificate:get [-P|--property PROPERTY] [--date-fmt DATE-FMT] [-p|--project PROJECT] [--] <id>
```

View a certificate

### Arguments

#### `id`

The certificate ID (or the start of it)

- Required

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The certificate property to view

- Requires a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value


## `certificate:list`

```bash
magento-cloud certificates [--domain DOMAIN] [--exclude-domain EXCLUDE-DOMAIN] [--issuer ISSUER] [--only-auto] [--no-auto] [--ignore-expiry] [--only-expired] [--no-expired] [--pipe-domains] [--date-fmt DATE-FMT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT]
```

List project certificates

### Options

For global options, see [Global options](#global-options).

#### `--domain`

Filter by domain name (case-insensitive search)

- Requires a value

#### `--exclude-domain`

Exclude certificates, matching by domain name (case-insensitive search)

- Requires a value

#### `--issuer`

Filter by issuer

- Requires a value

#### `--only-auto`

Show only auto-provisioned certificates

- Default: `false`
- Does not accept a value

#### `--no-auto`

Show only manually added certificates

- Default: `false`
- Does not accept a value

#### `--ignore-expiry`

Show both expired and non-expired certificates

- Default: `false`
- Does not accept a value

#### `--only-expired`

Show only expired certificates

- Default: `false`
- Does not accept a value

#### `--no-expired`

Show only non-expired certificates (default)

- Default: `false`
- Does not accept a value

#### `--pipe-domains`

Only return a list of domain names covered by the certificates

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: created, domains, expires, id, issuer. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value


## `commit:get`

```bash
magento-cloud commit:get [-P|--property PROPERTY] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--date-fmt DATE-FMT] [--] [<commit>]
```

Show commit details

### Arguments

#### `commit`

The commit SHA. This can also accept "HEAD", and caret (^) or tilde (~) suffixes for parent commits.

- Default: `HEAD`

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The commit property to display.

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value


## `commit:list`

```bash
magento-cloud commits [--limit LIMIT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT] [--] [<commit>]
```

List commits

### Arguments

#### `commit`

The starting Git commit SHA. This can also accept "HEAD", and caret (^) or tilde (~) suffixes for parent commits.

### Options

For global options, see [Global options](#global-options).

#### `--limit`

The number of commits to display.

- Default: `10`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: author, date, sha, summary. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value


## `db:dump`

```bash
magento-cloud db:dump [--schema SCHEMA] [-f|--file FILE] [-d|--directory DIRECTORY] [-z|--gzip] [-t|--timestamp] [-o|--stdout] [--table TABLE] [--exclude-table EXCLUDE-TABLE] [--schema-only] [--charset CHARSET] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [-r|--relationship RELATIONSHIP] [-i|--identity-file IDENTITY-FILE]
```

Create a local dump of the remote database

### Options

For global options, see [Global options](#global-options).

#### `--schema`

The schema to dump. Omit to use the default schema (usually "main").

- Requires a value

#### `--file`, `-f`

A custom filename for the dump

- Requires a value

#### `--directory`, `-d`

A custom directory for the dump

- Requires a value

#### `--gzip`, `-z`

Compress the dump using gzip

- Default: `false`
- Does not accept a value

#### `--timestamp`, `-t`

Add a timestamp to the dump filename

- Default: `false`
- Does not accept a value

#### `--stdout`, `-o`

Output to STDOUT instead of a file

- Default: `false`
- Does not accept a value

#### `--table`

Table(s) to include

- Default: `[]`
- Requires a value

#### `--exclude-table`

Table(s) to exclude

- Default: `[]`
- Requires a value

#### `--schema-only`

Dump only schemas, no data

- Default: `false`
- Does not accept a value

#### `--charset`

The character set encoding for the dump

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--relationship`, `-r`

The service relationship to use

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `db:size`

```bash
magento-cloud db:size [-B|--bytes] [-C|--cleanup] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [-r|--relationship RELATIONSHIP] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-i|--identity-file IDENTITY-FILE]
```

Estimate the disk usage of a database

```
This is an estimate of the database disk usage. The real size on disk is usually higher because of overhead.

To see more accurate disk usage, run: magento-cloud disk
```

### Options

For global options, see [Global options](#global-options).

#### `--bytes`, `-B`

Show sizes in bytes.

- Default: `false`
- Does not accept a value

#### `--cleanup`, `-C`

Check if tables can be cleaned up and show me recommendations (InnoDb only).

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--relationship`, `-r`

The service relationship to use

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: max, percent_used, used. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `db:sql`

```bash
magento-cloud sql [--raw] [--schema SCHEMA] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [-r|--relationship RELATIONSHIP] [-i|--identity-file IDENTITY-FILE] [--] [<query>]
```

Run SQL on the remote database

### Arguments

#### `query`

An SQL statement to execute

### Options

For global options, see [Global options](#global-options).

#### `--raw`

Produce raw, non-tabular output

- Default: `false`
- Does not accept a value

#### `--schema`

The schema to use. Omit to use the default schema (usually "main"). Pass an empty string to not use any schema.

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--relationship`, `-r`

The service relationship to use

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `domain:add`

```bash
magento-cloud domain:add [--cert CERT] [--key KEY] [--chain CHAIN] [--attach ATTACH] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] <name>
```

Add a new domain to the project

### Arguments

#### `name`

The domain name

- Required

### Options

For global options, see [Global options](#global-options).

#### `--cert`

The path to the certificate file for this domain

- Requires a value

#### `--key`

The path to the private key file for the provided certificate.

- Requires a value

#### `--chain`

The path to the certificate chain file or files for the provided certificate

- Default: `[]`
- Requires a value

#### `--attach`

The production domain that this one replaces in the environment's routes. Required for non-production environment domains.

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `domain:delete`

```bash
magento-cloud domain:delete [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] <name>
```

Delete a domain from the project

### Arguments

#### `name`

The domain name

- Required

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `domain:get`

```bash
magento-cloud domain:get [-P|--property PROPERTY] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<name>]
```

Show detailed information for a domain

### Arguments

#### `name`

The domain name

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The domain property to view

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `domain:list`

```bash
magento-cloud domains [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT] [-e|--environment ENVIRONMENT]
```

Get a list of all domains

### Options

For global options, see [Global options](#global-options).

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: name*, ssl*, created_at*, registered_name, replacement_for, type, updated_at (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `domain:update`

```bash
magento-cloud domain:update [--cert CERT] [--key KEY] [--chain CHAIN] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] <name>
```

Update a domain

### Arguments

#### `name`

The domain name

- Required

### Options

For global options, see [Global options](#global-options).

#### `--cert`

The path to the certificate file for this domain

- Requires a value

#### `--key`

The path to the private key file for the provided certificate.

- Requires a value

#### `--chain`

The path to the certificate chain file or files for the provided certificate

- Default: `[]`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:activate`

```bash
magento-cloud environment:activate [--parent PARENT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<environment>]...
```

Activate an environment

### Arguments

#### `environment`

The environment(s) to activate

- Default: `[]`
- Array
   
### Options

For global options, see [Global options](#global-options).

#### `--parent`

Set a new environment parent before activating

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:branch`

```bash
magento-cloud branch [--title TITLE] [--type TYPE] [--no-clone-parent] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<id>] [<parent>]
```

Branch an environment

### Arguments

#### `id`

The ID (branch name) of the new environment


#### `parent`

The parent of the new environment

### Options

For global options, see [Global options](#global-options).

#### `--title`

The title of the new environment

- Requires a value

#### `--type`

The type of the new environment

- Requires a value

#### `--no-clone-parent`

Do not clone the parent environment's data

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:checkout`

```bash
magento-cloud checkout [-i|--identity-file IDENTITY-FILE] [--] [<id>]
```

Check out an environment

### Arguments

#### `id`

The ID of the environment to check out. For example: "sprint2"

### Options

For global options, see [Global options](#global-options).

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `environment:delete`

```bash
magento-cloud environment:delete [--delete-branch] [--no-delete-branch] [--type TYPE] [-t|--only-type ONLY-TYPE] [--exclude EXCLUDE] [--exclude-type EXCLUDE-TYPE] [--inactive] [--merged] [--allow-delete-parent] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<environment>]...
```

Delete one or more environments

```
When a Magento Cloud environment is deleted, it will become "inactive": it will
exist only as a Git branch, containing code but no services, databases nor
files.

This command allows you to delete environments as well as their Git branches.
```

### Arguments

#### `environment`

The environment(s) to delete. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Array
   
### Options

For global options, see [Global options](#global-options).

#### `--delete-branch`

Delete Git branch(es) for inactive environments, without confirmation

- Default: `false`
- Does not accept a value

#### `--no-delete-branch`

Do not delete any Git branch(es) (inactive environments)

- Default: `false`
- Does not accept a value

#### `--type`

Delete all environments of a type (adding to any others selected) Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--only-type`, `-t`

Only delete environments of a specific type Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--exclude`

Environment(s) not to delete. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--exclude-type`

Environment type(s) of which not to delete Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--inactive`

Delete all inactive environments (adding to any others selected)

- Default: `false`
- Does not accept a value

#### `--merged`

Delete all merged environments (adding to any others selected)

- Default: `false`
- Does not accept a value

#### `--allow-delete-parent`

Allow environments that have children to be deleted

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:http-access`

```bash
magento-cloud httpaccess [--access ACCESS] [--auth AUTH] [--enabled ENABLED] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait]
```

Update HTTP access settings for an environment

### Options

For global options, see [Global options](#global-options).

#### `--access`

Access restriction in the format "permission:address". Use 0 to clear all addresses.

- Default: `[]`
- Requires a value

#### `--auth`

HTTP Basic auth credentials in the format "username:password". Use 0 to clear all credentials.

- Default: `[]`
- Requires a value

#### `--enabled`

Whether access control should be enabled: 1 to enable, 0 to disable

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:info`

```bash
magento-cloud environment:info [--refresh] [--date-fmt DATE-FMT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<property>] [<value>]
```

Read or set properties for an environment

### Arguments

#### `property`

The name of the property


#### `value`

Set a new value for the property

### Options

For global options, see [Global options](#global-options).

#### `--refresh`

Whether to refresh the cache

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:init`

```bash
magento-cloud environment:init [--profile PROFILE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] <url>
```

Initialize an environment from a public Git repository

### Arguments

#### `url`

A URL to a Git repository

- Required

### Options

For global options, see [Global options](#global-options).

#### `--profile`

The name of the profile

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:list`

```bash
magento-cloud environments [-I|--no-inactive] [--pipe] [--refresh REFRESH] [--sort SORT] [--reverse] [--type TYPE] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT]
```

Get a list of environments

### Options

For global options, see [Global options](#global-options).

#### `--no-inactive`, `-I`

Do not show inactive environments

- Default: `false`
- Does not accept a value

#### `--pipe`

Output a simple list of environment IDs.

- Default: `false`
- Does not accept a value

#### `--refresh`

Whether to refresh the list.

- Default: `1`
- Requires a value

#### `--sort`

A property to sort by

- Default: `title`
- Requires a value

#### `--reverse`

Sort in reverse (descending) order

- Default: `false`
- Does not accept a value

#### `--type`

Filter the list by environment type(s). Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: id*, title*, status*, type*, created, machine_name, updated (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value


## `environment:logs`

```bash
magento-cloud log [--lines LINES] [--tail] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-I|--instance INSTANCE] [--] [<type>]
```

Read an environment's logs

### Arguments

#### `type`

The log type, e.g. "access" or "error"

### Options

For global options, see [Global options](#global-options).

#### `--lines`

The number of lines to show

- Default: `100`
- Requires a value

#### `--tail`

Continuously tail the log

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--worker`

A worker name

- Requires a value

#### `--instance`, `-I`

An instance ID

- Requires a value


## `environment:merge`

```bash
magento-cloud merge [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<environment>]
```

Merge an environment

```
This command will initiate a Git merge of the specified environment into its parent environment.
```

### Arguments

#### `environment`

The environment to merge

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:pause`

```bash
magento-cloud environment:pause [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait]
```

Pause an environment

```
Pausing an environment helps to reduce resource consumption and carbon emissions.

The environment will be unavailable until it is resumed. No data will be lost.
```

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:push`

```bash
magento-cloud push [--target TARGET] [-f|--force] [--force-with-lease] [-u|--set-upstream] [--activate] [--parent PARENT] [--type TYPE] [--no-clone-parent] [-W|--no-wait] [--wait] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-i|--identity-file IDENTITY-FILE] [--] [<source>]
```

Push code to an environment

### Arguments

#### `source`

The source ref: a branch name or commit hash

- Default: `HEAD`

### Options

For global options, see [Global options](#global-options).

#### `--target`

The target branch name. Defaults to the current branch.

- Requires a value

#### `--force`, `-f`

Allow non-fast-forward updates

- Default: `false`
- Does not accept a value

#### `--force-with-lease`

Allow non-fast-forward updates, if the remote-tracking branch is up to date

- Default: `false`
- Does not accept a value

#### `--set-upstream`, `-u`

Set the target environment as the upstream for the source branch. This will also set the target project as the remote for the local repository.

- Default: `false`
- Does not accept a value

#### `--activate`

Activate the environment before pushing

- Default: `false`
- Does not accept a value

#### `--parent`

Set the new environment parent (only used with --activate)

- Requires a value

#### `--type`

Set the environment type (only used with --activate )

- Requires a value

#### `--no-clone-parent`

Do not clone the parent branch's data (only used with --activate)

- Default: `false`
- Does not accept a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `environment:redeploy`

```bash
magento-cloud redeploy [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait]
```

Redeploy an environment

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:relationships`

```bash
magento-cloud relationships [-P|--property PROPERTY] [--refresh] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [-i|--identity-file IDENTITY-FILE] [--] [<environment>]
```

Show an environment's relationships

### Arguments

#### `environment`

The environment

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The relationship property to view

- Requires a value

#### `--refresh`

Whether to refresh the relationships

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `environment:resume`

```bash
magento-cloud environment:resume [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait]
```

Resume a paused environment

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:scp`

```bash
magento-cloud scp [-r|--recursive] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-I|--instance INSTANCE] [-i|--identity-file IDENTITY-FILE] [--] [<files>]...
```

Copy files to and from an environment using scp

### Arguments

#### `files`

Files to copy. Use the remote: prefix to define remote locations.

- Default: `[]`
- Array
   
### Options

For global options, see [Global options](#global-options).

#### `--recursive`, `-r`

Recursively copy entire directories

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--worker`

A worker name

- Requires a value

#### `--instance`, `-I`

An instance ID

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `environment:ssh`

```bash
magento-cloud ssh [--pipe] [--all] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-I|--instance INSTANCE] [-i|--identity-file IDENTITY-FILE] [--] [<cmd>]...
```

SSH to the current environment

### Arguments

#### `cmd`

A command to run on the environment.

- Default: `[]`
- Array
   
### Options

For global options, see [Global options](#global-options).

#### `--pipe`

Output the SSH URL only.

- Default: `false`
- Does not accept a value

#### `--all`

Output all SSH URLs (for every app).

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--worker`

A worker name

- Requires a value

#### `--instance`, `-I`

An instance ID

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `environment:synchronize`

```bash
magento-cloud sync [--rebase] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<synchronize>]...
```

Synchronize an environment's code and/or data from its parent

```
This command synchronizes to a child environment from its parent environment.

Synchronizing "code" means there will be a Git merge from the parent to the
child. Synchronizing "data" means that all files in all services (including
static files, databases, logs, search indices, etc.) will be copied from the
parent to the child.
```

### Arguments

#### `synchronize`

What to synchronize: "code", "data" or both

- Default: `[]`
- Array
   
### Options

For global options, see [Global options](#global-options).

#### `--rebase`

Synchronize code by rebasing instead of merging

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `environment:url`

```bash
magento-cloud url [-1|--primary] [--browser BROWSER] [--pipe] [-p|--project PROJECT] [-e|--environment ENVIRONMENT]
```

Get the public URLs of an environment

### Options

For global options, see [Global options](#global-options).

#### `--primary`, `-1`

Only return the URL for the primary route

- Default: `false`
- Does not accept a value

#### `--browser`

The browser to use to open the URL. Set 0 for none.

- Requires a value

#### `--pipe`

Output the URL to stdout.

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `environment:xdebug`

```bash
magento-cloud xdebug [--port PORT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-I|--instance INSTANCE] [-i|--identity-file IDENTITY-FILE]
```

Open a tunnel to Xdebug on the environment

### Options

For global options, see [Global options](#global-options).

#### `--port`

The local port

- Default: `9000`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--worker`

A worker name

- Requires a value

#### `--instance`, `-I`

An instance ID

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `integration:activity:get`

```bash
magento-cloud integration:activity:get [-P|--property PROPERTY] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT] [--] [<integration>] [<activity>]
```

View detailed information on a single integration activity

### Arguments

#### `integration`

An integration ID. Leave blank to choose from a list.


#### `activity`

The activity ID. Defaults to the most recent integration activity.

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The property to view

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

[Deprecated option, not used]

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value


## `integration:activity:list`

```bash
magento-cloud int:act [--type TYPE] [-x|--exclude-type EXCLUDE-TYPE] [--limit LIMIT] [--start START] [--state STATE] [--result RESULT] [-i|--incomplete] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<id>]
```

Get a list of activities for an integration

### Arguments

#### `id`

An integration ID. Leave blank to choose from a list.

### Options

For global options, see [Global options](#global-options).

#### `--type`

Filter activities by type. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--exclude-type`, `-x`

Exclude activities by type. Values may be split by commas (e.g. "a,b,c") and/or whitespace. The % or * characters can be used as a wildcard to exclude types.

- Default: `[]`
- Requires a value

#### `--limit`

Limit the number of results displayed

- Default: `10`
- Requires a value

#### `--start`

Only activities created before this date will be listed

- Requires a value

#### `--state`

Filter activities by state. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--result`

Filter activities by result

- Requires a value

#### `--incomplete`, `-i`

Only list incomplete activities

- Default: `false`
- Does not accept a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: id*, created*, description*, type*, state*, result*, completed (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

[Deprecated option, not used]

- Requires a value


## `integration:activity:log`

```bash
magento-cloud integration:activity:log [-t|--timestamps] [--date-fmt DATE-FMT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<integration>] [<activity>]
```

Display the log for an integration activity

### Arguments

#### `integration`

An integration ID. Leave blank to choose from a list.


#### `activity`

The activity ID. Defaults to the most recent integration activity.

### Options

For global options, see [Global options](#global-options).

#### `--timestamps`, `-t`

Display a timestamp next to each message

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

[Deprecated option, not used]

- Requires a value


## `integration:add`

```bash
magento-cloud integration:add [--type TYPE] [--base-url BASE-URL] [--bitbucket-url BITBUCKET-URL] [--username USERNAME] [--token TOKEN] [--key KEY] [--secret SECRET] [--license-key LICENSE-KEY] [--server-project SERVER-PROJECT] [--repository REPOSITORY] [--build-merge-requests BUILD-MERGE-REQUESTS] [--build-pull-requests BUILD-PULL-REQUESTS] [--build-draft-pull-requests BUILD-DRAFT-PULL-REQUESTS] [--build-pull-requests-post-merge BUILD-PULL-REQUESTS-POST-MERGE] [--build-wip-merge-requests BUILD-WIP-MERGE-REQUESTS] [--merge-requests-clone-parent-data MERGE-REQUESTS-CLONE-PARENT-DATA] [--pull-requests-clone-parent-data PULL-REQUESTS-CLONE-PARENT-DATA] [--resync-pull-requests RESYNC-PULL-REQUESTS] [--fetch-branches FETCH-BRANCHES] [--prune-branches PRUNE-BRANCHES] [--resources-init RESOURCES-INIT] [--url URL] [--shared-key SHARED-KEY] [--file FILE] [--events EVENTS] [--states STATES] [--environments ENVIRONMENTS] [--excluded-environments EXCLUDED-ENVIRONMENTS] [--from-address FROM-ADDRESS] [--recipients RECIPIENTS] [--channel CHANNEL] [--routing-key ROUTING-KEY] [--category CATEGORY] [--index INDEX] [--sourcetype SOURCETYPE] [--protocol PROTOCOL] [--syslog-host SYSLOG-HOST] [--syslog-port SYSLOG-PORT] [--facility FACILITY] [--message-format MESSAGE-FORMAT] [--auth-mode AUTH-MODE] [--auth-token AUTH-TOKEN] [--verify-tls VERIFY-TLS] [--header HEADER] [-p|--project PROJECT] [-W|--no-wait] [--wait]
```

Add an integration to the project

### Options

For global options, see [Global options](#global-options).

#### `--type`

The integration type ('bitbucket', 'bitbucket_server', 'github', 'gitlab', 'webhook', 'health.email', 'health.pagerduty', 'health.slack', 'health.webhook', 'httplog', 'script', 'newrelic', 'splunk', 'sumologic', 'syslog')

- Requires a value

#### `--base-url`

The base URL of the server installation

- Requires a value

#### `--bitbucket-url`

The base URL of the Bitbucket Server installation

- Requires a value

#### `--username`

The Bitbucket Server username

- Requires a value

#### `--token`

An authentication or access token for the integration

- Requires a value

#### `--key`

A Bitbucket OAuth consumer key

- Requires a value

#### `--secret`

A Bitbucket OAuth consumer secret

- Requires a value

#### `--license-key`

The New Relic Logs license key

- Requires a value

#### `--server-project`

The project (e.g. 'namespace/repo')

- Requires a value

#### `--repository`

The repository to track (e.g. 'owner/repository')

- Requires a value

#### `--build-merge-requests`

GitLab: build merge requests as environments

- Default: `true`
- Requires a value

#### `--build-pull-requests`

Build every pull request as an environment

- Default: `true`
- Requires a value

#### `--build-draft-pull-requests`

Build draft pull requests

- Default: `true`
- Requires a value

#### `--build-pull-requests-post-merge`

Build pull requests based on their post-merge state

- Default: `false`
- Requires a value

#### `--build-wip-merge-requests`

GitLab: build WIP merge requests

- Default: `true`
- Requires a value

#### `--merge-requests-clone-parent-data`

GitLab: clone data for merge requests

- Default: `true`
- Requires a value

#### `--pull-requests-clone-parent-data`

Clone the parent environment's data for pull requests

- Default: `true`
- Requires a value

#### `--resync-pull-requests`

Re-sync pull request environment data on every build

- Default: `false`
- Requires a value

#### `--fetch-branches`

Fetch all branches from the remote (as inactive environments)

- Default: `true`
- Requires a value

#### `--prune-branches`

Delete branches that do not exist on the remote

- Default: `true`
- Requires a value

#### `--resources-init`

The resources to use when initializing a new service ('minimum', 'default', 'manual', 'parent')

- Requires a value

#### `--url`

The URL or API endpoint for the integration

- Requires a value

#### `--shared-key`

Webhook: the JWS shared secret key

- Requires a value

#### `--file`

The name of a local file that contains the script to upload

- Requires a value

#### `--events`

A list of events to act on, e.g. environment.push

- Default: `*`
- Requires a value

#### `--states`

A list of states to act on, e.g. pending, in_progress, complete

- Default: `complete`
- Requires a value

#### `--environments`

The environment IDs to include

- Default: `*`
- Requires a value

#### `--excluded-environments`

The environment IDs to exclude

- Default: `[]`
- Requires a value

#### `--from-address`

[Optional] Custom From address for alert emails

- Requires a value

#### `--recipients`

The recipient email address(es)

- Default: `[]`
- Requires a value

#### `--channel`

The Slack channel

- Requires a value

#### `--routing-key`

The PagerDuty routing key

- Requires a value

#### `--category`

The Sumo Logic category, used for filtering

- Requires a value

#### `--index`

The Splunk index

- Requires a value

#### `--sourcetype`

The Splunk event source type

- Requires a value

#### `--protocol`

Syslog transport protocol ('tcp', 'udp', 'tls')

- Default: `tls`
- Requires a value

#### `--syslog-host`

Syslog relay/collector host

- Requires a value

#### `--syslog-port`

Syslog relay/collector port

- Requires a value

#### `--facility`

Syslog facility

- Default: `1`
- Requires a value

#### `--message-format`

Syslog message format ('rfc3164' or 'rfc5424')

- Default: `rfc5424`
- Requires a value

#### `--auth-mode`

Authentication mode ('prefix' or 'structured_data')

- Default: `prefix`
- Requires a value

#### `--auth-token`

Authentication token

- Requires a value

#### `--verify-tls`

Whether HTTPS certificate verification should be enabled (recommended)

- Default: `true`
- Requires a value

#### `--header`

HTTP header(s) to use in POST requests. Separate names and values with a colon (:).

- Default: `[]`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `integration:delete`

```bash
magento-cloud integration:delete [-p|--project PROJECT] [-W|--no-wait] [--wait] [--] [<id>]
```

Delete an integration from a project

### Arguments

#### `id`

The integration ID. Leave blank to choose from a list.

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `integration:get`

```bash
magento-cloud integration:get [-P|--property [PROPERTY]] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT] [--] [<id>]
```

View details of an integration

### Arguments

#### `id`

An integration ID. Leave blank to choose from a list.

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The integration property to view

- Accepts a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value


## `integration:list`

```bash
magento-cloud integrations [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT]
```

View a list of project integration(s)

### Options

For global options, see [Global options](#global-options).

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: id, summary, type. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value


## `integration:update`

```bash
magento-cloud integration:update [--type TYPE] [--base-url BASE-URL] [--bitbucket-url BITBUCKET-URL] [--username USERNAME] [--token TOKEN] [--key KEY] [--secret SECRET] [--license-key LICENSE-KEY] [--server-project SERVER-PROJECT] [--repository REPOSITORY] [--build-merge-requests BUILD-MERGE-REQUESTS] [--build-pull-requests BUILD-PULL-REQUESTS] [--build-draft-pull-requests BUILD-DRAFT-PULL-REQUESTS] [--build-pull-requests-post-merge BUILD-PULL-REQUESTS-POST-MERGE] [--build-wip-merge-requests BUILD-WIP-MERGE-REQUESTS] [--merge-requests-clone-parent-data MERGE-REQUESTS-CLONE-PARENT-DATA] [--pull-requests-clone-parent-data PULL-REQUESTS-CLONE-PARENT-DATA] [--resync-pull-requests RESYNC-PULL-REQUESTS] [--fetch-branches FETCH-BRANCHES] [--prune-branches PRUNE-BRANCHES] [--resources-init RESOURCES-INIT] [--url URL] [--shared-key SHARED-KEY] [--file FILE] [--events EVENTS] [--states STATES] [--environments ENVIRONMENTS] [--excluded-environments EXCLUDED-ENVIRONMENTS] [--from-address FROM-ADDRESS] [--recipients RECIPIENTS] [--channel CHANNEL] [--routing-key ROUTING-KEY] [--category CATEGORY] [--index INDEX] [--sourcetype SOURCETYPE] [--protocol PROTOCOL] [--syslog-host SYSLOG-HOST] [--syslog-port SYSLOG-PORT] [--facility FACILITY] [--message-format MESSAGE-FORMAT] [--auth-mode AUTH-MODE] [--auth-token AUTH-TOKEN] [--verify-tls VERIFY-TLS] [--header HEADER] [-p|--project PROJECT] [-W|--no-wait] [--wait] [--] [<id>]
```

Update an integration

### Arguments

#### `id`

The ID of the integration to update

### Options

For global options, see [Global options](#global-options).

#### `--type`

The integration type ('bitbucket', 'bitbucket_server', 'github', 'gitlab', 'webhook', 'health.email', 'health.pagerduty', 'health.slack', 'health.webhook', 'httplog', 'script', 'newrelic', 'splunk', 'sumologic', 'syslog')

- Requires a value

#### `--base-url`

The base URL of the server installation

- Requires a value

#### `--bitbucket-url`

The base URL of the Bitbucket Server installation

- Requires a value

#### `--username`

The Bitbucket Server username

- Requires a value

#### `--token`

An authentication or access token for the integration

- Requires a value

#### `--key`

A Bitbucket OAuth consumer key

- Requires a value

#### `--secret`

A Bitbucket OAuth consumer secret

- Requires a value

#### `--license-key`

The New Relic Logs license key

- Requires a value

#### `--server-project`

The project (e.g. 'namespace/repo')

- Requires a value

#### `--repository`

The repository to track (e.g. 'owner/repository')

- Requires a value

#### `--build-merge-requests`

GitLab: build merge requests as environments

- Default: `true`
- Requires a value

#### `--build-pull-requests`

Build every pull request as an environment

- Default: `true`
- Requires a value

#### `--build-draft-pull-requests`

Build draft pull requests

- Default: `true`
- Requires a value

#### `--build-pull-requests-post-merge`

Build pull requests based on their post-merge state

- Default: `false`
- Requires a value

#### `--build-wip-merge-requests`

GitLab: build WIP merge requests

- Default: `true`
- Requires a value

#### `--merge-requests-clone-parent-data`

GitLab: clone data for merge requests

- Default: `true`
- Requires a value

#### `--pull-requests-clone-parent-data`

Clone the parent environment's data for pull requests

- Default: `true`
- Requires a value

#### `--resync-pull-requests`

Re-sync pull request environment data on every build

- Default: `false`
- Requires a value

#### `--fetch-branches`

Fetch all branches from the remote (as inactive environments)

- Default: `true`
- Requires a value

#### `--prune-branches`

Delete branches that do not exist on the remote

- Default: `true`
- Requires a value

#### `--resources-init`

The resources to use when initializing a new service ('minimum', 'default', 'manual', 'parent')

- Requires a value

#### `--url`

The URL or API endpoint for the integration

- Requires a value

#### `--shared-key`

Webhook: the JWS shared secret key

- Requires a value

#### `--file`

The name of a local file that contains the script to upload

- Requires a value

#### `--events`

A list of events to act on, e.g. environment.push

- Default: `*`
- Requires a value

#### `--states`

A list of states to act on, e.g. pending, in_progress, complete

- Default: `complete`
- Requires a value

#### `--environments`

The environment IDs to include

- Default: `*`
- Requires a value

#### `--excluded-environments`

The environment IDs to exclude

- Default: `[]`
- Requires a value

#### `--from-address`

[Optional] Custom From address for alert emails

- Requires a value

#### `--recipients`

The recipient email address(es)

- Default: `[]`
- Requires a value

#### `--channel`

The Slack channel

- Requires a value

#### `--routing-key`

The PagerDuty routing key

- Requires a value

#### `--category`

The Sumo Logic category, used for filtering

- Requires a value

#### `--index`

The Splunk index

- Requires a value

#### `--sourcetype`

The Splunk event source type

- Requires a value

#### `--protocol`

Syslog transport protocol ('tcp', 'udp', 'tls')

- Default: `tls`
- Requires a value

#### `--syslog-host`

Syslog relay/collector host

- Requires a value

#### `--syslog-port`

Syslog relay/collector port

- Requires a value

#### `--facility`

Syslog facility

- Default: `1`
- Requires a value

#### `--message-format`

Syslog message format ('rfc3164' or 'rfc5424')

- Default: `rfc5424`
- Requires a value

#### `--auth-mode`

Authentication mode ('prefix' or 'structured_data')

- Default: `prefix`
- Requires a value

#### `--auth-token`

Authentication token

- Requires a value

#### `--verify-tls`

Whether HTTPS certificate verification should be enabled (recommended)

- Default: `true`
- Requires a value

#### `--header`

HTTP header(s) to use in POST requests. Separate names and values with a colon (:).

- Default: `[]`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `integration:validate`

```bash
magento-cloud integration:validate [-p|--project PROJECT] [--] [<id>]
```

Validate an existing integration

```
This command allows you to check whether an integration is valid.

An exit code of 0 means the integration is valid, while 4 means it is invalid.
Any other exit code indicates an unexpected error.

Integrations are validated automatically on creation and on update. However,
because they involve external resources, it is possible for a valid integration
to become invalid. For example, an access token may be revoked, or an external
repository may be deleted.
```

### Arguments

#### `id`

An integration ID. Leave blank to choose from a list.

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value


## `local:build`

```bash
magento-cloud build [-a|--abslinks] [-s|--source SOURCE] [-d|--destination DESTINATION] [-c|--copy] [--clone] [--run-deploy-hooks] [--no-clean] [--no-archive] [--no-backup] [--no-cache] [--no-build-hooks] [--no-deps] [--working-copy] [--concurrency CONCURRENCY] [--lock] [--] [<app>]...
```

Build the current project locally

### Arguments

#### `app`

Specify application(s) to build

- Default: `[]`
- Array
   
### Options

For global options, see [Global options](#global-options).

#### `--abslinks`, `-a`

Use absolute links

- Default: `false`
- Does not accept a value

#### `--source`, `-s`

The source directory. Defaults to the current project root.

- Requires a value

#### `--destination`, `-d`

The destination, to which the web root of each app will be symlinked. Default: _www

- Requires a value

#### `--copy`, `-c`

Copy to a build directory, instead of symlinking from the source

- Default: `false`
- Does not accept a value

#### `--clone`

Use Git to clone the current HEAD to the build directory

- Default: `false`
- Does not accept a value

#### `--run-deploy-hooks`

Run deploy and/or post_deploy hooks

- Default: `false`
- Does not accept a value

#### `--no-clean`

Do not remove old builds

- Default: `false`
- Does not accept a value

#### `--no-archive`

Do not create or use a build archive

- Default: `false`
- Does not accept a value

#### `--no-backup`

Do not back up the previous build

- Default: `false`
- Does not accept a value

#### `--no-cache`

Disable caching

- Default: `false`
- Does not accept a value

#### `--no-build-hooks`

Do not run post-build hooks

- Default: `false`
- Does not accept a value

#### `--no-deps`

Do not install build dependencies locally

- Default: `false`
- Does not accept a value

#### `--working-copy`

Drush: use git to clone a repository of each Drupal module rather than simply downloading a version

- Default: `false`
- Does not accept a value

#### `--concurrency`

Drush: set the number of concurrent projects that will be processed at the same time

- Default: `4`
- Requires a value

#### `--lock`

Drush: create or update a lock file (only available with Drush version 7+)

- Default: `false`
- Does not accept a value


## `local:dir`

```bash
magento-cloud dir [<subdir>]
```

Find the local project root

### Arguments

#### `subdir`

The subdirectory to find ('local', 'web' or 'shared')

### Options

For global options, see [Global options](#global-options).


## `metrics:all`

```bash
magento-cloud metrics [-B|--bytes] [-r|--range RANGE] [-i|--interval INTERVAL] [--to TO] [-1|--latest] [-s|--service SERVICE] [--type TYPE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT]
```

 BETA  Show CPU, disk and memory metrics for an environment

### Options

For global options, see [Global options](#global-options).

#### `--bytes`, `-B`

Show sizes in bytes

- Default: `false`
- Does not accept a value

#### `--range`, `-r`

The time range. Metrics will be loaded for this duration until the end time (--to). You can specify units: hours (h), minutes (m), or seconds (s). Minimum 5m, maximum 8h or more (depending on the project), default 10m.

- Requires a value

#### `--interval`, `-i`

The time interval. Defaults to a division of the range. You can specify units: hours (h), minutes (m), or seconds (s). Minimum 1m.

- Requires a value

#### `--to`

The end time. Defaults to now.

- Requires a value

#### `--latest`, `-1`

Show only the latest single data point

- Default: `false`
- Does not accept a value

#### `--service`, `-s`

Filter by service or application name The % or * characters may be used as a wildcard.

- Default: `[]`
- Requires a value

#### `--type`

Filter by service type (if --service is not provided). The version is not required. The % or * characters may be used as a wildcard.

- Default: `[]`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: timestamp*, service*, cpu_percent*, mem_percent*, disk_percent*, tmp_disk_percent*, cpu_limit, cpu_used, disk_limit, disk_used, inodes_limit, inodes_percent, inodes_used, mem_limit, mem_used, tmp_disk_limit, tmp_disk_used, tmp_inodes_limit, tmp_inodes_percent, tmp_inodes_used, type (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value


## `metrics:cpu`

```bash
magento-cloud cpu [-r|--range RANGE] [-i|--interval INTERVAL] [--to TO] [-1|--latest] [-s|--service SERVICE] [--type TYPE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT]
```

 BETA  Show CPU usage of an environment

### Options

For global options, see [Global options](#global-options).

#### `--range`, `-r`

The time range. Metrics will be loaded for this duration until the end time (--to). You can specify units: hours (h), minutes (m), or seconds (s). Minimum 5m, maximum 8h or more (depending on the project), default 10m.

- Requires a value

#### `--interval`, `-i`

The time interval. Defaults to a division of the range. You can specify units: hours (h), minutes (m), or seconds (s). Minimum 1m.

- Requires a value

#### `--to`

The end time. Defaults to now.

- Requires a value

#### `--latest`, `-1`

Show only the latest single data point

- Default: `false`
- Does not accept a value

#### `--service`, `-s`

Filter by service or application name The % or * characters may be used as a wildcard.

- Default: `[]`
- Requires a value

#### `--type`

Filter by service type (if --service is not provided). The version is not required. The % or * characters may be used as a wildcard.

- Default: `[]`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: timestamp*, service*, used*, limit*, percent*, type (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value


## `metrics:disk-usage`

```bash
magento-cloud disk [-B|--bytes] [-r|--range RANGE] [-i|--interval INTERVAL] [--to TO] [-1|--latest] [-s|--service SERVICE] [--type TYPE] [--tmp] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT]
```

Show disk usage of an environment

### Options

For global options, see [Global options](#global-options).

#### `--bytes`, `-B`

Show sizes in bytes

- Default: `false`
- Does not accept a value

#### `--range`, `-r`

The time range. Metrics will be loaded for this duration until the end time (--to). You can specify units: hours (h), minutes (m), or seconds (s). Minimum 5m, maximum 8h or more (depending on the project), default 10m.

- Requires a value

#### `--interval`, `-i`

The time interval. Defaults to a division of the range. You can specify units: hours (h), minutes (m), or seconds (s). Minimum 1m.

- Requires a value

#### `--to`

The end time. Defaults to now.

- Requires a value

#### `--latest`, `-1`

Show only the latest single data point

- Default: `false`
- Does not accept a value

#### `--service`, `-s`

Filter by service or application name The % or * characters may be used as a wildcard.

- Default: `[]`
- Requires a value

#### `--type`

Filter by service type (if --service is not provided). The version is not required. The % or * characters may be used as a wildcard.

- Default: `[]`
- Requires a value

#### `--tmp`

Report temporary disk usage (shows columns: timestamp, service, tmp_used, tmp_limit, tmp_percent, tmp_ipercent)

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: timestamp*, service*, used*, limit*, percent*, ipercent*, tmp_percent*, ilimit, iused, tmp_ilimit, tmp_ipercent, tmp_iused, tmp_limit, tmp_used, type (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value


## `metrics:memory`

```bash
magento-cloud mem [-B|--bytes] [-r|--range RANGE] [-i|--interval INTERVAL] [--to TO] [-1|--latest] [-s|--service SERVICE] [--type TYPE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT]
```

 BETA  Show memory usage of an environment

### Options

For global options, see [Global options](#global-options).

#### `--bytes`, `-B`

Show sizes in bytes

- Default: `false`
- Does not accept a value

#### `--range`, `-r`

The time range. Metrics will be loaded for this duration until the end time (--to). You can specify units: hours (h), minutes (m), or seconds (s). Minimum 5m, maximum 8h or more (depending on the project), default 10m.

- Requires a value

#### `--interval`, `-i`

The time interval. Defaults to a division of the range. You can specify units: hours (h), minutes (m), or seconds (s). Minimum 1m.

- Requires a value

#### `--to`

The end time. Defaults to now.

- Requires a value

#### `--latest`, `-1`

Show only the latest single data point

- Default: `false`
- Does not accept a value

#### `--service`, `-s`

Filter by service or application name The % or * characters may be used as a wildcard.

- Default: `[]`
- Requires a value

#### `--type`

Filter by service type (if --service is not provided). The version is not required. The % or * characters may be used as a wildcard.

- Default: `[]`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: timestamp*, service*, used*, limit*, percent*, type (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value


## `mount:download`

```bash
magento-cloud mount:download [-a|--all] [-m|--mount MOUNT] [--target TARGET] [--source-path] [--delete] [--exclude EXCLUDE] [--include INCLUDE] [--refresh] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-I|--instance INSTANCE] [-i|--identity-file IDENTITY-FILE]
```

Download files from a mount, using rsync

### Options

For global options, see [Global options](#global-options).

#### `--all`, `-a`

Download from all mounts

- Default: `false`
- Does not accept a value

#### `--mount`, `-m`

The mount (as an app-relative path)

- Requires a value

#### `--target`

The directory to which files will be downloaded. If --all is used, the mount path will be appended

- Requires a value

#### `--source-path`

Use the mount's source path (rather than the mount path) as a subdirectory of the target, when --all is used

- Default: `false`
- Does not accept a value

#### `--delete`

Whether to delete extraneous files in the target directory

- Default: `false`
- Does not accept a value

#### `--exclude`

File(s) to exclude from the download (pattern)

- Default: `[]`
- Requires a value

#### `--include`

File(s) not to exclude (pattern)

- Default: `[]`
- Requires a value

#### `--refresh`

Whether to refresh the cache

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--worker`

A worker name

- Requires a value

#### `--instance`, `-I`

An instance ID

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `mount:list`

```bash
magento-cloud mounts [--paths] [--refresh] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-I|--instance INSTANCE]
```

Get a list of mounts

### Options

For global options, see [Global options](#global-options).

#### `--paths`

Output the mount paths only (one per line)

- Default: `false`
- Does not accept a value

#### `--refresh`

Whether to refresh the cache

- Default: `false`
- Does not accept a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: definition, path. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--worker`

A worker name

- Requires a value

#### `--instance`, `-I`

An instance ID

- Requires a value


## `mount:size`

```bash
magento-cloud mount:size [-B|--bytes] [--refresh] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-i|--identity-file IDENTITY-FILE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-I|--instance INSTANCE]
```

Check the disk usage of mounts

```
Use this command to check the disk size and usage for an application's mounts.

Mounts are directories mounted into the application from a persistent, writable
filesystem. They are configured in the mounts key in the application configuration.

The filesystem's total size is determined by the disk key in the same file.
```

### Options

For global options, see [Global options](#global-options).

#### `--bytes`, `-B`

Show sizes in bytes

- Default: `false`
- Does not accept a value

#### `--refresh`

Refresh the cache

- Default: `false`
- Does not accept a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: available, max, mounts, percent_used, sizes, used. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--worker`

A worker name

- Requires a value

#### `--instance`, `-I`

An instance ID

- Requires a value


## `mount:upload`

```bash
magento-cloud mount:upload [--source SOURCE] [-m|--mount MOUNT] [--delete] [--exclude EXCLUDE] [--include INCLUDE] [--refresh] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-I|--instance INSTANCE] [-i|--identity-file IDENTITY-FILE]
```

Upload files to a mount, using rsync

### Options

For global options, see [Global options](#global-options).

#### `--source`

A directory containing files to upload

- Requires a value

#### `--mount`, `-m`

The mount (as an app-relative path)

- Requires a value

#### `--delete`

Whether to delete extraneous files in the mount

- Default: `false`
- Does not accept a value

#### `--exclude`

File(s) to exclude from the upload (pattern)

- Default: `[]`
- Requires a value

#### `--include`

File(s) not to exclude (pattern)

- Default: `[]`
- Requires a value

#### `--refresh`

Whether to refresh the cache

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--worker`

A worker name

- Requires a value

#### `--instance`, `-I`

An instance ID

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `operation:list`

```bash
magento-cloud ops [--full] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [--format FORMAT] [-c|--columns COLUMNS] [--no-header]
```

 BETA  List runtime operations on an environment

### Options

For global options, see [Global options](#global-options).

#### `--full`

Do not limit the length of command to display. The default limit is 24 lines.

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--worker`

A worker name

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: service*, name*, start*, role, stop (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value


## `operation:run`

```bash
magento-cloud operation:run [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--worker WORKER] [-W|--no-wait] [--wait] [--] [<operation>]
```

 BETA  Run an operation on the environment

### Arguments

#### `operation`

The operation name

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--worker`

A worker name

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `project:clear-build-cache`

```bash
magento-cloud project:clear-build-cache [-p|--project PROJECT]
```

Clear a project's build cache

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value


## `project:get`

```bash
magento-cloud get [-e|--environment ENVIRONMENT] [--depth DEPTH] [--build] [-p|--project PROJECT] [-i|--identity-file IDENTITY-FILE] [--] [<project>] [<directory>]
```

Clone a project locally

### Arguments

#### `project`

The project ID


#### `directory`

The directory to clone to. Defaults to the project title

### Options

For global options, see [Global options](#global-options).

#### `--environment`, `-e`

The environment ID to clone. Defaults to the project default, or the first available environment

- Requires a value

#### `--depth`

Create a shallow clone: limit the number of commits in the history

- Requires a value

#### `--build`

Build the project after cloning

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `project:info`

```bash
magento-cloud project:info [--refresh] [--date-fmt DATE-FMT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT] [-W|--no-wait] [--wait] [--] [<property>] [<value>]
```

Read or set properties for a project

### Arguments

#### `property`

The name of the property


#### `value`

Set a new value for the property

### Options

For global options, see [Global options](#global-options).

#### `--refresh`

Whether to refresh the cache

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `project:list`

```bash
magento-cloud projects [--pipe] [--region REGION] [--title TITLE] [--my] [--refresh REFRESH] [--sort SORT] [--reverse] [--page PAGE] [-c|--count COUNT] [--format FORMAT] [--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT]
```

Get a list of all active projects

### Options

For global options, see [Global options](#global-options).

#### `--pipe`

Output a simple list of project IDs. Disables pagination.

- Default: `false`
- Does not accept a value

#### `--region`

Filter by region (exact match)

- Requires a value

#### `--title`

Filter by title (case-insensitive search)

- Requires a value

#### `--my`

Display only the projects you own

- Default: `false`
- Does not accept a value

#### `--refresh`

Whether to refresh the list

- Default: `1`
- Requires a value

#### `--sort`

A property to sort by

- Default: `title`
- Requires a value

#### `--reverse`

Sort in reverse (descending) order

- Default: `false`
- Does not accept a value

#### `--page`

Page number. This enables pagination, despite configuration or --count. Ignored if --pipe is specified.

- Requires a value

#### `--count`, `-c`

The number of projects to display per page. Use 0 to disable pagination. Ignored if --page is specified.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`

Columns to display. Available columns: id*, title*, region*, created_at, organization_id, organization_label, organization_name, status (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value


## `project:set-remote`

```bash
magento-cloud set-remote [<project>]
```

Set the remote project for the current Git repository

### Arguments

#### `project`

The project ID

### Options

For global options, see [Global options](#global-options).


## `repo:cat`

```bash
magento-cloud repo:cat [-c|--commit COMMIT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] <path>
```

Read a file in the project repository

### Arguments

#### `path`

The path to the file

- Required

### Options

For global options, see [Global options](#global-options).

#### `--commit`, `-c`

The commit SHA. This can also accept "HEAD", and caret (^) or tilde (~) suffixes for parent commits.

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `repo:ls`

```bash
magento-cloud repo:ls [-d|--directories] [-f|--files] [--git-style] [-c|--commit COMMIT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<path>]
```

List files in the project repository

### Arguments

#### `path`

The path to a subdirectory

### Options

For global options, see [Global options](#global-options).

#### `--directories`, `-d`

Show directories only

- Default: `false`
- Does not accept a value

#### `--files`, `-f`

Show files only

- Default: `false`
- Does not accept a value

#### `--git-style`

Style output similar to "git ls-tree"

- Default: `false`
- Does not accept a value

#### `--commit`, `-c`

The commit SHA. This can also accept "HEAD", and caret (^) or tilde (~) suffixes for parent commits.

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `repo:read`

```bash
magento-cloud read [-c|--commit COMMIT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<path>]
```

Read a directory or file in the project repository

### Arguments

#### `path`

The path to the directory or file

### Options

For global options, see [Global options](#global-options).

#### `--commit`, `-c`

The commit SHA. This can also accept "HEAD", and caret (^) or tilde (~) suffixes for parent commits.

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `route:get`

```bash
magento-cloud route:get [--id ID] [-1|--primary] [-P|--property PROPERTY] [--refresh] [--date-fmt DATE-FMT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [-i|--identity-file IDENTITY-FILE] [--] [<route>]
```

View detailed information about a route

### Arguments

#### `route`

The route's original URL

### Options

For global options, see [Global options](#global-options).

#### `--id`

A route ID to select

- Requires a value

#### `--primary`, `-1`

Select the primary route

- Default: `false`
- Does not accept a value

#### `--property`, `-P`

The property to display

- Requires a value

#### `--refresh`

Bypass the cache of routes

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

[Deprecated option, no longer used]

- Requires a value

#### `--identity-file`, `-i`

[Deprecated option, no longer used]

- Requires a value


## `route:list`

```bash
magento-cloud routes [--refresh] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--] [<environment>]
```

List all routes for an environment

### Arguments

#### `environment`

The environment ID

### Options

For global options, see [Global options](#global-options).

#### `--refresh`

Bypass the cache of routes

- Default: `false`
- Does not accept a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: route*, type*, to*, url (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `self:install`

```bash
magento-cloud self:install [--shell-type SHELL-TYPE]
```

Install or update CLI configuration files

```
This command automatically installs shell configuration for the Magento Cloud CLI,
adding autocompletion support and handy aliases. Bash and ZSH are supported.
```

### Options

For global options, see [Global options](#global-options).

#### `--shell-type`

The shell type for autocompletion (bash or zsh)

- Requires a value


## `self:update`

```bash
magento-cloud update [--no-major] [--unstable] [--manifest MANIFEST] [--current-version CURRENT-VERSION] [--timeout TIMEOUT]
```

Update the CLI to the latest version

### Options

For global options, see [Global options](#global-options).

#### `--no-major`

Only update between minor or patch versions

- Default: `false`
- Does not accept a value

#### `--unstable`

Update to a new unstable version, if available

- Default: `false`
- Does not accept a value

#### `--manifest`

Override the manifest file location

- Requires a value

#### `--current-version`

Override the current version

- Requires a value

#### `--timeout`

A timeout for the version check

- Default: `30`
- Requires a value


## `service:list`

```bash
magento-cloud services [--refresh] [--pipe] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header]
```

List services in the project

### Options

For global options, see [Global options](#global-options).

#### `--refresh`

Whether to refresh the cache

- Default: `false`
- Does not accept a value

#### `--pipe`

Output a list of service names only

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: disk, name, size, type. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value


## `service:mongo:dump`

```bash
magento-cloud mongodump [-c|--collection COLLECTION] [-z|--gzip] [-o|--stdout] [-r|--relationship RELATIONSHIP] [-i|--identity-file IDENTITY-FILE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP]
```

Create a binary archive dump of data from MongoDB

### Options

For global options, see [Global options](#global-options).

#### `--collection`, `-c`

The collection to dump

- Requires a value

#### `--gzip`, `-z`

Compress the dump using gzip

- Default: `false`
- Does not accept a value

#### `--stdout`, `-o`

Output to STDOUT instead of a file

- Default: `false`
- Does not accept a value

#### `--relationship`, `-r`

The service relationship to use

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value


## `service:mongo:export`

```bash
magento-cloud mongoexport [-c|--collection COLLECTION] [--jsonArray] [--type TYPE] [-f|--fields FIELDS] [-r|--relationship RELATIONSHIP] [-i|--identity-file IDENTITY-FILE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP]
```

Export data from MongoDB

### Options

For global options, see [Global options](#global-options).

#### `--collection`, `-c`

The collection to export

- Requires a value

#### `--jsonArray`

Export data as a single JSON array

- Default: `false`
- Does not accept a value

#### `--type`

The export type, e.g. "csv"

- Requires a value

#### `--fields`, `-f`

The fields to export

- Default: `[]`
- Requires a value

#### `--relationship`, `-r`

The service relationship to use

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value


## `service:mongo:restore`

```bash
magento-cloud mongorestore [-c|--collection COLLECTION] [-r|--relationship RELATIONSHIP] [-i|--identity-file IDENTITY-FILE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP]
```

Restore a binary archive dump of data into MongoDB

### Options

For global options, see [Global options](#global-options).

#### `--collection`, `-c`

The collection to restore

- Requires a value

#### `--relationship`, `-r`

The service relationship to use

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value


## `service:mongo:shell`

```bash
magento-cloud mongo [--eval EVAL] [-r|--relationship RELATIONSHIP] [-i|--identity-file IDENTITY-FILE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP]
```

Use the MongoDB shell

### Options

For global options, see [Global options](#global-options).

#### `--eval`

Pass a JavaScript fragment to the shell

- Requires a value

#### `--relationship`, `-r`

The service relationship to use

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value


## `service:redis-cli`

```bash
magento-cloud redis [-r|--relationship RELATIONSHIP] [-i|--identity-file IDENTITY-FILE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--] [<args>]
```

Access the Redis CLI

### Arguments

#### `args`

Arguments to add to the Redis command

### Options

For global options, see [Global options](#global-options).

#### `--relationship`, `-r`

The service relationship to use

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value


## `snapshot:create`

```bash
magento-cloud backup [--live] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<environment>]
```

Make a snapshot of an environment

### Arguments

#### `environment`

The environment

### Options

For global options, see [Global options](#global-options).

#### `--live`

Live backup: do not stop the environment. If set, this leaves the environment running and open to connections during the backup. This reduces downtime, at the risk of backing up data in an inconsistent state.

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `snapshot:delete`

```bash
magento-cloud snapshot:delete [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<id>]
```

Delete an environment snapshot

### Arguments

#### `id`

The ID of the snapshot. Required in non-interactive mode.

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `snapshot:get`

```bash
magento-cloud snapshot:get [-P|--property PROPERTY] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--date-fmt DATE-FMT] [--] [<id>]
```

View an environment snapshot

### Arguments

#### `id`

The ID of the snapshot. Defaults to the most recent one.

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The property to display.

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value


## `snapshot:list`

```bash
magento-cloud snapshots [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [--date-fmt DATE-FMT] [-p|--project PROJECT] [-e|--environment ENVIRONMENT]
```

List available snapshots of an environment

### Options

For global options, see [Global options](#global-options).

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `snapshot:restore`

```bash
magento-cloud snapshot:restore [--target TARGET] [--branch-from BRANCH-FROM] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<snapshot>]
```

Restore an environment snapshot

### Arguments

#### `snapshot`

The name of the snapshot. Defaults to the most recent one

### Options

For global options, see [Global options](#global-options).

#### `--target`

The environment to restore to. Defaults to the snapshot's current environment

- Requires a value

#### `--branch-from`

If the --target does not yet exist, this specifies the parent of the new environment

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `source-operation:list`

```bash
magento-cloud source-ops [--full] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header]
```

List source operations on an environment

### Options

For global options, see [Global options](#global-options).

#### `--full`

Do not limit the length of command to display. The default limit is 24 lines.

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: app, command, operation. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value


## `source-operation:run`

```bash
magento-cloud source-operation:run [--variable VARIABLE] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<operation>]
```

Run a source operation

### Arguments

#### `operation`

The operation name

### Options

For global options, see [Global options](#global-options).

#### `--variable`

A variable to set during the operation, in the format type:name=value

- Default: `[]`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `ssh-cert:load`

```bash
magento-cloud ssh-cert:load [--refresh-only] [--new] [--new-key]
```

Generate an SSH certificate

```
This command checks if a valid SSH certificate is present, and generates a
new one if necessary.

Certificates allow you to make SSH connections without having previously
uploaded a public key. They are more secure than keys and they allow for
other features.

Normally the certificate is loaded automatically during login, or when
making an SSH connection. So this command is seldom needed.

If you want to set up certificates without login and without an SSH-related
command, for example if you are writing a script that uses an API token via
an environment variable, then you would probably want to run this command
explicitly. For unattended scripts, remember to turn off interaction via
--yes or the MAGENTO_CLOUD_CLI_NO_INTERACTION environment variable.
```

### Options

For global options, see [Global options](#global-options).

#### `--refresh-only`

Only refresh the certificate, if necessary (do not write SSH config)

- Default: `false`
- Does not accept a value

#### `--new`

Force the certificate to be refreshed

- Default: `false`
- Does not accept a value

#### `--new-key`

[Deprecated] Use --new instead

- Default: `false`
- Does not accept a value


## `ssh-key:add`

```bash
magento-cloud ssh-key:add [--name NAME] [--] [<path>]
```

Add a new SSH key

```
This command lets you add an SSH key to your account. It can generate a key using OpenSSH.

Notice:
SSH keys are no longer needed by default, as SSH certificates are supported.
Certificates offer more security than keys.

To load or check your SSH certificate, run: magento-cloud ssh-cert:load
```

### Arguments

#### `path`

The path to an existing SSH public key

### Options

For global options, see [Global options](#global-options).

#### `--name`

A name to identify the key

- Requires a value


## `ssh-key:delete`

```bash
magento-cloud ssh-key:delete [<id>]
```

Delete an SSH key

```
This command lets you delete SSH keys from your account.

Notice:
SSH keys are no longer needed by default, as SSH certificates are supported.
Certificates offer more security than keys.

To load or check your SSH certificate, run: magento-cloud ssh-cert:load
```

### Arguments

#### `id`

The ID of the SSH key to delete

### Options

For global options, see [Global options](#global-options).


## `ssh-key:list`

```bash
magento-cloud ssh-keys [--format FORMAT] [-c|--columns COLUMNS] [--no-header]
```

Get a list of SSH keys in your account

```
This command lets you list SSH keys in your account.

Notice:
SSH keys are no longer needed by default, as SSH certificates are supported.
Certificates offer more security than keys.

To load or check your SSH certificate, run: magento-cloud ssh-cert:load
```

### Options

For global options, see [Global options](#global-options).

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: id*, title*, path*, fingerprint (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value


## `subscription:info`

```bash
magento-cloud subscription:info [-s|--id ID] [--date-fmt DATE-FMT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT] [--] [<property>] [<value>]
```

Read or modify subscription properties

### Arguments

#### `property`

The name of the property


#### `value`

Set a new value for the property

### Options

For global options, see [Global options](#global-options).

#### `--id`, `-s`

The subscription ID

- Requires a value

#### `--date-fmt`

The date format (as a PHP date format string)

- Default: `c`
- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value


## `tunnel:close`

```bash
magento-cloud tunnel:close [-a|--all] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP]
```

Close SSH tunnels

### Options

For global options, see [Global options](#global-options).

#### `--all`, `-a`

Close all tunnels

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value


## `tunnel:info`

```bash
magento-cloud tunnel:info [-P|--property PROPERTY] [-c|--encode] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP]
```

View relationship info for SSH tunnels

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

The relationship property to view

- Requires a value

#### `--encode`, `-c`

Output as base64-encoded JSON

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value


## `tunnel:list`

```bash
magento-cloud tunnels [-a|--all] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [--format FORMAT] [-c|--columns COLUMNS] [--no-header]
```

List SSH tunnels

### Options

For global options, see [Global options](#global-options).

#### `--all`, `-a`

View all tunnels

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: port*, project*, environment*, app*, relationship*, url (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value


## `tunnel:open`

```bash
magento-cloud tunnel:open [-g|--gateway-ports] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [-i|--identity-file IDENTITY-FILE]
```

Open SSH tunnels to an app's relationships

```
This command opens SSH tunnels to all of the relationships of an application.

Connections can then be made to the application's services as if they were
local, for example a local MySQL client can be used, or the Solr web
administration endpoint can be accessed through a local browser.

This command requires the posix and pcntl PHP extensions (as multiple
background CLI processes are created to keep the SSH tunnels open). The
tunnel:single command can be used on systems without these
extensions.
```

### Options

For global options, see [Global options](#global-options).

#### `--gateway-ports`, `-g`

Allow remote hosts to connect to local forwarded ports

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `tunnel:single`

```bash
magento-cloud tunnel:single [--port PORT] [-g|--gateway-ports] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-A|--app APP] [-r|--relationship RELATIONSHIP] [-i|--identity-file IDENTITY-FILE]
```

Open a single SSH tunnel to an app relationship

### Options

For global options, see [Global options](#global-options).

#### `--port`

The local port

- Requires a value

#### `--gateway-ports`, `-g`

Allow remote hosts to connect to local forwarded ports

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--app`, `-A`

The remote application name

- Requires a value

#### `--relationship`, `-r`

The service relationship to use

- Requires a value

#### `--identity-file`, `-i`

An SSH identity (private key) to use

- Requires a value


## `user:add`

```bash
magento-cloud user:add [-r|--role ROLE] [--force-invite] [-p|--project PROJECT] [-W|--no-wait] [--wait] [--] [<email>]
```

Add a user to the project

### Arguments

#### `email`

The user's email address

### Options

For global options, see [Global options](#global-options).

#### `--role`, `-r`

The user's project role ('admin' or 'viewer') or environment type role (e.g. 'staging:contributor' or 'production:viewer'). To remove a user from an environment type, set the role as 'none'. The % or * characters can be used as a wildcard for the environment type, e.g. '%:viewer' to give the user the 'viewer' role on all types. The role can be abbreviated, e.g. 'production:v'.

- Default: `[]`
- Requires a value

#### `--force-invite`

Send an invitation, even if one has already been sent

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `user:delete`

```bash
magento-cloud user:delete [-p|--project PROJECT] [-W|--no-wait] [--wait] [--] <email>
```

Delete a user from the project

### Arguments

#### `email`

The user's email address

- Required

### Options

For global options, see [Global options](#global-options).

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `user:get`

```bash
magento-cloud user:get [-l|--level LEVEL] [--pipe] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [-r|--role ROLE] [--] [<email>]
```

View a user's role(s)

### Arguments

#### `email`

The user's email address

### Options

For global options, see [Global options](#global-options).

#### `--level`, `-l`

The role level ('project' or 'environment')

- Requires a value

#### `--pipe`

Output the role to stdout (after making any changes)

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value

#### `--role`, `-r`

[Deprecated: use user:update to change a user's role(s)]

- Requires a value


## `user:list`

```bash
magento-cloud users [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT]
```

List project users

### Options

For global options, see [Global options](#global-options).

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: email*, name*, role*, id*, granted_at, updated_at (* = default columns). The character "+" can be used as a placeholder for the default columns. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value


## `user:update`

```bash
magento-cloud user:update [-r|--role ROLE] [-p|--project PROJECT] [-W|--no-wait] [--wait] [--] [<email>]
```

Update user role(s) on a project

### Arguments

#### `email`

The user's email address

### Options

For global options, see [Global options](#global-options).

#### `--role`, `-r`

The user's project role ('admin' or 'viewer') or environment type role (e.g. 'staging:contributor' or 'production:viewer'). To remove a user from an environment type, set the role as 'none'. The % or * characters can be used as a wildcard for the environment type, e.g. '%:viewer' to give the user the 'viewer' role on all types. The role can be abbreviated, e.g. 'production:v'.

- Default: `[]`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `variable:create`

```bash
magento-cloud variable:create [-u|--update] [-l|--level LEVEL] [--name NAME] [--value VALUE] [--json JSON] [--sensitive SENSITIVE] [--prefix PREFIX] [--enabled ENABLED] [--inheritable INHERITABLE] [--visible-build VISIBLE-BUILD] [--visible-runtime VISIBLE-RUNTIME] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] [<name>]
```

Create a variable

### Arguments

#### `name`

The variable name

### Options

For global options, see [Global options](#global-options).

#### `--update`, `-u`

Update the variable if it already exists

- Default: `false`
- Does not accept a value

#### `--level`, `-l`

The level at which to set the variable ('project' or 'environment')

- Requires a value

#### `--name`

The variable name

- Requires a value

#### `--value`

The variable's value

- Requires a value

#### `--json`

Whether the variable value is JSON-formatted

- Default: `false`
- Requires a value

#### `--sensitive`

Whether the variable value is sensitive

- Default: `false`
- Requires a value

#### `--prefix`

The variable name's prefix which can determine its type, e.g. 'env'. Only applicable if the name does not already contain a prefix. (e.g. 'none' or 'env:')

- Default: `none`
- Requires a value

#### `--enabled`

Whether the variable should be enabled on the environment

- Default: `true`
- Requires a value

#### `--inheritable`

Whether the variable is inheritable by child environments

- Default: `true`
- Requires a value

#### `--visible-build`

Whether the variable should be visible at build time

- Requires a value

#### `--visible-runtime`

Whether the variable should be visible at runtime

- Default: `true`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `variable:delete`

```bash
magento-cloud variable:delete [-l|--level LEVEL] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] <name>
```

Delete a variable

### Arguments

#### `name`

The variable name

- Required

### Options

For global options, see [Global options](#global-options).

#### `--level`, `-l`

The variable level ('project', 'environment', 'p' or 'e')

- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `variable:get`

```bash
magento-cloud vget [-P|--property PROPERTY] [-l|--level LEVEL] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--pipe] [--] [<name>]
```

View a variable

### Arguments

#### `name`

The name of the variable

### Options

For global options, see [Global options](#global-options).

#### `--property`, `-P`

View a single variable property

- Requires a value

#### `--level`, `-l`

The variable level ('project', 'environment', 'p' or 'e')

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--pipe`

[Deprecated option] Output the variable value only

- Default: `false`
- Does not accept a value


## `variable:list`

```bash
magento-cloud variables [-l|--level LEVEL] [--format FORMAT] [-c|--columns COLUMNS] [--no-header] [-p|--project PROJECT] [-e|--environment ENVIRONMENT]
```

List variables

### Options

For global options, see [Global options](#global-options).

#### `--level`, `-l`

The variable level ('project', 'environment', 'p' or 'e')

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: is_enabled, level, name, value. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value


## `variable:update`

```bash
magento-cloud variable:update [--allow-no-change] [-l|--level LEVEL] [--value VALUE] [--json JSON] [--sensitive SENSITIVE] [--enabled ENABLED] [--inheritable INHERITABLE] [--visible-build VISIBLE-BUILD] [--visible-runtime VISIBLE-RUNTIME] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [-W|--no-wait] [--wait] [--] <name>
```

Update a variable

### Arguments

#### `name`

The variable name

- Required

### Options

For global options, see [Global options](#global-options).

#### `--allow-no-change`

Return success (zero exit code) if no changes were provided

- Default: `false`
- Does not accept a value

#### `--level`, `-l`

The variable level ('project', 'environment', 'p' or 'e')

- Requires a value

#### `--value`

The variable's value

- Requires a value

#### `--json`

Whether the variable value is JSON-formatted

- Default: `false`
- Requires a value

#### `--sensitive`

Whether the variable value is sensitive

- Default: `false`
- Requires a value

#### `--enabled`

Whether the variable should be enabled on the environment

- Default: `true`
- Requires a value

#### `--inheritable`

Whether the variable is inheritable by child environments

- Default: `true`
- Requires a value

#### `--visible-build`

Whether the variable should be visible at build time

- Requires a value

#### `--visible-runtime`

Whether the variable should be visible at runtime

- Default: `true`
- Requires a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--no-wait`, `-W`

Do not wait for the operation to complete

- Default: `false`
- Does not accept a value

#### `--wait`

Wait for the operation to complete (default)

- Default: `false`
- Does not accept a value


## `worker:list`

```bash
magento-cloud workers [--refresh] [--pipe] [-p|--project PROJECT] [-e|--environment ENVIRONMENT] [--format FORMAT] [-c|--columns COLUMNS] [--no-header]
```

Get a list of all deployed workers

### Options

For global options, see [Global options](#global-options).

#### `--refresh`

Whether to refresh the cache

- Default: `false`
- Does not accept a value

#### `--pipe`

Output a list of worker names only

- Default: `false`
- Does not accept a value

#### `--project`, `-p`

The project ID or URL

- Requires a value

#### `--environment`, `-e`

The environment ID. Use "." to select the project's default environment.

- Requires a value

#### `--format`

The output format: table, csv, tsv, or plain

- Default: `table`
- Requires a value

#### `--columns`, `-c`

Columns to display. Available columns: commands, name, type. The % or * characters may be used as a wildcard. Values may be split by commas (e.g. "a,b,c") and/or whitespace.

- Default: `[]`
- Requires a value

#### `--no-header`

Do not output the table header

- Default: `false`
- Does not accept a value
