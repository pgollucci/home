aws_elbv2_target_group_delete() {
    local target-group-arn="$1"
    shift 1

    log_and_run aws elbv2  --target-group-arn $target_group_arn "@"

}
