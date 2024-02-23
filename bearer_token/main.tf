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

token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcwODY5MDcxNn0.OnlqgZx2xsQFmZ1xAetDqBkxcYJyRMs5Wi3Bwzx2xIw"
token_name = "Bearer"

insecure = true
healthcheck = false
}

resource "opensearch_index" "index" {
  name = "sample"
  number_of_replicas = "1"
  number_of_shards = "1"
}

