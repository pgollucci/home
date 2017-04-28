aws_ssm_association_batch_create() {
    local entries="$1"
    shift 1

    cond_log_and_run aws ssm create-association-batch --entries $entries "$@"
}
