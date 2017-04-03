aws_servicecatalog_portfolio_create() {
    local display_name="$1"
    local provider_name="$2"
    local idempotency_token="$3"
    shift 3

    cond_log_and_run aws servicecatalog create-portfolio --display-name $display_name --provider-name $provider_name --idempotency-token $idempotency_token "$@"
}
