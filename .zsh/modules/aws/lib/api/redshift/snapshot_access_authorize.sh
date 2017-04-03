aws_redshift_snapshot_access_authorize() {
    local snapshot_identifier="$1"
    local account_with_restore_access="$2"
    shift 2

    cond_log_and_run aws redshift authorize-snapshot-access --snapshot-identifier $snapshot_identifier --account-with-restore-access $account_with_restore_access "$@"
}
