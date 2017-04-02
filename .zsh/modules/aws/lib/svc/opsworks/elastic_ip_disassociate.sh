aws_opsworks_elastic_ip_disassociate() {
    local elastic-ip="$1"
    shift 1

    cond_log_and_run aws opsworks  --elastic-ip $elastic_ip "@"

}
