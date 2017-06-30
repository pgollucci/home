aws_servicecatalog_provisioned_product_describe() {
    local id="$1"
    shift 1

    log_and_run aws servicecatalog describe-provisioned-product --id $id "$@"
}
