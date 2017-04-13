aws_iot_ca_certificates_list() {

    log_and_run aws iot list-ca-certificates "$@"
}
