# # 🏗️ Terraform-AWS-Acm

[![OpsStation](https://img.shields.io/badge/Made%20by-OpsStation-blue?style=flat-square&logo=terraform)](https://www.opsstation.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Terraform](https://img.shields.io/badge/Terraform-1.13%2B-purple.svg?logo=terraform)](#)
[![CI](https://github.com/OpsStation/terraform-aws-ec2/actions/workflows/ci.yml/badge.svg)](https://github.com/OpsStation/terraform-aws-ec2/actions/workflows/ci.yml)

> 🌩️ **A production-grade, reusable AWS Ec2 module by [OpsStation](https://www.opsstation.com)**
> Designed for reliability, performance, and security — following AWS networking best practices.
---

## 🏢 About OpsStation

**OpsStation** delivers **Cloud & DevOps excellence** for modern teams:
- 🚀 **Infrastructure Automation** with Terraform, Ansible & Kubernetes
- 💰 **Cost Optimization** via scaling & right-sizing
- 🛡️ **Security & Compliance** baked into CI/CD pipelines
- ⚙️ **Fully Managed Operations** across AWS, Azure, and GCP

> 💡 Need enterprise-grade DevOps automation?
> 👉 Visit [**www.opsstation.com**](https://www.opsstation.com) or email **hello@opsstation.com**

---

## 🌟 Features

- ✅ Creates and manages **AWS ACM (SSL/TLS) certificates** for your domains
- ✅ Supports both **public** and **private** certificate creation
- ✅ Enables **automatic certificate renewal** with DNS or Email validation
- ✅ Seamless integration with **AWS services** such as **ALB, CloudFront, API Gateway, and Elastic Beanstalk**
- ✅ Supports **DNS validation** using **Route53** for fully automated verification
- ✅ Allows **importing existing certificates** from external providers (e.g., GoDaddy, DigiCert)
- ✅ Provides **certificate validation status outputs** and resource references
- ✅ Automatically applies **standardized tagging and naming conventions** via the **Labels module**
- ✅ Fully compatible with other **OpsStation Terraform modules** for networking and security automation

---

## ⚙️ Usage Example
## Example: generate-certificate-dns

```hcl
module "acm" {
  source                    = "git::https://github.com/opsstation/terraform-aws-acm.git?ref=v1.0.0"
  name                      = "certificate"
  environment               = "test"
  domain_name               = "opsstation.com"
  subject_alternative_names = ["*.${local.domain}", "www.${local.domain}"]
}
```

## Example: generate-certificate-email
```hcl
module "acm" {
  source                    = "git::https://github.com/opsstation/terraform-aws-acm.git?ref=v1.0.0"
  name                      = "certificate"
  environment               = "test"
  validate_certificate      = false
  domain_name               = "opsstation.com"
  subject_alternative_names = ["www.opsstation.com"]
  validation_method         = "EMAIL"
}
```

## Example: import-certificate
```hcl
module "acm" {
  source             = "git::https://github.com/opsstation/terraform-aws-acm.git?ref=v1.0.0"
  name               = "certificate"
  environment        = "test"
  import_certificate = true
  private_key        = "./../../../opsstation-private-key.pem"
  certificate_body   = "./../../../opsstation-cert.pem"
  certificate_chain  = "./../../../opsstation-chain.crt"
}
```
# 🔐 Outputs (AWS ACM Module)

| Name | Description |
|------|-------------|
| `certificate_arn` | The ARN (Amazon Resource Name) of the created **ACM certificate**. |
| `domain_name` | The **domain name** associated with the ACM certificate. |
| `status` | The current **status** of the ACM certificate (e.g., ISSUED, PENDING_VALIDATION). |
| `validation_method` | The **validation method** used for the certificate (e.g., DNS, EMAIL). |
| `subject_alternative_names` | The list of **Subject Alternative Names (SANs)** included in the certificate. |
| `certificate_id` | The unique **identifier** of the created ACM certificate. |
| `tags` | A mapping of **tags** assigned to the ACM certificate resource. |

### ☁️ Tag Normalization Rules (AWS)

| Cloud | Case      | Allowed Characters | Example                            |
|--------|-----------|------------------|------------------------------------|
| **AWS** | TitleCase | Any              | `Name`, `Environment`, `CostCenter` |

---

### 💙 Maintained by [OpsStation](https://www.opsstation.com)
> OpsStation — Simplifying Cloud, Securing Scale.
