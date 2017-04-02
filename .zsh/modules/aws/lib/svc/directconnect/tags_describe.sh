aws_directconnect_tags_describe() {
    local resource-arns="$1"
    shift 1

    log_and_run aws directconnect  --resource-arns $resource_arns "@"

}
