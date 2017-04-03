aws_ssm_document_update() {
    local content="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws ssm update-document --content $content --name $name "$@"
}
