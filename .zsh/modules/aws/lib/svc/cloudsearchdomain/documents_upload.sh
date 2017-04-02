aws_cloudsearchdomain_documents_upload() {
    local content-type="$1"
    local documents="$2"
    shift 2

    cond_log_and_run aws cloudsearchdomain  --content-type $content_type --documents $documents "@"

}
