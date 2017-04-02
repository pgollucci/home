aws_ds_conditional_forwarder_delete() {
    local remote-domain-name="$1"
    local directory-id="$2"
    shift 2

    cond_log_and_run aws ds  --remote-domain-name $remote_domain_name --directory-id $directory_id "@"

}
