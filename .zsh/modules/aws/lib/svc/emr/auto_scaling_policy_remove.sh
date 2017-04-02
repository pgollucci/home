aws_emr_auto_scaling_policy_remove() {
    local cluster-id="$1"
    local instance-group-id="$2"
    shift 2

    cond_log_and_run aws emr  --cluster-id $cluster_id --instance-group-id $instance_group_id "@"

}
