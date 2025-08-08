# non-prod/github/terragrunt.hcl

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "git::https://github.com/opencloudhub/infra-modules.git//modules/github?ref=main"
}

inputs = {
  # Pass through from environment
  github_token = get_env("GITHUB_TOKEN")
  github_owner = get_env("GITHUB_OWNER", "OpenCloudHub")

  # JSON configurations
  organization_config  = jsondecode(file("organization-config.json"))
  teams                = jsondecode(file("teams.json"))
  repositories         = jsondecode(file("repositories.json"))
  organization_members = jsondecode(file("members.json"))
  common_labels        = jsondecode(file("labels.json"))
  common_milestones    = jsondecode(file("milestones.json"))
  security_config      = jsondecode(file("security-config.json"))

  # Team slug for security management
  security_manager_team_slug = "admin"

  # GitHub plan
  github_plan = "free"
}
