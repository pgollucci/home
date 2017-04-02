aws_iam_default_policy_version_set() {
    local policy-arn="$1"
    local version-id="$2"
    shift 2

    cond_log_and_run aws iam  --policy-arn $policy_arn --version-id $version_id "@"

}
