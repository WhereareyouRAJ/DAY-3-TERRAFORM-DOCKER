variable "image_name" {
    type = string
    default = "appdynamics/sample-app-web"
    description = "Docker image to use"
}

variable "container_name" {
    type = string 
    default = "appdynamics_web"
    description = "Name of the Docker container"
}

variable "container_port" {
     type = number 
     default = 8080
     description = "Container internal port"

}

variable "host_port" {
       type = number
       default = 9091
       description = "Port exposed on localhost"
}

variable "env_vars" {
  type = list(string)
  description = "Environment variables for the container"
  default = [
    "APPD_APP_NAME=SampleApp",
    "APPD_TIER_NAME=WebTier",
    "APPD_NODE_NAME=WebNode",
    "APPD_CONTROLLER_HOST=localhost",
    "APPD_CONTROLLER_PORT=8090",
    "APPD_ACCOUNT_NAME=customer1",
    "APPD_ACCESS_KEY=abcd1234"
  ]
}