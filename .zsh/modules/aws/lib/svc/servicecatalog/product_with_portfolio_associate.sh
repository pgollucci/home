aws_servicecatalog_product_with_portfolio_associate() {
    local product-id="$1"
    local portfolio-id="$2"
    shift 2

    cond_log_and_run aws servicecatalog  --product-id $product_id --portfolio-id $portfolio_id "@"

}
