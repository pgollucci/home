aws_opsworks_my_user_profile_describe() {
    shift 0

    log_and_run aws opsworks describe-my-user-profile "$@"
}
