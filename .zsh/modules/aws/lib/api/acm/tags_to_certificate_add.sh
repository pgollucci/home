aws_acm_tags_to_certificate_add() {
    local certificate_arn="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws acm add-tags-to-certificate --certificate-arn $certificate_arn --tags $tags "$@"
}
