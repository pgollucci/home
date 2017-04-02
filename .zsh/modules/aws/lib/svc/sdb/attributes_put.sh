aws_sdb_attributes_put() {
    local domain-name="$1"
    local item-name="$2"
    local attributes="$3"
    shift 3

    cond_log_and_run aws sdb  --domain-name $domain_name --item-name $item_name --attributes $attributes "@"

}
