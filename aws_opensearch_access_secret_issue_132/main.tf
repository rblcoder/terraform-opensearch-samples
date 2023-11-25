terraform {
  required_providers {
    opensearch = {
      source = "opensearch-project/opensearch"
      version = "2.1.0"
    }
  }
}

provider "opensearch" {
 url = "url"
  healthcheck        = "false"
  aws_region          = "region"
  aws_assume_role_arn = "role arn"
  aws_assume_role_external_id = "external id"
  version_ping_timeout = "10"

}

resource "opensearch_index" "index" {
  name = "sample"
  number_of_replicas = "1"
  number_of_shards = "1"
}


