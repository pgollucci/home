aws_waf-regional_byte_match_set_create() {
    local name="$1"
    local change-token="$2"
    shift 2

    cond_log_and_run aws waf-regional  --name $name --change-token $change_token "@"

}
