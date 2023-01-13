kubeseal --format yaml > ../templates/logs/secrets.yaml < grafana-cloud-logs.yaml
kubeseal --format yaml > ../templates/metrics/secrets.yaml < grafana-cloud-metrics.yaml
