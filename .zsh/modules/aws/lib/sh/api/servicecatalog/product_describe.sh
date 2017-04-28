aws_servicecatalog_product_describe() {
    local id="$1"
    shift 1

    log_and_run aws servicecatalog describe-product --id $id "$@"
}
