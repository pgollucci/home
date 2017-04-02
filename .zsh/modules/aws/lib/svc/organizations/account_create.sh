aws_organizations_account_create() {
    local email="$1"
    local account-name="$2"
    shift 2

    cond_log_and_run aws organizations  --email $email --account-name $account_name "@"

}
