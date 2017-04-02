aws_sms_server_catalog_import() {
    shift 0

    cond_log_and_run aws sms  "@"

}
