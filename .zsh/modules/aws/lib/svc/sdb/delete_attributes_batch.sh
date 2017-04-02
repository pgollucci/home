aws_sdb_delete_attributes_batch() {
    local domain-name="$1"
    local items="$2"
    shift 2

    cond_log_and_run aws sdb  --domain-name $domain_name --items $items "@"

}
