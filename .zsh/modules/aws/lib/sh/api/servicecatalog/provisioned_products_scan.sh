aws_servicecatalog_provisioned_products_scan() {

    cond_log_and_run aws servicecatalog scan-provisioned-products "$@"
}
