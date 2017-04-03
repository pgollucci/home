aws_iam_account_aliases_list() {
    shift 0

    log_and_run aws iam list-account-aliases "$@"
}
