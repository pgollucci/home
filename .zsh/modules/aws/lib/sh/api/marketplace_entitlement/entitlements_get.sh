aws_marketplace_entitlement_entitlements_get() {
    local product_code="$1"
    shift 1

    log_and_run aws marketplace-entitlement get-entitlements --product-code $product_code "$@"
}
