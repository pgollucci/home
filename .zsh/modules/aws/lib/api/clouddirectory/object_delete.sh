aws_clouddirectory_object_delete() {
    local directory_arn="$1"
    local object_reference="$2"
    shift 2

    cond_log_and_run aws clouddirectory delete-object --directory-arn $directory_arn --object-reference $object_reference "$@"
}
