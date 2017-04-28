aws_sms_server_catalog_import() {

    cond_log_and_run aws sms import-server-catalog "$@"
}
