aws_clouddirectory_to_index_attach() {
    local directory_arn="$1"
    local index_reference="$2"
    local target_reference="$3"
    shift 3

    cond_log_and_run aws clouddirectory attach-to-index --directory-arn $directory_arn --index-reference $index_reference --target-reference $target_reference "$@"
}
