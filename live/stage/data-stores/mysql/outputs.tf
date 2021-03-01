output "address" {
  value = module.data_store_mysql.address
  description = "Connect to the database at this endpoint"
}

output "port" {
  value = module.data_store_mysql.port
  description = "The port database is listening on"
}
