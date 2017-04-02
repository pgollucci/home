aws_servicecatalog_product_delete() {
    local id="$1"
    shift 1

    cond_log_and_run aws servicecatalog  --id $id "@"

}
