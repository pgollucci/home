aws_servicecatalog_provisioned_product_update() {
    local update_token="$1"
    shift 1

    cond_log_and_run aws servicecatalog update-provisioned-product --update-token $update_token "$@"
}
