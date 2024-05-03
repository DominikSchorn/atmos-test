resource "github_repository_environment" "this" {
  for_each            = setunion(toset(["all"]), fileset("${path.module}/stacks/projects/", "*.yaml"))
  environment         = split(".", each.key)[0]
  repository          = "atmos-test"
  prevent_self_review = false
  # reviewers {
  #   users = [data.github_user.current.id]
  # }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}
