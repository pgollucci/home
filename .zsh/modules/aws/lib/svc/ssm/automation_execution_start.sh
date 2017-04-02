aws_ssm_automation_execution_start() {
    local document-name="$1"
    shift 1

    cond_log_and_run aws ssm  --document-name $document_name "@"

}
