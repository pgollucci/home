aws_greengrass_group_certificate_configuration_update() {
    local group_id="$1"
    shift 1

    cond_log_and_run aws greengrass update-group-certificate-configuration --group-id $group_id "$@"
}
