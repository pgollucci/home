aws_lightsail_instances_from_snapshot_create() {
    local instance-snapshot-name="$1"
    local bundle-id="$2"
    local availability-zone="$3"
    local instance-names="$4"
    shift 4

    cond_log_and_run aws lightsail  --instance-snapshot-name $instance_snapshot_name --bundle-id $bundle_id --availability-zone $availability_zone --instance-names $instance_names "@"

}
