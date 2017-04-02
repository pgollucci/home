aws_redshift_snapshot_access_authorize() {
    local account-with-restore-access="$1"
    local snapshot-identifier="$2"
    shift 2

    cond_log_and_run aws redshift  --account-with-restore-access $account_with_restore_access --snapshot-identifier $snapshot_identifier "@"

}
