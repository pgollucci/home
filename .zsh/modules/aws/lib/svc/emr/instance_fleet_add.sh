aws_emr_instance_fleet_add() {
    local instance-fleet="$1"
    local cluster-id="$2"
    shift 2

    cond_log_and_run aws emr  --instance-fleet $instance_fleet --cluster-id $cluster_id "@"

}
