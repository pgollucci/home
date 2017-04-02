aws_servicecatalog_portfolio_share_delete() {
    local portfolio-id="$1"
    local account-id="$2"
    shift 2

    cond_log_and_run aws servicecatalog  --portfolio-id $portfolio_id --account-id $account_id "@"

}
