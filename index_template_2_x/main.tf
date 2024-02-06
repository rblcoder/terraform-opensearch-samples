terraform {
  required_providers {
    opensearch = {
      source = "opensearch-project/opensearch"
      version = "2.2.0"
    }
  }
}

provider "opensearch" {
  url = "http://localhost:9200"
  username          = "admin"
  password          = "admin"

  version_ping_timeout = "10"

}

resource "opensearch_index_template" "test" {
  name = "terraform-test"
  body = <<EOF
  {
	"index_patterns": [
	  "logs-2020-01-*"
	],
	"template": {
	  "aliases": {
		"my_logs": {}
	  },
	  "mappings": {
		"properties": {
		  "timestamp": {
			"type": "date",
			"format": "yyyy-MM-dd HH:mm:ss||yyyy-MM-dd||epoch_millis"
		  },
		  "value": {
			"type": "double"
		  }
		}
	  }
	}
  }
EOF
}