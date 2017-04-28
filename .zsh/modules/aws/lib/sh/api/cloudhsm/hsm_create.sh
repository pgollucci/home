aws_cloudhsm_hsm_create() {
    local subnet_id="$1"
    local ssh_key="$2"
    local iam_role_arn="$3"
    local subscription_type="$4"
    shift 4

    cond_log_and_run aws cloudhsm create-hsm --subnet-id $subnet_id --ssh-key $ssh_key --iam-role-arn $iam_role_arn --subscription-type $subscription_type "$@"
}
