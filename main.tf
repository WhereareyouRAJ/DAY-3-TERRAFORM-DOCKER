terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}



resource "docker_image" "app_web" {

    name = var.image_name


}

resource "docker_container" "app_web_container" {

    name = var.container_name
    image = docker_image.app_web.name

    ports {
        internal = var.container_port
        external = var.host_port
    }
     
    env = var.env_vars
    
     

}
