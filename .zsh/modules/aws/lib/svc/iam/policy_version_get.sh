aws_iam_policy_version_get() {
    local policy-arn="$1"
    local version-id="$2"
    shift 2

    log_and_run aws iam  --policy-arn $policy_arn --version-id $version_id "@"

}
