aws_organizations_organizational_unit_create() {
    local name="$1"
    local parent-id="$2"
    shift 2

    cond_log_and_run aws organizations  --name $name --parent-id $parent_id "@"

}
