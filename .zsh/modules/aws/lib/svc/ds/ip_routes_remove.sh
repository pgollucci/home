aws_ds_ip_routes_remove() {
    local cidr-ips="$1"
    local directory-id="$2"
    shift 2

    cond_log_and_run aws ds  --cidr-ips $cidr_ips --directory-id $directory_id "@"

}
