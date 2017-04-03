aws_servicecatalog_portfolio_share_reject() {
    local portfolio_id="$1"
    shift 1

    cond_log_and_run aws servicecatalog reject-portfolio-share --portfolio-id $portfolio_id "$@"
}
