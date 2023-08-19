variable "gke_cluster_name" {
    default = "tf-cluster"
}

variable "environment" {
    type = string
}

variable "gke_num_nodes" {
    default = 1
}

variable "pods_per_node" {
    default = 50
}

variable "vpc_network" {
    default = "default"
}

variable "subnet" {
    default = "default"
}

variable "gke_cluster_node_pool" {
    type = string
    default = "tf-nodepool-test"
}

variable "machine_type" {
    type = string
    default = "e2-medium"
}

variable "memory_storage_name" {
    type = string
    default = "tf-redis"
}

variable "memory_size" {
    type = number
    default = 1
}

variable "tier" {
    type = string
    default = "BASIC"
}

variable "bucket_name" {
    type = string
    description = "Unique Cloud Storage Bucket name: "

}

variable "enable_versioning" {
    type = bool
    default = false
}

variable "region" {
    type = string
}

variable "zone" {
    type = string
}

variable "project_id" {
    type = string
}

