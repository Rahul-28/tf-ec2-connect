terraform {
    backend {
        bucket = "terraform_state_storage"
        key = "prod/network/terraform.tfstate"
        encrypt = true
        region = "us-east-1"
        use_lockfile = true
    }
}