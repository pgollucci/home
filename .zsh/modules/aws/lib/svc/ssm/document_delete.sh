aws_ssm_document_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws ssm  --name $name "@"

}
