aws_servicecatalog_product_provision() {
    local product_id="$1"
    local provisioning_artifact_id="$2"
    local provisioned_product_name="$3"
    local provision_token="$4"
    shift 4

    cond_log_and_run aws servicecatalog provision-product --product-id $product_id --provisioning-artifact-id $provisioning_artifact_id --provisioned-product-name $provisioned_product_name --provision-token $provision_token "$@"
}
