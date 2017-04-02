aws_emr_hbase_backup_create() {
    local dir="$1"
    local cluster-id="$2"
    shift 2

    cond_log_and_run aws emr  --dir $dir --cluster-id $cluster_id "@"

}
