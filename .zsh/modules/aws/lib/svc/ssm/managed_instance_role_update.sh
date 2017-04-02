aws_ssm_managed_instance_role_update() {
    local iam-role="$1"
    local instance-id="$2"
    shift 2

    cond_log_and_run aws ssm  --iam-role $iam_role --instance-id $instance_id "@"

}
