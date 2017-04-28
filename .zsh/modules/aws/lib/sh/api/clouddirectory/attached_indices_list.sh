aws_clouddirectory_attached_indices_list() {
    local directory_arn="$1"
    local target_reference="$2"
    shift 2

    log_and_run aws clouddirectory list-attached-indices --directory-arn $directory_arn --target-reference $target_reference "$@"
}
