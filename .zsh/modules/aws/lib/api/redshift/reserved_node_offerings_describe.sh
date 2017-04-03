aws_redshift_reserved_node_offerings_describe() {
    shift 0

    log_and_run aws redshift describe-reserved-node-offerings "$@"
}
