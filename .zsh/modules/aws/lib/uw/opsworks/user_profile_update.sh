aws_opsworks_self_management() {
        local iam_user_arn="$1"
        shift 1

    cond_log_and_run aws opsworks update-user-profile --iam-user-arn $iam_user_arn --allow-self-management "$@"
}

