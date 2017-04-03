aws_opsworks_user_profiles_describe() {
    shift 0

    log_and_run aws opsworks describe-user-profiles "$@"
}
