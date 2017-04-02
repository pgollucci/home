aws_ds_ip_routes_list() {
    local directory-id="$1"
    shift 1

    log_and_run aws ds  --directory-id $directory_id "@"

}
