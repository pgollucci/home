aws_opsworks_permission_set() {
    local stack_id="$1"
    local iam_user_arn="$2"
    shift 2

    cond_log_and_run aws opsworks set-permission --stack-id $stack_id --iam-user-arn $iam_user_arn "$@"
}
