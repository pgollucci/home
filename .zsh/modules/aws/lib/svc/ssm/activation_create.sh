aws_ssm_activation_create() {
    local iam-role="$1"
    shift 1

    cond_log_and_run aws ssm  --iam-role $iam_role "@"

}
