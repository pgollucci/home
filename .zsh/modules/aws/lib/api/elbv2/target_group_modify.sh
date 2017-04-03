aws_elbv2_target_group_modify() {
    local target_group_arn="$1"
    shift 1

    log_and_run aws elbv2 modify-target-group --target-group-arn $target_group_arn "$@"
}
