aws_greengrass_group_certificate_configuration_get() {
    local group_id="$1"
    shift 1

    log_and_run aws greengrass get-group-certificate-configuration --group-id $group_id "$@"
}
