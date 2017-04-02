aws_ds_conditional_forwarder_create() {
    local dns-ip-addrs="$1"
    local directory-id="$2"
    local remote-domain-name="$3"
    shift 3

    cond_log_and_run aws ds  --dns-ip-addrs $dns_ip_addrs --directory-id $directory_id --remote-domain-name $remote_domain_name "@"

}
