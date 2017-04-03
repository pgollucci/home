aws_directconnect_virtual_interfaces_describe() {
    shift 0

    log_and_run aws directconnect describe-virtual-interfaces "$@"
}
