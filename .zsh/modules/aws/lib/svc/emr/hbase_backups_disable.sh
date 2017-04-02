aws_emr_hbase_backups_disable() {
    local cluster-id="$1"
    shift 1

    cond_log_and_run aws emr  --cluster-id $cluster_id "@"

}
