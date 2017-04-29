aws_resourcegroupstaggingapi_resources_get() {
    local tags_per_page="$1"
    shift 1

    log_and_run aws resourcegroupstaggingapi get-resources --tags-per-page $tags_per_page "$@"
}
