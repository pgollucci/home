aws_ssm_command_send() {
    local document_name="$1"
    shift 1

    cond_log_and_run aws ssm send-command --document-name $document_name "$@"
}
