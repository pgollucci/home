aws_servicecatalog_provisioning_artifact_describe() {
    local provisioning_artifact_id="$1"
    local product_id="$2"
    shift 2

    log_and_run aws servicecatalog describe-provisioning-artifact --provisioning-artifact-id $provisioning_artifact_id --product-id $product_id "$@"
}
