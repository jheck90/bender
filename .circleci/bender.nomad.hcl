job "bender" {
  datacenters = ["dc1"]
  type        = "service"

  constraint {
    attribute = node.unique.name
    value     = "beef-top"
  }

  group "bender" {
    count = 1

    task "bender" {
      driver = "docker"
      config {
        image = "jheck90/bender:latest"
      }
      service {
        name     = "bender"
        provider = "nomad"
      }

      env {
        DISCORD_TOKEN     = $BENDER_SERVER_TOKEN
        DISCORD_SERVER_ID = $BENDER_SERVER_ID
        NOMAD_ADDR        = "http://nomad.the-casill.net:4646/"
      }

      resources {
        cpu    = 256
        memory = 128
      }
    }
  }
}
