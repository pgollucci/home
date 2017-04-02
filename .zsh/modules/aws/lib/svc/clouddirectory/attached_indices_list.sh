aws_clouddirectory_attached_indices_list() {
    local target-reference="$1"
    local directory-arn="$2"
    shift 2

    log_and_run aws clouddirectory  --target-reference $target_reference --directory-arn $directory_arn "@"

}
