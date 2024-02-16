terraform {
  required_providers {
    opensearch = {
      source = "opensearch-project/opensearch"
      version = "2.2.0"
    }
  }
}

provider "opensearch" {
  url = "https://localhost:9200"
  username          = "admin"
  password          = "admin"
  insecure = true

  version_ping_timeout = "10"

}

resource "opensearch_roles_mapping" "mapper" {
  role_name   = "all_access"
  description = "Mapping all_access role to ldap group"
  backend_roles = ["admin", "Administrator"]
}