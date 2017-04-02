aws_ds_trust_create() {
    local remote-domain-name="$1"
    local trust-direction="$2"
    local trust-password="$3"
    local directory-id="$4"
    shift 4

    cond_log_and_run aws ds  --remote-domain-name $remote_domain_name --trust-direction $trust_direction --trust-password $trust_password --directory-id $directory_id "@"

}
