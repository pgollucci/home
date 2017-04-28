aws_servicecatalog_portfolios_for_product_list() {
    local product_id="$1"
    shift 1

    log_and_run aws servicecatalog list-portfolios-for-product --product-id $product_id "$@"
}
