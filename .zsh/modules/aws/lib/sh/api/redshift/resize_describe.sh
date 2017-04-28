aws_redshift_resize_describe() {
    local cluster_identifier="$1"
    shift 1

    log_and_run aws redshift describe-resize --cluster-identifier $cluster_identifier "$@"
}
