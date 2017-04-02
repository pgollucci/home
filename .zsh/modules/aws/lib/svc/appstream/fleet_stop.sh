aws_appstream_fleet_stop() {
    local name="$1"
    shift 1

    cond_log_and_run aws appstream  --name $name "@"

}
