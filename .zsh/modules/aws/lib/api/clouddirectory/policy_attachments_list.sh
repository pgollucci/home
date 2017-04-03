aws_clouddirectory_policy_attachments_list() {
    local directory_arn="$1"
    local policy_reference="$2"
    shift 2

    log_and_run aws clouddirectory list-policy-attachments --directory-arn $directory_arn --policy-reference $policy_reference "$@"
}
