aws_sms_server_catalog_delete() {

    cond_log_and_run aws sms delete-server-catalog "$@"
}
