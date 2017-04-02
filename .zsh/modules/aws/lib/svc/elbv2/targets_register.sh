aws_elbv2_targets_register() {
    local targets="$1"
    local target-group-arn="$2"
    shift 2

    log_and_run aws elbv2  --targets $targets --target-group-arn $target_group_arn "@"

}
