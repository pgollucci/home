aws_opsworks_elastic_ip_associate() {
    local elastic_ip="$1"
    shift 1

    cond_log_and_run aws opsworks associate-elastic-ip --elastic-ip $elastic_ip "$@"
}
