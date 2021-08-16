resource "digitalocean_spaces_bucket" "buckets" {
  for_each      = { for b in var.spaces_buckets : try(b.name, "${b.name_prefix}-${var.name}-${random_string.suffix.result}") => b }
  name          = each.key
  region        = each.value.region
  acl           = try(each.value.acl, "private")
  force_destroy = try(each.value.force_detroy, false)
}

