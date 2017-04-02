aws_appstream_associated_stacks_list() {
    local fleet-name="$1"
    shift 1

    log_and_run aws appstream  --fleet-name $fleet_name "@"

}
