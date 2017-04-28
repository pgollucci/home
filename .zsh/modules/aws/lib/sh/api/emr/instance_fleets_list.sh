aws_emr_instance_fleets_list() {
    local cluster_id="$1"
    shift 1

    log_and_run aws emr list-instance-fleets --cluster-id $cluster_id "$@"
}
