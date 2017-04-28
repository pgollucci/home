aws_ssm_activation_create() {
    local iam_role="$1"
    shift 1

    cond_log_and_run aws ssm create-activation --iam-role $iam_role "$@"
}
