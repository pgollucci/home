aws_ssm_document_versions_list() {
    local name="$1"
    shift 1

    log_and_run aws ssm  --name $name "@"

}
