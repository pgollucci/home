aws_opsworks_permission_set() {
    local iam-user-arn="$1"
    local stack-id="$2"
    shift 2

    cond_log_and_run aws opsworks  --iam-user-arn $iam_user_arn --stack-id $stack_id "@"

}
