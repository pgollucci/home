aws_opsworks_user_profile_create() {
    local iam_user_arn="$1"
    shift 1

    cond_log_and_run aws opsworks create-user-profile --iam-user-arn $iam_user_arn "$@"
}
