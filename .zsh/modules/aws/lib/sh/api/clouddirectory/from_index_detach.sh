aws_clouddirectory_from_index_detach() {
    local directory_arn="$1"
    local index_reference="$2"
    local target_reference="$3"
    shift 3

    cond_log_and_run aws clouddirectory detach-from-index --directory-arn $directory_arn --index-reference $index_reference --target-reference $target_reference "$@"
}
