aws_opsworks_hostname_suggestion_get() {
    local layer-id="$1"
    shift 1

    log_and_run aws opsworks  --layer-id $layer_id "@"

}
