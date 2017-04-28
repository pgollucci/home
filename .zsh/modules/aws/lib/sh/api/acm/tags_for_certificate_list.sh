aws_acm_tags_for_certificate_list() {
    local certificate_arn="$1"
    shift 1

    log_and_run aws acm list-tags-for-certificate --certificate-arn $certificate_arn "$@"
}
