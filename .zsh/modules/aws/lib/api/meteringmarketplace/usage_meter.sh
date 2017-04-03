aws_meteringmarketplace_usage_meter() {
    local product_code="$1"
    local timestamp="$2"
    local usage_dimension="$3"
    local usage_quantity="$4"
    local dry_run="$5"
    shift 5

    cond_log_and_run aws meteringmarketplace meter-usage --product-code $product_code --timestamp $timestamp --usage-dimension $usage_dimension --usage-quantity $usage_quantity --dry-run $dry_run "$@"
}
