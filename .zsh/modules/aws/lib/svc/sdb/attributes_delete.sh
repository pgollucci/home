aws_sdb_attributes_delete() {
    local domain-name="$1"
    local item-name="$2"
    shift 2

    cond_log_and_run aws sdb  --domain-name $domain_name --item-name $item_name "@"

}
