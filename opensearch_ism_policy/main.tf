terraform {
  required_providers {
    opensearch = {
      source = "opensearch-project/opensearch"
      version = "2.2.0"
    }
  }
}

provider "opensearch" {
  url = "http://127.0.0.1:9200"
  username = "admin"
  password = "admin"
}

resource "opensearch_ism_policy" "rollover_index_policy" {
  policy_id = "rollover_policy"
  body      = jsonencode(
    {
    "policy": {
        "description": "Example rollover policy.",
        "default_state": "rollover",
        "states": [
        {
            "name": "rollover",
            "actions": [
            {
                "rollover": {
                "min_doc_count": 1
                }
            }
            ],
            "transitions": []
        }
        ],
        "ism_template": {
            "index_patterns": ["log*"],
            "priority": 100
        }
    }
  }
  )

}



resource "opensearch_index_template" "index_template" {
  name = "ism_rollover"
  body = jsonencode(
    {
  "index_patterns": ["log*"],

  "template": {
   "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 1,
    "plugins.index_state_management.rollover_alias": "log"
    }
  }
 }

  )
}



resource "opensearch_index" "index" {
  name = "log-000001"

  aliases = jsonencode(
   {
    "log": {
      "is_write_index": true
    }
  }
  )

  depends_on = [opensearch_index_template.index_template]
}
