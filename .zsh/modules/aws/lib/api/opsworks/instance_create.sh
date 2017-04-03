aws_opsworks_instance_create() {
    local stack_id="$1"
    local layer_ids="$2"
    local instance_type="$3"
    shift 3

    cond_log_and_run aws opsworks create-instance --stack-id $stack_id --layer-ids $layer_ids --instance-type $instance_type "$@"
}
