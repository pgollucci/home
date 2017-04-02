aws_acm_tags_from_certificate_remove() {
    local tags="$1"
    local certificate-arn="$2"
    shift 2

    cond_log_and_run aws acm  --tags $tags --certificate-arn $certificate_arn "@"

}
