aws_emr_instance_groups_add() {
    local cluster-id="$1"
    local instance-groups="$2"
    shift 2

    cond_log_and_run aws emr  --cluster-id $cluster_id --instance-groups $instance_groups "@"

}
