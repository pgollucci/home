aws_redshift_hsm_client_certificate_delete() {
    local hsm_client_certificate_identifier="$1"
    shift 1

    cond_log_and_run aws redshift delete-hsm-client-certificate --hsm-client-certificate-identifier $hsm_client_certificate_identifier "$@"
}
