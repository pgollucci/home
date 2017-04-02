aws_importexport_shipping_label_get() {
    local job-ids="$1"
    shift 1

    log_and_run aws importexport  --job-ids $job_ids "@"

}
