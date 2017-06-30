aws_servicecatalog_tag_option_from_resource_disassociate() {
    local resource_id="$1"
    local tag_option_id="$2"
    shift 2

    cond_log_and_run aws servicecatalog disassociate-tag-option-from-resource --resource-id $resource_id --tag-option-id $tag_option_id "$@"
}
