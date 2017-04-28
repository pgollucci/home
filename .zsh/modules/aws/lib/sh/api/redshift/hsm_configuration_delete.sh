aws_redshift_hsm_configuration_delete() {
    local hsm_configuration_identifier="$1"
    shift 1

    cond_log_and_run aws redshift delete-hsm-configuration --hsm-configuration-identifier $hsm_configuration_identifier "$@"
}
