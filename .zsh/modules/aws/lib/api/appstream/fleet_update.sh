aws_appstream_fleet_update() {
    local name="$1"
    shift 1

    cond_log_and_run aws appstream update-fleet --name $name "$@"
}
