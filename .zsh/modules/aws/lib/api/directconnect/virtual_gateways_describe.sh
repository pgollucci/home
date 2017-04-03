aws_directconnect_virtual_gateways_describe() {
    shift 0

    log_and_run aws directconnect describe-virtual-gateways "$@"
}
