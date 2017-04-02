aws_elbv2_tags_add() {
    local tags="$1"
    local resource-arns="$2"
    shift 2

    cond_log_and_run aws elbv2  --tags $tags --resource-arns $resource_arns "@"

}
