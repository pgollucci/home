aws_directconnect_tags_describe() {
    local resource_arns="$1"
    shift 1

    log_and_run aws directconnect describe-tags --resource-arns $resource_arns "$@"
}
