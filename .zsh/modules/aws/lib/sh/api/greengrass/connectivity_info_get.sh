aws_greengrass_connectivity_info_get() {
    local thing_name="$1"
    shift 1

    log_and_run aws greengrass get-connectivity-info --thing-name $thing_name "$@"
}
