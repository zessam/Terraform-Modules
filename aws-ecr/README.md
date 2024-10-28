## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image_scanning_enabled"></a> [image\_scanning\_enabled](#input\_image\_scanning\_enabled) | Option whether to enable image scanning on push | `bool` | `true` | no |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | Tag mutability setting for the repository, values can be either `MUTABLE` or `IMMUTABLE` | `string` | `"MUTABLE"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the repository | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of maps of tags to add | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the repository |
| <a name="output_name"></a> [name](#output\_name) | The name of the repository |
| <a name="output_url"></a> [url](#output\_url) | The url of the repository |