resource "google_storage_bucket" "tf-bucket-1" {
    name = var.bucket_name
    location = "US"
    force_destroy = true
    storage_class = "STANDARD"

    uniform_bucket_level_access = true

    lifecycle_rule {
        condition {
            age = 3
        }
        action {
            type = "Delete"
        }
    }

    versioning {
        enabled = var.enable_versioning
    }
}