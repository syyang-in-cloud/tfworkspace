terraform {
  before_hook "workspace" {
    commands = ["plan", "state", "apply", "destroy", "init"]
    execute = ["terraform", "workspace", "select", run_cmd("terraform", "workspace", "show")]
  }
}
