aws_servicecatalog_principal_from_portfolio_disassociate() {
    local portfolio-id="$1"
    local principal-arn="$2"
    shift 2

    cond_log_and_run aws servicecatalog  --portfolio-id $portfolio_id --principal-arn $principal_arn "@"

}
