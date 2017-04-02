aws_servicecatalog_principal_with_portfolio_associate() {
    local principal-type="$1"
    local portfolio-id="$2"
    local principal-arn="$3"
    shift 3

    cond_log_and_run aws servicecatalog  --principal-type $principal_type --portfolio-id $portfolio_id --principal-arn $principal_arn "@"

}
