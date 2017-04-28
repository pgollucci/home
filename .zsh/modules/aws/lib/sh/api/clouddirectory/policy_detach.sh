aws_clouddirectory_policy_detach() {
    local directory_arn="$1"
    local policy_reference="$2"
    local object_reference="$3"
    shift 3

    cond_log_and_run aws clouddirectory detach-policy --directory-arn $directory_arn --policy-reference $policy_reference --object-reference $object_reference "$@"
}
