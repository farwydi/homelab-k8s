kubectl create secret tls cloudflare-client-tls \
  --cert=cloudflare-client-cert.pem \
  --key=cloudflare-client-key.pem \
  -n traefik \
  --dry-run=client -o=yaml | kubeseal --format yaml > ../templates/traefik/cloudflare-client-tls.yaml

kubectl create secret generic cloudflare-origin-ca-ecc-root-cert \
  --from-file=cloudflare-origin-ca-ecc-root.crt \
  -n traefik \
  --dry-run=client -o=yaml > ../templates/traefik/cloudflare-origin-ca-ecc-root-cert.yaml

kubeseal --format yaml > ../templates/lgtm/grafana-cloud-logs.yaml < grafana-cloud-logs.yaml
kubeseal --format yaml > ../templates/lgtm/grafana-cloud-metrics.yaml < grafana-cloud-metrics.yaml
