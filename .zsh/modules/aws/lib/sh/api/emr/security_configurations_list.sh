aws_emr_security_configurations_list() {

    log_and_run aws emr list-security-configurations "$@"
}
