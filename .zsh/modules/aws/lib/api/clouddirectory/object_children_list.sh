aws_clouddirectory_object_children_list() {
    local directory_arn="$1"
    local object_reference="$2"
    shift 2

    log_and_run aws clouddirectory list-object-children --directory-arn $directory_arn --object-reference $object_reference "$@"
}
