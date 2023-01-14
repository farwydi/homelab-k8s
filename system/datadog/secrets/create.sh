kubectl create secret generic datadog-api \
  --from-file=api-key \
  -n datadog \
  --dry-run=client -o=yaml | kubeseal --format yaml > ../templates/secrets.yaml
