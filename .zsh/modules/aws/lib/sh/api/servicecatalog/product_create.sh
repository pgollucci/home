aws_servicecatalog_product_create() {
    local name="$1"
    local owner="$2"
    local product_type="$3"
    local provisioning_artifact_parameters="$4"
    local idempotency_token="$5"
    shift 5

    cond_log_and_run aws servicecatalog create-product --name $name --owner $owner --product-type $product_type --provisioning-artifact-parameters $provisioning_artifact_parameters --idempotency-token $idempotency_token "$@"
}
