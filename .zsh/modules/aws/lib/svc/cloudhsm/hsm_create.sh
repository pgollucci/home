aws_cloudhsm_hsm_create() {
    local subscription-type="$1"
    local subnet-id="$2"
    local ssh-key="$3"
    local iam-role-arn="$4"
    shift 4

    cond_log_and_run aws cloudhsm  --subscription-type $subscription_type --subnet-id $subnet_id --ssh-key $ssh_key --iam-role-arn $iam_role_arn "@"

}
