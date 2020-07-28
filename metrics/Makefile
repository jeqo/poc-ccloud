all:

api-key:
	ccloud kafka cluster use ${CCLOUD_KAFKA_CLUSTER_ID}
	ccloud api-key create --resource cloud --description "Metrics API client"

CCLOUD_METRICS_API_URL := https://api.telemetry.confluent.cloud/v1/metrics/cloud

metrics-descriptors:
	curl -sSL --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/descriptors | jq .

metrics-attributes:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/attributes_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/attributes | jq .

#TODO query topics

#TODO query clusters

metrics-query-sent-bytes:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/sent_bytes_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/query | jq .
metrics-query-received-bytes:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/received_bytes_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/query | jq .

#TODO reteined bytes

metrics-available:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/available_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/available | jq .