aws_sdb_metadata_domain() {
    local domain-name="$1"
    shift 1

    cond_log_and_run aws sdb  --domain-name $domain_name "@"

}
