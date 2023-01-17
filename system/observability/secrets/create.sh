kubectl create secret generic grafana-admin \
  --from-literal=admin-user=admin \
  --from-file=admin-password \
  -n observability \
  --dry-run=client -o=yaml | kubeseal --format yaml > ../templates/secrets.yaml
