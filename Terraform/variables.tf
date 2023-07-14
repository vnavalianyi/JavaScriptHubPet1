variable vpc_cidr {
    type        = string
}

variable sub_cidr {
    type        = string
}

variable avail_zone {
    type        = string
}

variable env_prefix {
    type        = string
}

variable my_ip {
    type        = string
    sensitive   = true
}

variable instance_type {
    type        = string
}

variable key_name {
    type        = string
    sensitive   = true
}

variable ansible_ssh_key {
    type        = string
    sensitive   = true
}

variable image_name {
    type        = string
}

variable ami_owner {
    type        = string
}

variable region {
    type        = string
}