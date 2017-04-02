aws_clouddirectory_to_index_attach() {
    local directory-arn="$1"
    local index-reference="$2"
    local target-reference="$3"
    shift 3

    cond_log_and_run aws clouddirectory  --directory-arn $directory_arn --index-reference $index_reference --target-reference $target_reference "@"

}
