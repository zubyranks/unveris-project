// Display a list of zones that are UP!
output "webserver-info" {
  value = data.google_compute_instance.appserver.network_interface
}
