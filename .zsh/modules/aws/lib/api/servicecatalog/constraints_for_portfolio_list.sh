aws_servicecatalog_constraints_for_portfolio_list() {
    local portfolio_id="$1"
    shift 1

    log_and_run aws servicecatalog list-constraints-for-portfolio --portfolio-id $portfolio_id "$@"
}
