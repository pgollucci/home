aws_servicecatalog_provisioning_artifacts_list() {
    local product_id="$1"
    shift 1

    log_and_run aws servicecatalog list-provisioning-artifacts --product-id $product_id "$@"
}
