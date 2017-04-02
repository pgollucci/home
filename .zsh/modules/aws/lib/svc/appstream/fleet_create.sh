aws_appstream_fleet_create() {
    local compute-capacity="$1"
    local image-name="$2"
    local name="$3"
    local instance-type="$4"
    shift 4

    cond_log_and_run aws appstream  --compute-capacity $compute_capacity --image-name $image_name --name $name --instance-type $instance_type "@"

}
