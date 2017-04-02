aws_ssm_inventory_put() {
    local instance-id="$1"
    local items="$2"
    shift 2

    cond_log_and_run aws ssm  --instance-id $instance_id --items $items "@"

}
