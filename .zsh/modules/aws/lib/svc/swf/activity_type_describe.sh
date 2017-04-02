aws_swf_activity_type_describe() {
    local activity-type="$1"
    local domain="$2"
    shift 2

    log_and_run aws swf  --activity-type $activity_type --domain $domain "@"

}
