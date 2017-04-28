aws_elbv2_target_health_describe() {
    local target_group_arn="$1"
    shift 1

    log_and_run aws elbv2 describe-target-health --target-group-arn $target_group_arn "$@"
}
