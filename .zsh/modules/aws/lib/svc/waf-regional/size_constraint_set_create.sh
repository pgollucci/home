aws_waf-regional_size_constraint_set_create() {
    local change-token="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws waf-regional  --change-token $change_token --name $name "@"

}
