aws_opsworks_instance_create() {
    local layer-ids="$1"
    local stack-id="$2"
    local instance-type="$3"
    shift 3

    cond_log_and_run aws opsworks  --layer-ids $layer_ids --stack-id $stack_id --instance-type $instance_type "@"

}
