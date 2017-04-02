aws_servicecatalog_provisioned_product_terminate() {
    local terminate-token="$1"
    shift 1

    cond_log_and_run aws servicecatalog  --terminate-token $terminate_token "@"

}
