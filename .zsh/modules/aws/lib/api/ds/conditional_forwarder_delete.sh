aws_ds_conditional_forwarder_delete() {
    local directory_id="$1"
    local remote_domain_name="$2"
    shift 2

    cond_log_and_run aws ds delete-conditional-forwarder --directory-id $directory_id --remote-domain-name $remote_domain_name "$@"
}
