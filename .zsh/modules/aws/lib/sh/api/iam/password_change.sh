aws_iam_password_change() {
    local old_password="$1"
    local new_password="$2"
    shift 2

    cond_log_and_run aws iam change-password --old-password $old_password --new-password $new_password "$@"
}
