# Steps to use this code
## Export AWS_PROFILE and run terraform apply
```
export AWS_PROFILE=profile_name
terraform apply
```
I had got a time-out error

 `Error: timeout after 5 seconds while pinging 'url' to determine server version, please consider setting 'opensearch_version' to avoid this lookup`

 I have set it to 10 seconds. You can adjust the timeout further using version_ping_timeout