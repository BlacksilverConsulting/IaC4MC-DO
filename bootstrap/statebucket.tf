resource "digitalocean_spaces_bucket" "tfstate" {
  name   = "${local.project}-tfstate-${local.uniq}"
  region = local.region
  acl    = "private"
  versioning {
    enabled = true
  }
}

resource "digitalocean_spaces_bucket_policy" "tfstate_policy" {
  bucket = digitalocean_spaces_bucket.tfstate.id
  region = digitalocean_spaces_bucket.tfstate.region
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowTofuStateAccess",
        Effect = "Allow",
        Principal = {
          AWS = "*"
        },
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::${digitalocean_spaces_bucket.tfstate.name}/*",
          "arn:aws:s3:::${digitalocean_spaces_bucket.tfstate.name}"
        ],
      },
    ],
  })
}
