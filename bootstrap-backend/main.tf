resource "aws_s3_bucket" "state_storage" {
    bucket = "terraform_state_storage"
    tags = {
        Name = "terraform_state_storage"
        env  = "Dev"
    }
}

resource "terraform_state_storage" "bucket_versioning" {
    bucket = aws_s3_bucket.state_storage.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
    bucket = aws_s3_bucket.state_storage.id
    restrict_public_buckets = true
    block_public_acls       = true
    ignore_public_acls      = true
    block_public_policies   = true
}