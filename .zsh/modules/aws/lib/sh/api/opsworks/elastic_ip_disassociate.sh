aws_opsworks_elastic_ip_disassociate() {
    local elastic_ip="$1"
    shift 1

    cond_log_and_run aws opsworks disassociate-elastic-ip --elastic-ip $elastic_ip "$@"
}
