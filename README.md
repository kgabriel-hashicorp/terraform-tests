# Module Name
- High level description of the Module

## Purpose
- What is the module for?
- What is the motivation behind the project?
- What problem is it solving
- Target audience/user

## Usage
- How to install and the module?
- Provide step-by-step descriptionof how to get development/local environment setup and running
- Provide instructions/examples users/developers/contributors can reference

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.45.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Using Pre-Commit

1. Install pre-commit

    `pip install pre-commit`

    `brew install pre-commit`
    
2. Install git hook scripts

    `pre-commit install`
3. Run pre-commit against all files

    `pre-commit run -a`

## Contributing
How to contribute to the module?
If using CI tools for release, you can specify here

## Maintainers
This is usually specified by GitHub already but you can also link a distribution list or Teams Channel
