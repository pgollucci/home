aws_clouddirectory_object_delete() {
    local directory-arn="$1"
    local object-reference="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --directory-arn $directory_arn --object-reference $object_reference "@"

}
