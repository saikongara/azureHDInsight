// Application Related Information
variable "ownerinfo" {
  description = "The service primcipal role assignment name"
}
variable "deployment_type" {
  description = "The service primcipal role assignment name"
}
variable "notification_dist_list" {
  description = "The service primcipal role assignment name"
}
variable "environment" {
  description = "The service primcipal role assignment name"
}



variable "persistent_rg" {
  description = "Resource group to house resources deployed using terraform scripts"
}
variable "persistent_vnet" {
  description = "The name of the virtual network."
}
variable "persistent_subnet" {
  description = "The name of the subnet to create in the virtual network."
}
variable "persistent_stoacc" {
  description = "The name of the storage account."
}
variable "persistent_con" {
  description = "The container name of  storage account."
}



variable "hdi_cluster_name" {
  description = "The HD Insight cluster name."
}
variable "hdi_cluster_version" {
  description = "The HD Insight cluster version."
}

variable "hdi_cluster_tier" {
  description = "The HD Insight cluster tier."
}

variable "hdi_spark_version" {
  description = "The Spark version in HD Insight cluster."
}

variable "hdi_user_name" {
  description = "The HD Insight cluster username."
}

variable "hdi_pwd" {
  description = "The HD Insight cluster password."
}

variable "hn_vm_size" {
  description = "The Head node VM size in HD Insight cluster."
}

variable "wn_vm_size" {
  description = "The Worker node VM size in HD Insight cluster."
}

variable "wn_instance_count" {
  description = "The count of Worker node VM's in HD Insight cluster."
}

variable "zk_vm_size" {
  description = "The Zookeeper node VM size in HD Insight cluster."
}