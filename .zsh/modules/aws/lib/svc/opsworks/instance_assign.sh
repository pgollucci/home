aws_opsworks_instance_assign() {
    local layer-ids="$1"
    local instance-id="$2"
    shift 2

    cond_log_and_run aws opsworks  --layer-ids $layer_ids --instance-id $instance_id "@"

}
