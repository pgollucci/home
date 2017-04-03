aws_appstream_fleet_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws appstream delete-fleet --name $name "$@"
}
