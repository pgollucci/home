aws_ds_ip_routes_add() {
    local directory_id="$1"
    local ip_routes="$2"
    shift 2

    cond_log_and_run aws ds add-ip-routes --directory-id $directory_id --ip-routes $ip_routes "$@"
}
