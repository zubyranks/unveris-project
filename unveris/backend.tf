// Configure backend to store tf.state file
terraform {
  backend "gcs" {
    bucket      = "univeris-tfstatefile"
    prefix      = "tfstatefile"
    credentials = "terraform-key.json"

  }
}
