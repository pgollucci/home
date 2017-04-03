aws_servicecatalog_portfolios_list() {
    shift 0

    log_and_run aws servicecatalog list-portfolios "$@"
}
