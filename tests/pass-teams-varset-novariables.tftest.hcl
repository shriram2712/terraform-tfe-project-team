variables {
  organization_name = "hashi-demos-apj"
  project_name      = "tftest-project-testadmin"

  team_project_access = {
    "tftest-project-testadmin-team-admin" = "admin"
  }

  custom_team_project_access = {}

  varset = {
    variables         = {}
    variable_set_name = "tftest-project-varset"
  }
  create_variable_set = true

}

provider "tfe" {
  organization = "hashi-demos-apj"
}



run "test" {
  # Load and count the objects created in the "execute" run block.

  command = apply

  assert {
    condition     = tfe_project.this.name == "tftest-project-testadmin"
    error_message = "Project names matched - tftest-project-testadmin"
  }

  assert {
    condition     = module.terraform-tfe-variable-sets[0].variable_set[0].name == "tftest-project-varset"
    error_message = "varset name matched - tftest-project-varset"
  }

}
