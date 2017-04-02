aws_clouddirectory_index_list() {
    local index-reference="$1"
    local directory-arn="$2"
    shift 2

    log_and_run aws clouddirectory  --index-reference $index_reference --directory-arn $directory_arn "@"

}
