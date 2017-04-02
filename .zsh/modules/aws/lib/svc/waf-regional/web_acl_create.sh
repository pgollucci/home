aws_waf-regional_web_acl_create() {
    local name="$1"
    local default-action="$2"
    local change-token="$3"
    local metric-name="$4"
    shift 4

    cond_log_and_run aws waf-regional  --name $name --default-action $default_action --change-token $change_token --metric-name $metric_name "@"

}
