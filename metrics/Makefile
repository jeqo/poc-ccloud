all:

# API Key to be used by monitoring application. Only one is required for the whole subscription.
api-key:
	ccloud api-key create --resource cloud --description "Metrics API client"

# Metrics API endpoint
CCLOUD_METRICS_API_URL := https://api.telemetry.confluent.cloud/v1/metrics/cloud

# Description of metrics/labels available.
metrics-descriptors:
	curl -sSL --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/descriptors | jq .

# Group of attributes available per metric. e.g. topics available per metric sent_bytes
metrics-attributes:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/attributes_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/attributes | jq .

# List topics with sent bytes
metrics-attributes-sent-bytes-topic:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/attributes_query_sent_bytes_topics.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/attributes | jq .
# List topics with received bytes
metrics-attributes-received-bytes-topic:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/attributes_query_received_bytes_topics.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/attributes | jq .

#TODO query clusters

metrics-query-sent-bytes:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/sent_bytes_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/query | jq .
metrics-query-received-bytes:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/received_bytes_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/query | jq .
metrics-query-sent-records:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/sent_records_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/query | jq .
metrics-query-received-records:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/received_records_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/query | jq .
metrics-query-retained-bytes:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/retained_bytes_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/query | jq .

metrics-available:
	curl -sSL -XPOST -H 'Content-type: application/json' --data @queries/available_query.json --user '${CCLOUD_API_KEY}:${CCLOUD_API_SECRET}' ${CCLOUD_METRICS_API_URL}/available | jq .