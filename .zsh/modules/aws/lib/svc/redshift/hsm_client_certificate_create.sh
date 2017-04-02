aws_redshift_hsm_client_certificate_create() {
    local hsm-client-certificate-identifier="$1"
    shift 1

    cond_log_and_run aws redshift  --hsm-client-certificate-identifier $hsm_client_certificate_identifier "@"

}
