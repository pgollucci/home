aws_lightsail_instances_create() {
    local availability-zone="$1"
    local instance-names="$2"
    local bundle-id="$3"
    local blueprint-id="$4"
    shift 4

    cond_log_and_run aws lightsail  --availability-zone $availability_zone --instance-names $instance_names --bundle-id $bundle_id --blueprint-id $blueprint_id "@"

}
