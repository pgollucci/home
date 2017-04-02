aws_emr_from_hbase_backup_restore() {
    local cluster-id="$1"
    local dir="$2"
    shift 2

    cond_log_and_run aws emr  --cluster-id $cluster_id --dir $dir "@"

}
