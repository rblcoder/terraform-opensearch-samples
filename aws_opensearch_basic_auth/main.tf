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
  healthcheck       = "false"
  aws_region        = "region"
  username          = "username"
  password          = "password"
  sign_aws_requests = "false" 
  version_ping_timeout = "10"

}

resource "opensearch_index" "index" {
  name = "sample"
  number_of_replicas = "1"
  number_of_shards = "1"
}


