all:

ENVIRONMENT_NAME := jeqo-default
ENVIRONMENT_ID := env-23xoq

environment:
	ccloud environment create ${ENVIRONMENT_NAME}

get_environment:
	ccloud environment list -o json | jq -r '.[] | select(.name=="${ENVIRONMENT_NAME}") | .id'

use_environment:
	ccloud environment use ${ENVIRONMENT_ID}

CLUSTER_NAME := test
CLOUD_PROVIDER := aws
CLOUD_REGION := eu-west-2
CLUSTER_AVAILABILITY := single-zone
CLUSTER_TYPE := basic

cluster: use_environment
	ccloud kafka cluster create ${CLUSTER_NAME} \
		--cloud ${CLOUD_PROVIDER} \
		--region ${CLOUD_REGION} \
		--availability ${CLUSTER_AVAILABILITY} \
		--type ${CLUSTER_TYPE}

get_cluster:
	ccloud kafka cluster list -o json | jq -r '.[] | select(.name=="${CLUSTER_NAME}") | .id'

CLUSTER_ID := lkc-9pkgm

use_cluster:
	ccloud kafka cluster use ${CLUSTER_ID}

service-account:
	ccloud service-account create test-console --description "Console app: Test"

SA_ID := 88802

acl:
	ccloud kafka acl create --allow --service-account ${SA_ID} \
		--operation "READ" --operation "WRITE" --operation "DESCRIBE" \
		--topic "test"
	ccloud kafka acl create --allow --service-account ${SA_ID} \
		--operation "READ" --operation "DESCRIBE" \
		--consumer-group "test-group"

.PHONY: sr
sr:
	ccloud schema-registry cluster enable --cloud aws --geo eu

SR_ID := lsrc-8gwzr

api-key:
	ccloud api-key create --resource ${CLUSTER_ID} --service-account ${SA_ID}
	ccloud api-key create --resource ${SR_ID}

# Avro examples from: https://medium.com/@simon.aubury/kafka-with-avro-vs-kafka-with-protobuf-vs-kafka-with-json-schema-667494cbb2af

avro-producer:
	${CONFLUENT_HOME}/bin/kafka-avro-console-producer  --broker-list pkc-41wq6.eu-west-2.aws.confluent.cloud:9092 --topic test --producer.config ccloud.properties  --property value.schema=' \
	{ \
		"type": "record", \
		"name": "myrecord", \
		"fields": [ \
				{"name": "name",  "type": "string" } \
			, {"name": "calories", "type": "float" } \
			, {"name": "colour", "type": "string" } \
		] \
	}' < test.data

avro-consumer:
	${CONFLUENT_HOME}/bin/kafka-avro-console-consumer --bootstrap-server pkc-41wq6.eu-west-2.aws.confluent.cloud:9092 --topic test --from-beginning --consumer.config ccloud.properties