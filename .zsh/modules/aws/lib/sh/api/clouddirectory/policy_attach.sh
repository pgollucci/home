aws_clouddirectory_policy_attach() {
    local policy_reference="$1"
    local object_reference="$2"
    shift 2

    cond_log_and_run aws clouddirectory attach-policy --policy-reference $policy_reference --object-reference $object_reference "$@"
}
