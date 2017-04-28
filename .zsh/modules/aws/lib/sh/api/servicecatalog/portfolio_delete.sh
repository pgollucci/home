aws_servicecatalog_portfolio_delete() {
    local id="$1"
    shift 1

    cond_log_and_run aws servicecatalog delete-portfolio --id $id "$@"
}
