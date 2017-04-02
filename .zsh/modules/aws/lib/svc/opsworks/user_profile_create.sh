aws_opsworks_user_profile_create() {
    local iam-user-arn="$1"
    shift 1

    cond_log_and_run aws opsworks  --iam-user-arn $iam_user_arn "@"

}
