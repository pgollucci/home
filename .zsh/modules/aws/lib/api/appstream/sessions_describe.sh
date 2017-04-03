aws_appstream_sessions_describe() {
    local stack_name="$1"
    local fleet_name="$2"
    shift 2

    log_and_run aws appstream describe-sessions --stack-name $stack_name --fleet-name $fleet_name "$@"
}
