aws_emr_auto_scaling_policy_remove() {
    local cluster_id="$1"
    local instance_group_id="$2"
    shift 2

    cond_log_and_run aws emr remove-auto-scaling-policy --cluster-id $cluster_id --instance-group-id $instance_group_id "$@"
}
