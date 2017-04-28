aws_servicecatalog_launch_paths_list() {
    local product_id="$1"
    shift 1

    log_and_run aws servicecatalog list-launch-paths --product-id $product_id "$@"
}
