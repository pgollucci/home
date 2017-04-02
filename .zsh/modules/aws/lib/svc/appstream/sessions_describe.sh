aws_appstream_sessions_describe() {
    local fleet-name="$1"
    local stack-name="$2"
    shift 2

    log_and_run aws appstream  --fleet-name $fleet_name --stack-name $stack_name "@"

}
