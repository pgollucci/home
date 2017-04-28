aws_servicecatalog_constraint_update() {
    local id="$1"
    shift 1

    cond_log_and_run aws servicecatalog update-constraint --id $id "$@"
}
