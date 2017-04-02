aws_iam_password_change() {
    local new-password="$1"
    local old-password="$2"
    shift 2

    cond_log_and_run aws iam  --new-password $new_password --old-password $old_password "@"

}
