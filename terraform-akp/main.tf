terraform {
  required_providers {
    akp = {
      source = "akuity/akp"
      version = "~> 0.8.1"
    }
  }
}

provider "akp" {
  org_name = "akuity"
}

resource "akp_instance" "argocd" {
  name = "afzal-instance-test"
  argocd = {
    "spec" = {
      "instance_spec" = {
        declarative_management_enabled = true
      }
      version = "v2.14.2"
    }
  }

  argocd_cm = {
    "accounts.admin"                 = "apiKey,login"
    "exec.enabled"                   = true
    "ga.anonymizeusers"              = false
    "helm.enabled"                   = true
    "kustomize.enabled"              = true
    "server.rbac.log.enforce.enable" = false
    "statusbadge.enabled"            = false
    "ui.bannerpermanent"             = false
    "users.anonymous.enabled"        = false
  }
  argocd_secret = {
    "admin.password" = "$2a$10$Yswzbr69F.SyV/E80r/bDOEH2Z6RQAaL4pf6NP0DJxemGFxnbOtg2" # cleartext is omgwtfbbq
  }
}
