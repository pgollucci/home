aws_redshift_reserved_nodes_describe() {
    shift 0

    log_and_run aws redshift describe-reserved-nodes "$@"
}
