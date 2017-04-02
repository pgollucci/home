aws_servicecatalog_portfolio_create() {
    local display-name="$1"
    local provider-name="$2"
    local idempotency-token="$3"
    shift 3

    cond_log_and_run aws servicecatalog  --display-name $display_name --provider-name $provider_name --idempotency-token $idempotency_token "@"

}
