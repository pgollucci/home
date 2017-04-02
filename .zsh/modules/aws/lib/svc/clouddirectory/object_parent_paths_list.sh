aws_clouddirectory_object_parent_paths_list() {
    local object-reference="$1"
    local directory-arn="$2"
    shift 2

    log_and_run aws clouddirectory  --object-reference $object_reference --directory-arn $directory_arn "@"

}
