aws_servicecatalog_portfolio_access_list() {
    local portfolio-id="$1"
    shift 1

    log_and_run aws servicecatalog  --portfolio-id $portfolio_id "@"

}
