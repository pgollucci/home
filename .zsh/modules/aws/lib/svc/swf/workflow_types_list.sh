aws_swf_workflow_types_list() {
    local registration-status="$1"
    local domain="$2"
    shift 2

    log_and_run aws swf  --registration-status $registration_status --domain $domain "@"

}
