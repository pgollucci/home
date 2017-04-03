aws_swf_activity_types_list() {
    local domain="$1"
    local registration_status="$2"
    shift 2

    log_and_run aws swf list-activity-types --domain $domain --registration-status $registration_status "$@"
}
