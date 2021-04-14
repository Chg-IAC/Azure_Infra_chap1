variable "subscription_id" {
  description = "Id of subscription of azure's provider."
  default     = "id_sub"
}
variable "client_id" {
  description = "Id of client Id of azure's provider."
  default     = "id_client"
}
variable "client_secret" {
  description = "Id of client secret Id of azure's provider."
  default     = "id_client_secret"
}
variable "tenant" {
  description = "Id of tenant Id of azure's provider."
  default     = "id_tenant"
}
variable "resource_group" {
  description = "The name of your Azure Resource Group."
  default     = "RGMonoVM"
}
variable "location" {
  description = "The region where the virtual network is created."
  default     = "westeurope"
}

