aws_meteringmarketplace_meter_usage_batch() {
    local usage-records="$1"
    local product-code="$2"
    shift 2

    cond_log_and_run aws meteringmarketplace  --usage-records $usage_records --product-code $product_code "@"

}
