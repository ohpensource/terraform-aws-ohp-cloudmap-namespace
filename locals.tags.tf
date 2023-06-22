locals {
  baseline          = "cloudmap"
  baseline_iac_repo = "https://github.com/ohpensource/terraform-aws-ohp-cloudmap-namespace"

  baseline_tags = merge(
    var.tags,
    {
      Service    = "${local.baseline}"
      Component = local.baseline_iac_repo
    }
  )  
}