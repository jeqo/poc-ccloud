# CCloud Metrics

Scripts to test [CCloud Metrics API](https://docs.confluent.io/current/cloud/metrics-api.html).

## How to test

NOTE: Replace cluster ID on [JSON files](./queries)

### Metrics Endpoints

- `/descriptors`: Metric descriptions
- `/attributes`: List of grouped labels
- `/available`: Metrics available
- `/query`: Time-series queries

### Payload

- `aggregations`: Metric + aggregation operation (e.g. "SUM")
- `filter`: Filter one cluster AND optionally other labels
- `granularity`: Aggregation period. [Supported granularity](https://docs.confluent.io/current/cloud/metrics-api.html#what-is-the-granularity-of-data-in-the-metrics-api)
- `group_by`: To aggregate based on an additional dimension. e.g.: retained bytes grouped by cluster id. Optional.
- `intervals`: Periods of time to get metrics from. ISO date formats or 1 ISO date format + Period. e.g.: `"2019-12-19T11:00:00-05:00/P0Y0M0DT2H0M0S"`. [Maximun intervals by granularity](https://docs.confluent.io/current/cloud/metrics-api.html#what-is-the-granularity-of-data-in-the-metrics-api)
- `limit`: Limit of metrics per unit (e.g. topic or topic/partition)