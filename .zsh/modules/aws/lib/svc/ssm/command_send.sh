aws_ssm_command_send() {
    local document-name="$1"
    shift 1

    cond_log_and_run aws ssm  --document-name $document_name "@"

}
