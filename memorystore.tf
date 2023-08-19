resource "google_redis_instance" "memory-store-primary" {
    name = var.memory_storage_name
    memory_size_gb = var.memory_size
    tier = var.tier
    authorized_network = var.vpc_network
    location_id = var.zone
}