aws_iam_account_alias_create() {
    local account-alias="$1"
    shift 1

    cond_log_and_run aws iam  --account-alias $account_alias "@"

}
