aws_servicecatalog_launch_paths_list() {
    local product-id="$1"
    shift 1

    log_and_run aws servicecatalog  --product-id $product_id "@"

}
