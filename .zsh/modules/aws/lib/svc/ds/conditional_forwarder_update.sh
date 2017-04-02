aws_ds_conditional_forwarder_update() {
    local remote-domain-name="$1"
    local dns-ip-addrs="$2"
    local directory-id="$3"
    shift 3

    cond_log_and_run aws ds  --remote-domain-name $remote_domain_name --dns-ip-addrs $dns_ip_addrs --directory-id $directory_id "@"

}
