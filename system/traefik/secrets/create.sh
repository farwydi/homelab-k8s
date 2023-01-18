kubectl create secret tls cloudflare-client-tls \
  --cert=cloudflare-client-cert.pem \
  --key=cloudflare-client-key.pem \
  -n traefik \
  --dry-run=client -o=yaml | kubeseal --format yaml > ../templates/cloudflare-client-tls.yaml

kubectl create secret generic cloudflare-origin-ca-ecc-root-cert \
  --from-file=cloudflare-origin-ca-ecc-root.crt \
  -n traefik \
  --dry-run=client -o=yaml > ../templates/cloudflare-origin-ca-ecc-root-cert.yaml

kubectl create secret generic cloudflare-origin-pull-ca-cert \
  --from-file=ca.crt \
  -n traefik \
  --dry-run=client -o=yaml | kubeseal --format yaml > ../templates/cloudflare-origin-pull-ca-cert.yaml
