aws_servicecatalog_portfolio_share_accept() {
    local portfolio_id="$1"
    shift 1

    cond_log_and_run aws servicecatalog accept-portfolio-share --portfolio-id $portfolio_id "$@"
}
