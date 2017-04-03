aws_organizations_organizational_unit_create() {
    local parent_id="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws organizations create-organizational-unit --parent-id $parent_id --name $name "$@"
}
