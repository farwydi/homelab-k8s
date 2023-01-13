ssh-keygen -t ed25519 -C "buildkite@farwydi.dev" -f private-ssh-key

kubectl create secret generic buildkite-secrets \
  --from-file=private-ssh-key \
  -n buildkite \
  --dry-run=client -o=yaml | kubeseal --format yaml > ../templates/secrets.yaml

kubectl create secret generic buildkite-agent-token \
  --from-file=token \
  -n buildkite \
  --dry-run=client -o=yaml | kubeseal --format yaml > ../templates/agent-token.yaml

kubectl create secret generic do-registry \
  --from-file=config.json \
  -n buildkite \
  --dry-run=client -o=yaml | kubeseal --format yaml > ../templates/do-registry.yaml
