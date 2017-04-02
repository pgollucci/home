aws_clouddirectory_policy_attach() {
    local policy-reference="$1"
    local object-reference="$2"
    shift 2

    cond_log_and_run aws clouddirectory  --policy-reference $policy_reference --object-reference $object_reference "@"

}
