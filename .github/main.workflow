workflow "Build and deploy on push" {
  on = "push"
  resolves = ["Rsync"]
}

action "Build" {
  uses = "actions/npm@master"
  args = "install"
}

action "Rsync" {
  uses = "maxheld83/rsync@v0.1.0"
  needs = ["Build"]
  secrets = [
    "GITHUB_TOKEN",
    "SSH_PUBLIC_KEY",
    "SSH_PRIVATE_KEY",
  ]
  env = {
    HOST_FINGERPRINT = "SHA256:S5INwoGbMK+2omoEyg0x78MpjGEqPly5TG22Ok16nZU"
    HOST_IP = "111.231.255.252"
    HOST_NAME = "bot"
  }
  args = [
    "$GITHUB_WORKSPACE",
    "$HOST_NAME@$HOST_IP:/data/apps/rsshub",
  ]
}
