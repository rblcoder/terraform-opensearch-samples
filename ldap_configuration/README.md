# Demonstrate add ldap group as backend-role in role mapping 
## The docker compose created using instructions from 
https://opster.com/guides/opensearch/opensearch-security/active-directory-ldap-authentication/

https://opensearch.org/docs/latest/install-and-configure/install-opensearch/docker/

## Helpful links

install docker
https://linux.how2shout.com/how-to-install-docker-on-amazon-linux-2023/

install docker-compose
https://gist.github.com/npearce/6f3c7826c7499587f00957fee62f8ee9

install terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli


From https://opensearch.org/docs/latest/install-and-configure/install-opensearch/docker/ 
```
sudo swapoff -a

sudo vi /etc/sysctl.conf

vm.max_map_count=262144

sudo sysctl -p

cat /proc/sys/vm/max_map_count
```
