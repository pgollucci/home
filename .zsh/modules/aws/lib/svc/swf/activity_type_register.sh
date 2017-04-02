aws_swf_activity_type_register() {
    local name="$1"
    local activity-version="$2"
    local domain="$3"
    shift 3

    cond_log_and_run aws swf  --name $name --activity-version $activity_version --domain $domain "@"

}
