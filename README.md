# ✅ Project: Provisioning a Docker Container Using Terraform

<!-- 🚀 Project Type -->
![Project Type](https://img.shields.io/badge/Project-Dockerized%20App-blueviolet?style=for-the-badge&logo=docker&logoColor=white)

<!-- ⚙️ Terraform Version -->
![Terraform](https://img.shields.io/badge/Terraform-v1.6.0-623CE4?style=for-the-badge&logo=terraform&logoColor=white)

<!-- 🐳 Docker -->
![Docker](https://img.shields.io/badge/Docker-Container%20Based-2496ED?style=for-the-badge&logo=docker&logoColor=white)

<!-- 🔥 Learning -->
![DevOps Learning](https://img.shields.io/badge/DevOps-Journey-orange?style=for-the-badge&logo=git&logoColor=white)

---

# 🚀 Provision a Docker Container using Terraform

This project demonstrates how to provision a Docker container running a web application using **Terraform**, following Infrastructure as Code (IaC) principles.

---

## 📌 Objective

Provision a local **Docker container** with an aesthetic and lightweight **web app** (`appdynamics/sample-app-web`) using **Terraform**.

---

## 🧰 Tools & Technologies

- 🐳 **Docker**
- ⚙️ **Terraform**
- 🖥️ **AppDynamics Sample Web App**
- 💻 **Host OS**: Windows/Linux/macOS (Docker installed)

---

## 📂 Project Structure

```plaintext
terraform-docker-app/
├── main.tf           # Main Terraform configuration
├── variables.tf      # Input variables for flexibility
├── outputs.tf        # Output values after provisioning
├── terraform.tfstate # Terraform state file (auto-generated)
└── README.md         # Project documentation
```

---

## ⚙️ `main.tf` (Core Configuration)

```hcl
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
    name  = var.container_name
    image = docker_image.app_web.name

    ports {
        internal = var.container_port
        external = var.host_port
    }

    env = var.env_vars
}
```

---

## 🔧 `variables.tf`

```hcl
variable "image_name" {
    type        = string
    default     = "appdynamics/sample-app-web"
    description = "Docker image to use"
}

variable "container_name" {
    type        = string
    default     = "appdynamics_web"
    description = "Name of the Docker container"
}

variable "container_port" {
    type        = number
    default     = 8080
    description = "Container internal port"
}

variable "host_port" {
    type        = number
    default     = 9091
    description = "Port exposed on localhost"
}

variable "env_vars" {
    type        = list(string)
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
```

---

## 📤 `outputs.tf`

```hcl
output "app_url" {
    value = "http://localhost:${var.host_port}"
}
```

---

## 🚀 How to Run

1. **🧱 Initialize Terraform**  
     Run the following command to initialize the project:  
     ```bash
     terraform init
     ```

2. **📦 Plan the Infrastructure**  
     Generate and review the execution plan:  
     ```bash
     terraform plan
     ```

3. **🚀 Apply the Plan**  
     Deploy the infrastructure:  
     ```bash
     terraform apply
     ```

---

## 📎 Notes

- Ensure Docker is running locally before starting.
- Avoid port conflicts by using an available host port.
- Environment variables are pre-configured for AppDynamics demo purposes.

---

## 📸 Screenshots

### Terraform Initialization
![Terraform Init](<Screenshot 2025-04-10 194159.png>)

### Terraform Plan
![Terraform Plan](<Screenshot 2025-04-10 194229.png>)

### Terraform Apply
![Terraform Apply](<Screenshot 2025-04-10 194425.png>)  
![Terraform Apply Success](<Screenshot 2025-04-10 194441.png>)

