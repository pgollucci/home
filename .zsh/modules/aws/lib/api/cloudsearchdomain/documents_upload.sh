aws_cloudsearchdomain_documents_upload() {
    local documents="$1"
    local content_type="$2"
    shift 2

    cond_log_and_run aws cloudsearchdomain upload-documents --documents $documents --content-type $content_type "$@"
}
