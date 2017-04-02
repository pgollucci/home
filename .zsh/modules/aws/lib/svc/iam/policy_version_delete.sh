aws_iam_policy_version_delete() {
    local version-id="$1"
    local policy-arn="$2"
    shift 2

    cond_log_and_run aws iam  --version-id $version_id --policy-arn $policy_arn "@"

}
