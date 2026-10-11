variable "os_management_hub_managed_instance_remove_snaps_managements" {
  description = <<EOT
Map of os_management_hub_managed_instance_remove_snaps_managements, attributes below
Required:
    - managed_instance_id
    - snap_details (block):
        - name (required)
        - revision (optional)
Optional:
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - work_request_details (block):
        - description (optional)
        - display_name (optional)
EOT

  type = map(object({
    managed_instance_id = string
    snap_details = list(object({
      name     = string
      revision = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    work_request_details = optional(object({
      description  = optional(string)
      display_name = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.os_management_hub_managed_instance_remove_snaps_managements : (
        length(v.snap_details) >= 1
      )
    ])
    error_message = "Each snap_details list must contain at least 1 items"
  }
}

