aws_servicecatalog_provisioning_artifact_delete() {
    local product-id="$1"
    local provisioning-artifact-id="$2"
    shift 2

    cond_log_and_run aws servicecatalog  --product-id $product_id --provisioning-artifact-id $provisioning_artifact_id "@"

}
