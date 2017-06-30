aws_dax_tags_list() {
    local resource_name="$1"
    shift 1

    log_and_run aws dax list-tags --resource-name $resource_name "$@"
}
