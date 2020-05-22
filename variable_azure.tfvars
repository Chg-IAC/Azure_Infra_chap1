/*variable "resource_group" {
  description = "The name of your Azure Resource Group."
  default     = "RGMonoVM"
}

variable "location" {
  description = "The region where the virtual network is created."
  default     = "westeurope"
}*/
variable "subscription_id" {
  description = "Id of subscription of azure's provider."
  default     = "feb54016-2be4-4232-80fe-8b20a5d5cbf5"
}
variable "client_id" {
  description = "Id of client Id of azure's provider."
  default     = "f1f75ca5-e824-4bea-b299-62a0fe60aaed"
}
variable "client_secret" {
  description = "Id of client secret Id of azure's provider."
  default     = ".WSw55HRm9cN_Tu4-7mi4oG7zCocXjvF.-"
}
variable "tenant" {
  description = "Id of tenant Id of azure's provider."
  default     = "b26ed726-0ada-415b-9cac-524a317e13b3"
}
variable "resource_group" {
  description = "The name of your Azure Resource Group."
  default     = "RGMonoVM"
}
variable "location" {
  description = "The region where the virtual network is created."
  default     = "westeurope"
}

variable "vm" {
    type    = list(string)
    default = ["vmaz", "test1", "test2"]
}