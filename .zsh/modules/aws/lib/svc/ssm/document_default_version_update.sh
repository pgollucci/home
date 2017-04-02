aws_ssm_document_default_version_update() {
    local name="$1"
    local document-version="$2"
    shift 2

    cond_log_and_run aws ssm  --name $name --document-version $document_version "@"

}
