aws_servicecatalog_principal_with_portfolio_associate() {
    local portfolio_id="$1"
    local principal_arn="$2"
    local principal_type="$3"
    shift 3

    cond_log_and_run aws servicecatalog associate-principal-with-portfolio --portfolio-id $portfolio_id --principal-arn $principal_arn --principal-type $principal_type "$@"
}
