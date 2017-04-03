aws_acm_certificate_describe() {
    local certificate_arn="$1"
    shift 1

    log_and_run aws acm describe-certificate --certificate-arn $certificate_arn "$@"
}
