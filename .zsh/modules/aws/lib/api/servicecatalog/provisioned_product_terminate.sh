aws_servicecatalog_provisioned_product_terminate() {
    local terminate_token="$1"
    shift 1

    cond_log_and_run aws servicecatalog terminate-provisioned-product --terminate-token $terminate_token "$@"
}
