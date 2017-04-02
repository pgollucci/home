aws_servicecatalog_provisioned_products_scan() {
    shift 0

    cond_log_and_run aws servicecatalog  "@"

}
