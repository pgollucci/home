aws_sdb_attributes_get() {
    local domain_name="$1"
    local item_name="$2"
    shift 2

    log_and_run aws sdb get-attributes --domain-name $domain_name --item-name $item_name "$@"
}
