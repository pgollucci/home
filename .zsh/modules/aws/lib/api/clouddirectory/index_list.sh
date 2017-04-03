aws_clouddirectory_index_list() {
    local directory_arn="$1"
    local index_reference="$2"
    shift 2

    log_and_run aws clouddirectory list-index --directory-arn $directory_arn --index-reference $index_reference "$@"
}
