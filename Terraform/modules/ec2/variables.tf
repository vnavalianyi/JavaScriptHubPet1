variable vpc_id {
    type        = string
}

variable my_ip {
    type        = string
}

variable env_prefix {
    type        = string
}

variable image_name {
    type        = string
}

variable ami_owner {
    type        = string
}

variable key_name {
    type        = string
}

variable ansible_ssh_key {
    type        = string
    sensitive   = true
}

variable instance_type {
    type        = string
}

variable subnet_id {
    type        = string
}

variable avail_zone {
    type        = string
}