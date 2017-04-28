aws_iam_users_list() {

    log_and_run aws iam list-users "$@"
}
