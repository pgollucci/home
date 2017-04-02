aws_shield_protection_create() {
    local name="$1"
    local resource-arn="$2"
    shift 2

    cond_log_and_run aws shield  --name $name --resource-arn $resource_arn "@"

}
