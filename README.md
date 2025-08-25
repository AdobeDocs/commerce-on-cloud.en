# Adobe Commerce on Cloud Infrastructure

This site contains the latest developer documentation for Commerce on Cloud Infrastructure.

- [Commerce on Cloud Infrastructure Guide](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/user-guide/overview)
- [Get Started with Commerce](https://experienceleague.adobe.com/en/docs/commerce-on-cloud/start/overview) on Cloud infrastructure

## Adobe Open Source Code of Conduct

This project has adopted the [Adobe Open Source Code of Conduct](code-of-conduct.md). For more information, see the [Contributing](contributing.md) article.

## About your contributions to Adobe content

See the [Adobe Docs Contributor Guide](https://experienceleague.adobe.com/en/docs/contributor/contributor-guide/introduction).

How you contribute depends on who you are and the sort of changes you would like to contribute:

### Minor changes

If you are contributing minor updates, visit the article and click the feedback area that appears at the bottom of the article, click **Detailed feedback options**, and then click **Suggest an edit** to go to the markdown source file on GitHub. Use the GitHub UI to make your updates.

Minor corrections or clarifications you submit for documentation and code examples in this repo are covered by the Adobe terms of use.

### Major changes or new articles from community members

If you are part of the Adobe community and you want to create a new article or submit major changes, please use the Issues tab in the Git repository to submit an issue to start a conversation with the documentation team. Once you have agreed to a plan, you will need to work with an employee to help bring that new content in through a combination of work in the public and private repositories.

### Major changes from Adobe employees

If you are a technical writer, program manager, or developer from the product team for an Adobe Experience Cloud solution and it is your job to contribute to or author technical articles, you should use the private repository at `https://git.corp.adobe.com/AdobeDocs`.

## Tools and setup

Community contributors can use the GitHub UI for basic editing or fork the repo to make major contributions.

See the [Adobe Docs Contributor Guide](https://experienceleague.adobe.com/en/docs/contributor/contributor-guide/introduction) for details.

## How to use markdown to format your topic

All the articles in this repository use GitHub flavored markdown. If you are not familiar with markdown, see:

- [Markdown basics](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
- [Printable markdown cheatsheet](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

## Templates

For some topics, we use data files and templates to generate published content. Use cases for this approach include:

- Publishing large sets of programmatically generated content
- Providing a single source of truth for customers across multiple systems that require machine-readable file formats, such as YAML, for integration (e.g., cloud CLI tools, service configurations)

Examples of templated content include, but are not limited to, the following:

- [Cloud CLI reference](help/templated/cloud-cli-ref.md)
- [Cloud packages](help/templated/cloud-packages.md)
- [ECE tools reference](help/templated/ece-tools.md)
- [PHP extensions for cloud](help/templated/php-extensions-cloud.md)

### Generate templated content

In general, most writers only need to add a release version to the product availability and system requirements tables. Maintenance for all other templated content is either automated or managed by a dedicated team member. These instructions are intended for most writers.

>**NOTE:**
>
>- Generating templated content requires working on the command line in a terminal.
>- You must have Ruby installed to run the rendering script. See [_jekyll/.ruby-version](_jekyll/.ruby-version) for the required version.

See the following for a description of the file structure for templated content:

- `_jekyll`—Contains templated topics and required assets
- `_jekyll/_data`—Contains the machine-readable file formats used to render templates
- `_jekyll/templated`—Contains HTML-based template files that use the Liquid templating language
- `help/_includes/templated`—Contains the generated output for templated content in `.md` file format so it can be published in Experience League topics; the rendering script automatically writes generated output into this directory for you

To update templated content:

1. In your text editor, open a data file in the `_jekyll/_data` directory. For example:

   - [Cloud CLI reference](help/templated/cloud-cli-ref.md): `_jekyll/_data/cloud-cli-ref.yaml`
   - [Cloud packages](help/templated/cloud-packages.md): `_jekyll/_data/cloud-packages.yaml`
   - [ECE tools reference](help/templated/ece-tools.md): `_jekyll/_data/ece-tools.yaml`

2. Use the existing YAML structure to create entries.

3. Navigate to the `_jekyll` directory.

   ```bash
   cd _jekyll
   ```

4. Generate templated content and write the output to the `help/_includes/templated` directory.

   ```bash
   rake render
   ```

   >**NOTE:** You must run the script from the `_jekyll` directory. If this is your first time to run the script, you must install Ruby dependencies first with the `bundle install` command.

5. Navigate back to the `root` directory.

   ```bash
   cd ..
   ```

6. Verify that the expected `help/_includes/templated` files were modified.

   ```bash
   git status
   ```

   You should see output similar to the following:

   ```bash
   modified:   _data/cloud-cli-ref.yaml
   modified:   help/_includes/templated/cloud-cli-ref.md
   ```

7. Push your changes.

   ```bash
   git add .
   git commit -m "descriptive message of the intended commit"
   git push
   ```

See the Jekyll documentation for more details on [Data Files](https://jekyllrb.com/docs/datafiles), [Liquid filters](https://jekyllrb.com/docs/liquid/filters/), and other features.
