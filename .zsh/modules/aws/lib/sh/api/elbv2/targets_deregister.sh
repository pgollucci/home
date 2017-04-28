aws_elbv2_targets_deregister() {
    local target_group_arn="$1"
    local targets="$2"
    shift 2

    log_and_run aws elbv2 deregister-targets --target-group-arn $target_group_arn --targets $targets "$@"
}
