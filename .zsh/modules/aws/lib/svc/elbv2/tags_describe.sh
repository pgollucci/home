aws_elbv2_tags_describe() {
    local resource-arns="$1"
    shift 1

    log_and_run aws elbv2  --resource-arns $resource_arns "@"

}
