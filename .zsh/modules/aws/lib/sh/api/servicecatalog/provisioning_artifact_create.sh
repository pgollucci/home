aws_servicecatalog_provisioning_artifact_create() {
    local product_id="$1"
    local parameters="$2"
    local idempotency_token="$3"
    shift 3

    cond_log_and_run aws servicecatalog create-provisioning-artifact --product-id $product_id --parameters $parameters --idempotency-token $idempotency_token "$@"
}
