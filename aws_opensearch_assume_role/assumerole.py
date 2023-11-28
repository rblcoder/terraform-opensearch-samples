from urllib.parse import urlparse

import boto3
from boto3 import Session
from opensearchpy import AWSV4SignerAuth, OpenSearch, RequestsHttpConnection



url = urlparse("url")
region = 'region'

sts_client = boto3.client(
  "sts", aws_access_key_id="access",
  aws_secret_access_key="secret"
)
d
response = sts_client.assume_role(
            RoleArn="rolearnd",
            RoleSessionName="python-code",
            ExternalId="external-id"
        )
temp_credentials = response["Credentials"]

credentials = Session(temp_credentials["AccessKeyId"],
                      temp_credentials["SecretAccessKey"],
                      temp_credentials["SessionToken"]).get_credentials()


auth = AWSV4SignerAuth(credentials, region, service='es')

client = OpenSearch(
  hosts=[{
    'host': "url",
    'port': url.port or 443
  }],
  http_auth=auth,
  use_ssl=True,
  verify_certs=True,
  connection_class=RequestsHttpConnection
)

info = client.info()
print(f"{info['version']['distribution']}: {info['version']['number']}")

index_name = 'python-test-index2'
index_body = {
  'settings': {
    'index': {
      'number_of_shards': 2
    }
  }
}

response = client.indices.create(index_name, body=index_body)
print(response)