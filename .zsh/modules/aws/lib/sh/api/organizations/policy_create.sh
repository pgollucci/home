aws_organizations_policy_create() {
    local content="$1"
    local description="$2"
    local name="$3"
    local type="$4"
    shift 4

    cond_log_and_run aws organizations create-policy --content $content --description $description --name $name --type $type "$@"
}
