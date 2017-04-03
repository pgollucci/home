aws_servicecatalog_constraint_create() {
    local portfolio_id="$1"
    local product_id="$2"
    local parameters="$3"
    local type="$4"
    local idempotency_token="$5"
    shift 5

    cond_log_and_run aws servicecatalog create-constraint --portfolio-id $portfolio_id --product-id $product_id --parameters $parameters --type $type --idempotency-token $idempotency_token "$@"
}
