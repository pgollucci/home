aws_kms_resource_tags_list() {
    local key_id="$1"
    shift 1

    log_and_run aws kms list-resource-tags --key-id $key_id "$@"
}
