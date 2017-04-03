aws_servicecatalog_product_as_admin_describe() {
    local id="$1"
    shift 1

    log_and_run aws servicecatalog describe-product-as-admin --id $id "$@"
}
