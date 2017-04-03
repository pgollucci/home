aws_appstream_fleet_create() {
    local name="$1"
    local image_name="$2"
    local instance_type="$3"
    local compute_capacity="$4"
    shift 4

    cond_log_and_run aws appstream create-fleet --name $name --image-name $image_name --instance-type $instance_type --compute-capacity $compute_capacity "$@"
}
