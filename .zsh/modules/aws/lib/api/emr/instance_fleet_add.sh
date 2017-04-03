aws_emr_instance_fleet_add() {
    local cluster_id="$1"
    local instance_fleet="$2"
    shift 2

    cond_log_and_run aws emr add-instance-fleet --cluster-id $cluster_id --instance-fleet $instance_fleet "$@"
}
