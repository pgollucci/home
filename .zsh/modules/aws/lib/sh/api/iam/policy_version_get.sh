aws_iam_policy_version_get() {
    local policy_arn="$1"
    local version_id="$2"
    shift 2

    log_and_run aws iam get-policy-version --policy-arn $policy_arn --version-id $version_id "$@"
}
