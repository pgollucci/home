aws_emr_hbase_backup_create() {
    local cluster_id="$1"
    local dir="$2"
    shift 2

    cond_log_and_run aws emr create-hbase-backup --cluster-id $cluster_id --dir $dir "$@"
}
