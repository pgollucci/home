aws_servicecatalog_provisioning_artifact_update() {
    local product_id="$1"
    local provisioning_artifact_id="$2"
    shift 2

    cond_log_and_run aws servicecatalog update-provisioning-artifact --product-id $product_id --provisioning-artifact-id $provisioning_artifact_id "$@"
}
