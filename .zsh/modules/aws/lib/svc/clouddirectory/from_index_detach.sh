aws_clouddirectory_from_index_detach() {
    local index-reference="$1"
    local target-reference="$2"
    local directory-arn="$3"
    shift 3

    cond_log_and_run aws clouddirectory  --index-reference $index_reference --target-reference $target_reference --directory-arn $directory_arn "@"

}
