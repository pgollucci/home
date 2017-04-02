aws_sms_connector_disassociate() {
    local connector-id="$1"
    shift 1

    cond_log_and_run aws sms  --connector-id $connector_id "@"

}
