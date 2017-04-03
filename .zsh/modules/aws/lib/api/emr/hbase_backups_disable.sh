aws_emr_hbase_backups_disable() {
    local cluster_id="$1"
    shift 1

    cond_log_and_run aws emr disable-hbase-backups --cluster-id $cluster_id "$@"
}
