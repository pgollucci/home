aws_acm_tags_for_certificate_list() {
    local certificate-arn="$1"
    shift 1

    log_and_run aws acm  --certificate-arn $certificate_arn "@"

}
