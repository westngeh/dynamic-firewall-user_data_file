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
| [aws_instance.db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.webSG](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_egress"></a> [egress](#input\_egress) | n/a | `list(number)` | <pre>[<br>  80,<br>  443<br>]</pre> | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | n/a | `list(number)` | <pre>[<br>  80,<br>  443<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_PrivateIP"></a> [PrivateIP](#output\_PrivateIP) | n/a |
| <a name="output_PublicIP"></a> [PublicIP](#output\_PublicIP) | n/a |
