aws_glacier_vaults_list() {
    local account_id="$1"
    shift 1

    log_and_run aws glacier list-vaults --account-id $account_id "$@"
}
