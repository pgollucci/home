aws_servicecatalog_principal_from_portfolio_disassociate() {
    local portfolio_id="$1"
    local principal_arn="$2"
    shift 2

    cond_log_and_run aws servicecatalog disassociate-principal-from-portfolio --portfolio-id $portfolio_id --principal-arn $principal_arn "$@"
}
