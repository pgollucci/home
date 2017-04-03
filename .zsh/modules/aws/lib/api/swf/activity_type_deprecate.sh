aws_swf_activity_type_deprecate() {
    local domain="$1"
    local activity_type="$2"
    shift 2

    cond_log_and_run aws swf deprecate-activity-type --domain $domain --activity-type $activity_type "$@"
}
