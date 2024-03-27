## Worfklows / GitHub Actions

### Generate Docs

Uses `terraform-docs`, a plugin used to generate terraform documentation from the modules.
* `README.md` will be updated with the documentation of the modules used
* Automatically commits document changes to README.md (See `Auto Commits` for more details)
* Generated documentation will be added here before code block 
```
<!-- BEGIN_TF_DOCS -- >`
<!-- END_TF_DOCS -- >
```

Note: It requires some resources supported by the provider, even with a count of 0 for providers to be added in the documentation.

### Format Code

Uses the formatter within terraform `terraform -fmt` to rewrite Terraform configuration files following a canonical format and style
* Processes files in subdirectories (`-recursive`)
* Automatically commits format in place (See `Auto Commits` for more details)

### Lint Code

Uses tflint, a linter specifically designed to analyze Terraform code and identify issues, errors and any best practice violations.

* `terraform init` will need to run before tflint
* Will run in each directory recursively (`--recursive`)
* Output will be `--format=compact` (other options are default|json|checkstyle|junit|compact|sarif )
* `.tflint.hcl` is the config file that tflint will follow

**Terraform Plugin**

For this implementation we are using a bundled plugin so that we can tailor what we need to run. Particularly the `source` and the `preset`
```
plugin "terraform" {
  enabled = true
  version = "0.5.0"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
  preset  = "all"
}
```

Note: terraform_required_version is disabled since this is a module.
  
**Recommended Rules**

We recommend using the `preset=all` setting however this will need to be further checked as it might fail on Amex modules (particularly the decprecated checks)

For now we've enabled the following:

| Rule | Description|
----------------| -------------
 | terraform_module_version  | Checks that Terraform modules sourced from a registry specify a version|
 | terraform_naming_convention   | Enforces naming conventions for resources, data sources, etc|
| terraform_module_pinned_source   | Disallow specifying a git or mercurial repository as a module source without pinning to a version|

Reference: https://github.com/terraform-linters/tflint-ruleset-terraform/blob/main/docs/rules/README.md 

### CODEOWNERS Validator and Required Files

* Checks that there's a CODEOWNERS file and there's an owner specified.
* Checks check that the following files exists
  * Root Module
    * README.md
    * provider.tf
    * backend.tf
    * .amex/buildblock.yaml
      TODO: Potentially integrate the Buildblocks CLI to validate

### checkov

* checkov is a static code analysis tool used for infrastructure-as-code. 
* Much like tflint, checkov also follows a set of policies that you can dictate but is geared towards security checks. 

__TODO_: HashiCorp and Amex to collaborate on the policies that would be good to have in the template_

* To pull modules on a private registry the following must be set:
  * Enviornment Variables
  ```
  env:
    TF_HOST_NAME: tfe.karla-gabriel.sbx.hashidemos.io
    TF_REGISTRY_TOKEN: ${{ secrets.TF_ORG_TOKEN }}

  ```
  * Flag
  ```
  with:
      download_external_modules: true
  ```

Reference: https://www.checkov.io/5.Policy%20Index/terraform.html

### Auto Commits

An additional step that is added to the workflow to automatically commit the changes it created.

| Required Field             | Corresponding Code | Default Value |
----------------------------| -------------   | -----------
 | User Name that will commit | `git config user.name`| GitHub Actions |
 | Email                      | `git config user.email` | actions@github.com |
 | Commit Message             | `git commit -m` | "fix: Auto format codebase"|

 ### What is Dependabot?

* It is a free GitHub Featue that automatically updates dependencies.
* It ensures that your repository automatically keeps up with the latest releases of packages and applications it depends on

### How does it work?

the `dependabot.yaml` file contains all the configurations you need. 

TODO: AMEX has a different way to using dependabot we will need to port these changes

https://github.com/kgabriel-hashicorp/demo-root-module/blob/main/.github/dependabot.yaml

## Validate

Conventional Commits:
* Make sure all the commits use the correct prefix
* Ensure that the PR title follows the format

prefix: Title (the subect starts with an uppercase character)

## Release 

Only runs after PR is merged to main.

We use the following action and plugins:

* [semantic-release-action](https://github.com/cycjimmy/semantic-release-action) - Creates releases based on commits using ConventionalCommits.
  
  * Rules set up under `.releaserc.json` 
    * `plugins>@semantic-release/commit-analyzer>releaseRules`

* [commitanalyzer](https://github.com/semantic-release/commit-analyzer?tab=readme-ov-file#releaserules) -  make sure the commit messages are correct
* [release-notes-generator](https://github.com/semantic-release/release-notes-generator) - Creates a CHANGELOG.md in the root directory documenting the changes merged.
  * Rules set up under `.releaserc.json` 
    * `plugins>@semantic-release/release-notes-generator>presetConfig>types`
The configuration for these is `.releaserc.json`

