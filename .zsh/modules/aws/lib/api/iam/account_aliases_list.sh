aws_iam_account_aliases_list() {

    log_and_run aws iam list-account-aliases "$@"
}
