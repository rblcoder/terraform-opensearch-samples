terraform {
  required_providers {
    opensearch = {
      source = "opensearch-project/opensearch"
      version = "2.1.0"
    }
  }
}

provider "opensearch" {
  url = "http://127.0.0.1:9200"
  healthcheck       = "false"

  username          = "admin"
  password          = "admin"


}

resource "opensearch_index" "test" {
  name               = "terraform-test"
  number_of_shards   = 1
  number_of_replicas = 1
  mappings = jsonencode({
    "properties": {
      "age": {
        "type": "integer"
      }
    }
  })
}