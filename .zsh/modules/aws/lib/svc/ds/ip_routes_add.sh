aws_ds_ip_routes_add() {
    local ip-routes="$1"
    local directory-id="$2"
    shift 2

    cond_log_and_run aws ds  --ip-routes $ip_routes --directory-id $directory_id "@"

}
