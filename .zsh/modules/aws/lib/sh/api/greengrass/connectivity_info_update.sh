aws_greengrass_connectivity_info_update() {
    local thing_name="$1"
    shift 1

    cond_log_and_run aws greengrass update-connectivity-info --thing-name $thing_name "$@"
}
