aws_ds_trust_create() {
    local directory_id="$1"
    local remote_domain_name="$2"
    local trust_password="$3"
    local trust_direction="$4"
    shift 4

    cond_log_and_run aws ds create-trust --directory-id $directory_id --remote-domain-name $remote_domain_name --trust-password $trust_password --trust-direction $trust_direction "$@"
}
