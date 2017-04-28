aws_elbv2_tags_add() {
    local resource_arns="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws elbv2 add-tags --resource-arns $resource_arns --tags $tags "$@"
}
