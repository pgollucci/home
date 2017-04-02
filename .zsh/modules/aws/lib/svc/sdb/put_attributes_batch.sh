aws_sdb_put_attributes_batch() {
    local items="$1"
    local domain-name="$2"
    shift 2

    cond_log_and_run aws sdb  --items $items --domain-name $domain_name "@"

}
