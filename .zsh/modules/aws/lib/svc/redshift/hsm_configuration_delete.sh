aws_redshift_hsm_configuration_delete() {
    local hsm-configuration-identifier="$1"
    shift 1

    cond_log_and_run aws redshift  --hsm-configuration-identifier $hsm_configuration_identifier "@"

}
