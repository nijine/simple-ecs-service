variable "service_name" {}

variable "security_groups" {}

variable "container_definitions" {
  description = "JSON string list of container definition maps"
}

variable "task_subnets" {
  description = "A list of subnet IDs in which the ECS service should run"
  type        = list(string)
}

variable "assign_public_ip" {
  default = false
}

variable "desired_count" {
  default = 0
}

variable "min_capacity" {
  default = 0
}

variable "max_capacity" {
  default = 2
}

variable "task_cpu" {
  default = 256
}

variable "task_memory" {
  default = 512
}

variable "container_port" {
  default = 8000
}

variable "enable_exec_cmd" {
  description = "Enable the ability to exec into a container"
  default     = false
}

variable "lb_target_group_arns" {
  default = []
}

variable "additional_task_policy_arns" {
  description = "A list of additional IAM policy ARNs to be attached to the ECS task role"
  type        = list(string)
  default     = []
}

variable "runtime_platform" {
  description = "OS and architecture options for the task containers"
  type        = list(map(string))
  default = [
    {
      operating_system_family = "LINUX"
      cpu_architecture        = "X86_64"
    }
  ]
}

variable "capacity_provider_strategy" {
  description = "Defines the capacity provider to use, i.e. FARGATE, FARGATE_SPOT, EC2, etc. Works in conjunction with the cluster configuration."
  type        = list(map(string))
  default = [
    {
      capacity_provider = "FARGATE_SPOT"
      weight            = 1
    }
  ]
}
