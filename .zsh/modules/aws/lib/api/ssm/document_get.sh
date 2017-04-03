aws_ssm_document_get() {
    local name="$1"
    shift 1

    log_and_run aws ssm get-document --name $name "$@"
}
