aws_servicecatalog_provisioning_parameters_describe() {
    local provisioning-artifact-id="$1"
    local product-id="$2"
    shift 2

    log_and_run aws servicecatalog  --provisioning-artifact-id $provisioning_artifact_id --product-id $product_id "@"

}
