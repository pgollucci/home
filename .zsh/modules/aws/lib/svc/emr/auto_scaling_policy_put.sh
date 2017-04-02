aws_emr_auto_scaling_policy_put() {
    local cluster-id="$1"
    local auto-scaling-policy="$2"
    local instance-group-id="$3"
    shift 3

    cond_log_and_run aws emr  --cluster-id $cluster_id --auto-scaling-policy $auto_scaling_policy --instance-group-id $instance_group_id "@"

}
