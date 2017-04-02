aws_servicecatalog_provisioning_artifact_create() {
    local product-id="$1"
    local idempotency-token="$2"
    local parameters="$3"
    shift 3

    cond_log_and_run aws servicecatalog  --product-id $product_id --idempotency-token $idempotency_token --parameters $parameters "@"

}
