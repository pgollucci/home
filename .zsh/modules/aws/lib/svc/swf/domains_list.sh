aws_swf_domains_list() {
    local registration-status="$1"
    shift 1

    log_and_run aws swf  --registration-status $registration_status "@"

}
