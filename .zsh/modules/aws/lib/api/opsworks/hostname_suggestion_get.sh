aws_opsworks_hostname_suggestion_get() {
    local layer_id="$1"
    shift 1

    log_and_run aws opsworks get-hostname-suggestion --layer-id $layer_id "$@"
}
