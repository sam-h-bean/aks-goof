terraform {
  backend "remote" {
    organization = "data-conductors"

    workspaces {
      name = "akf-goof"
    }
  }
}
