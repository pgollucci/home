aws_servicecatalog_constraints_for_portfolio_list() {
    local portfolio-id="$1"
    shift 1

    log_and_run aws servicecatalog  --portfolio-id $portfolio_id "@"

}
