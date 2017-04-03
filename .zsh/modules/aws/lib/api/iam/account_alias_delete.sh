aws_iam_account_alias_delete() {
    local account_alias="$1"
    shift 1

    cond_log_and_run aws iam delete-account-alias --account-alias $account_alias "$@"
}
