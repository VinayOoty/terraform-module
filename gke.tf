data "google_container_engine_versions" "gke_version" {
  location = var.region
  version_prefix = "1.27."
}

resource "google_container_cluster" "primary" {
    name = var.gke_cluster_name
    location = var.region

    remove_default_node_pool = true
    initial_node_count = 1
    default_max_pods_per_node = var.pods_per_node
    enable_shielded_nodes = true

    network = var.vpc_network
    subnetwork = var.subnet
}

resource "google_container_node_pool" "primary_nodes" {
    name = var.gke_cluster_node_pool
    cluster = google_container_cluster.primary.name
    location = var.region

    version = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]
    node_count = var.gke_num_nodes

    node_config {
        oauth_scopes = [
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
        ]
    

        labels = {
            env = var.project_id
        }

        machine_type = var.machine_type
        tags = ["gke-node", "${var.gke_cluster_name}-${var.environment}"]
        metadata = {
            disable-legacy-endpoints = "true"
        }
    }
}