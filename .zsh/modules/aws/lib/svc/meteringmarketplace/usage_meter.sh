aws_meteringmarketplace_usage_meter() {
    local usage-quantity="$1"
    local dry-run="$2"
    local usage-dimension="$3"
    local timestamp="$4"
    local product-code="$5"
    shift 5

    cond_log_and_run aws meteringmarketplace  --usage-quantity $usage_quantity --dry-run $dry_run --usage-dimension $usage_dimension --timestamp $timestamp --product-code $product_code "@"

}
