# Create an index with mapping
```
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
```
# Update an index mapping
```
resource "opensearch_index" "test" {
  name               = "terraform-test"
  number_of_shards   = 1
  number_of_replicas = 1
  mappings = jsonencode({
    "properties": {
      "age": {
        "type": "integer"
      },
      "year_of_joining":{
      "type": "integer"
      }
    }
  })
}
```

# Terraform import
```
terraform state list
```

https://developer.hashicorp.com/terraform/cli/commands/state/rm
```
terraform state rm opensearch_index.test

terraform import opensearch_index.test terraform-test
```
