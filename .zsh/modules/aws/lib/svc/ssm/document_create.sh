aws_ssm_document_create() {
    local name="$1"
    local content="$2"
    shift 2

    cond_log_and_run aws ssm  --name $name --content $content "@"

}
