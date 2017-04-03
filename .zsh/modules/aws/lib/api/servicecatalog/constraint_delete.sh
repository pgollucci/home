aws_servicecatalog_constraint_delete() {
    local id="$1"
    shift 1

    cond_log_and_run aws servicecatalog delete-constraint --id $id "$@"
}
