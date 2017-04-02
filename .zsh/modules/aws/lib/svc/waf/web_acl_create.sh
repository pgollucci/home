aws_waf_web_acl_create() {
    local name="$1"
    local change-token="$2"
    local default-action="$3"
    local metric-name="$4"
    shift 4

    cond_log_and_run aws waf  --name $name --change-token $change_token --default-action $default_action --metric-name $metric_name "@"

}
