aws_iam_account_alias_create() {
    local account_alias="$1"
    shift 1

    cond_log_and_run aws iam create-account-alias --account-alias $account_alias "$@"
}
