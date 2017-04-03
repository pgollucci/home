aws_sms_servers_get() {
    shift 0

    log_and_run aws sms get-servers "$@"
}
