aws_ssm_inventory_entries_list() {
    local type-name="$1"
    local instance-id="$2"
    shift 2

    log_and_run aws ssm  --type-name $type_name --instance-id $instance_id "@"

}
