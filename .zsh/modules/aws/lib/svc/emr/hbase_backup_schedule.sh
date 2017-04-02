aws_emr_hbase_backup_schedule() {
    local interval="$1"
    local type="$2"
    local cluster-id="$3"
    local unit="$4"
    local dir="$5"
    shift 5

    cond_log_and_run aws emr  --interval $interval --type $type --cluster-id $cluster_id --unit $unit --dir $dir "@"

}
