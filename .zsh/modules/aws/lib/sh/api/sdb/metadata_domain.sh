aws_sdb_metadata_domain() {
    local domain_name="$1"
    shift 1

    cond_log_and_run aws sdb domain-metadata --domain-name $domain_name "$@"
}
