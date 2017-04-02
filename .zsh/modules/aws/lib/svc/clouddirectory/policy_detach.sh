aws_clouddirectory_policy_detach() {
    local directory-arn="$1"
    local object-reference="$2"
    local policy-reference="$3"
    shift 3

    cond_log_and_run aws clouddirectory  --directory-arn $directory_arn --object-reference $object_reference --policy-reference $policy_reference "@"

}
