aws_opsworks_elastic_ip_register() {
    local stack-id="$1"
    local elastic-ip="$2"
    shift 2

    cond_log_and_run aws opsworks  --stack-id $stack_id --elastic-ip $elastic_ip "@"

}
