aws_sdb_domain_create() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws sdb create-domain --domain-name $domain_name "$@"
}
