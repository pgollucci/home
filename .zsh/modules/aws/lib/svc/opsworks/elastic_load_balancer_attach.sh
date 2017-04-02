aws_opsworks_elastic_load_balancer_attach() {
    local layer-id="$1"
    local elastic-load-balancer-name="$2"
    shift 2

    cond_log_and_run aws opsworks  --layer-id $layer_id --elastic-load-balancer-name $elastic_load_balancer_name "@"

}
