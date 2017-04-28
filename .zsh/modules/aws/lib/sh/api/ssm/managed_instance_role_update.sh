aws_ssm_managed_instance_role_update() {
    local instance_id="$1"
    local iam_role="$2"
    shift 2

    cond_log_and_run aws ssm update-managed-instance-role --instance-id $instance_id --iam-role $iam_role "$@"
}
