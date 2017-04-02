aws_organizations_policy_create() {
    local name="$1"
    local description="$2"
    local type="$3"
    local content="$4"
    shift 4

    cond_log_and_run aws organizations  --name $name --description $description --type $type --content $content "@"

}
