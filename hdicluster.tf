data "azurerm_storage_account" "resource-hdi-storage" {
  name                = "${var.persistent_stoacc}"
  resource_group_name = "${var.persistent_rg}"

}

data "azurerm_virtual_network" "resource-hdi-vnet" {
  name                = "${var.persistent_vnet}"
  resource_group_name = "${var.persistent_rg}"
}

data "azurerm_subnet" "resource-hdi-subnet" {
  name                 = "${var.persistent_subnet}"
  virtual_network_name = "${var.persistent_vnet}"
  resource_group_name  = "${var.persistent_rg}"
}

resource "azurerm_hdinsight_spark_cluster" "resource-hdi-sparkcluster" {
  name                = "${var.hdi_cluster_name}"
  resource_group_name = "${var.persistent_rg}"
  location            = "${data.azurerm_storage_account.resource-hdi-storage.location}"
  cluster_version     = "${var.hdi_cluster_version}"
  tier                = "${var.hdi_cluster_tier}"

  component_version {
    spark = "${var.hdi_spark_version}"
  }

  gateway {
    enabled  = true
    username = "${var.hdi_user_name}"
    password = "${var.hdi_pwd}"
  }

  storage_account {
//    storage_container_id = "${data.azurerm_storage_account.resource-hdi-storage.azurerm_storage_container.persistent_container_blob.id}"
    storage_container_id = "${data.azurerm_storage_account.resource-hdi-storage.primary_blob_endpoint}${var.persistent_con}"
    storage_account_key  = "${data.azurerm_storage_account.resource-hdi-storage.primary_access_key}"
    is_default           = true
  }

  roles {
    head_node {
      vm_size  = "${var.hn_vm_size}"
      username = "${var.hdi_user_name}"
      password = "${var.hdi_pwd}"
      virtual_network_id = "${data.azurerm_virtual_network.resource-hdi-vnet.id}"
      subnet_id = "${data.azurerm_subnet.resource-hdi-subnet.id}"
    }

    worker_node {
      vm_size               = "${var.wn_vm_size}"
      username              = "${var.hdi_user_name}"
      password              = "${var.hdi_pwd}"
      target_instance_count = tonumber("${var.wn_instance_count}")
      virtual_network_id = "${data.azurerm_virtual_network.resource-hdi-vnet.id}"
      subnet_id = "${data.azurerm_subnet.resource-hdi-subnet.id}"
    }

    zookeeper_node {
      vm_size  = "${var.zk_vm_size}"
      username = "${var.hdi_user_name}"
      password = "${var.hdi_pwd}"
      virtual_network_id = "${data.azurerm_virtual_network.resource-hdi-vnet.id}"
      subnet_id = "${data.azurerm_subnet.resource-hdi-subnet.id}"
    }
  }
}