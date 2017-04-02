aws_servicecatalog_product_provision() {
    local provisioning-artifact-id="$1"
    local provisioned-product-name="$2"
    local provision-token="$3"
    local product-id="$4"
    shift 4

    cond_log_and_run aws servicecatalog  --provisioning-artifact-id $provisioning_artifact_id --provisioned-product-name $provisioned_product_name --provision-token $provision_token --product-id $product_id "@"

}
