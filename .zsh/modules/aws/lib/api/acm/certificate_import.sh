aws_acm_certificate_import() {
    local certificate="$1"
    local private_key="$2"
    shift 2

    cond_log_and_run aws acm import-certificate --certificate $certificate --private-key $private_key "$@"
}
