aws_servicecatalog_product_create() {
    local idempotency-token="$1"
    local provisioning-artifact-parameters="$2"
    local name="$3"
    local owner="$4"
    local product-type="$5"
    shift 5

    cond_log_and_run aws servicecatalog  --idempotency-token $idempotency_token --provisioning-artifact-parameters $provisioning_artifact_parameters --name $name --owner $owner --product-type $product_type "@"

}
