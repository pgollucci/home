aws_importexport_shipping_label_get() {
    local job_ids="$1"
    shift 1

    log_and_run aws importexport get-shipping-label --job-ids $job_ids "$@"
}
