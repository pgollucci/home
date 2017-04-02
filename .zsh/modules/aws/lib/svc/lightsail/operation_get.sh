aws_lightsail_operation_get() {
    local operation-id="$1"
    shift 1

    log_and_run aws lightsail  --operation-id $operation_id "@"

}
