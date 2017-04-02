aws_clouddirectory_policy_attachments_list() {
    local policy-reference="$1"
    local directory-arn="$2"
    shift 2

    log_and_run aws clouddirectory  --policy-reference $policy_reference --directory-arn $directory_arn "@"

}
