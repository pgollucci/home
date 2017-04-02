aws_servicecatalog_constraint_create() {
    local product-id="$1"
    local idempotency-token="$2"
    local parameters="$3"
    local portfolio-id="$4"
    local type="$5"
    shift 5

    cond_log_and_run aws servicecatalog  --product-id $product_id --idempotency-token $idempotency_token --parameters $parameters --portfolio-id $portfolio_id --type $type "@"

}
