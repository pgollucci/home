aws_acm_tags_from_certificate_remove() {
    local certificate_arn="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws acm remove-tags-from-certificate --certificate-arn $certificate_arn --tags $tags "$@"
}
