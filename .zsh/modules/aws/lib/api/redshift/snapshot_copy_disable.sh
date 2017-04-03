aws_redshift_snapshot_copy_disable() {
    local cluster_identifier="$1"
    shift 1

    cond_log_and_run aws redshift disable-snapshot-copy --cluster-identifier $cluster_identifier "$@"
}
