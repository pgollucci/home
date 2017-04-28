aws_servicecatalog_portfolio_update() {
    local id="$1"
    shift 1

    cond_log_and_run aws servicecatalog update-portfolio --id $id "$@"
}
