aws_clouddirectory_policy_lookup() {
    local object-reference="$1"
    local directory-arn="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --object-reference $object_reference --directory-arn $directory_arn "@"

}
