aws_sdb_put_attributes_batch() {
    local domain_name="$1"
    local items="$2"
    shift 2

    cond_log_and_run aws sdb batch-put-attributes --domain-name $domain_name --items $items "$@"
}
