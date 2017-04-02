aws_ecr_repository_policy_set() {
    local repository-name="$1"
    local policy-text="$2"
    shift 2

    cond_log_and_run aws ecr  --repository-name $repository_name --policy-text $policy_text "@"

}
