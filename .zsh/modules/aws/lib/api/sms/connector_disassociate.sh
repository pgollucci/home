aws_sms_connector_disassociate() {
    local connector_id="$1"
    shift 1

    cond_log_and_run aws sms disassociate-connector --connector-id $connector_id "$@"
}
