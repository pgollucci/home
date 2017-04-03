aws_appstream_associated_stacks_list() {
    local fleet_name="$1"
    shift 1

    log_and_run aws appstream list-associated-stacks --fleet-name $fleet_name "$@"
}
