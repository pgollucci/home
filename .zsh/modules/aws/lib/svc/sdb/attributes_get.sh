aws_sdb_attributes_get() {
    local item-name="$1"
    local domain-name="$2"
    shift 2

    log_and_run aws sdb  --item-name $item_name --domain-name $domain_name "@"

}
