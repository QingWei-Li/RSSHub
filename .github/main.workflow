workflow "Build and deploy on push" {
  resolves = ["Rsync Deploy"]
  on = "push"
}

action "Rsync Deploy" {
  uses = "maxheld83/rsync@v0.1.0"
  secrets = ["GITHUB_TOKEN", "SSH_PRIVATE_KEY", "SSH_PUBLIC_KEY"]
  env = {
    HOST_NAME = "rsshub"
    HOST_IP = "172.104.238.195"
    HOST_FINGERPRINT = "SHA256:S5INwoGbMK+2omoEyg0x78MpjGEqPly5TG22Ok16nZU"
  }
}
