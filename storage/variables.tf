variable storage {
  description = "v2: storage"
  type = object({
    name        = string
    bucket_name = string
    redis_name  = string
  })
}