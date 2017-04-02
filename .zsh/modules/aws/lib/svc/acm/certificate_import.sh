aws_acm_certificate_import() {
    local certificate="$1"
    local private-key="$2"
    shift 2

    cond_log_and_run aws acm  --certificate $certificate --private-key $private_key "@"

}
