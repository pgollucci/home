aws_sdb_attributes_put() {
    local domain_name="$1"
    local item_name="$2"
    local attributes="$3"
    shift 3

    cond_log_and_run aws sdb put-attributes --domain-name $domain_name --item-name $item_name --attributes $attributes "$@"
}
