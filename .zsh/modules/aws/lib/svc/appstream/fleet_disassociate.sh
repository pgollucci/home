aws_appstream_fleet_disassociate() {
    local stack-name="$1"
    local fleet-name="$2"
    shift 2

    cond_log_and_run aws appstream  --stack-name $stack_name --fleet-name $fleet_name "@"

}
