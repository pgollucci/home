aws_organizations_organizational_units_for_parent_list() {
    local parent_id="$1"
    shift 1

    log_and_run aws organizations list-organizational-units-for-parent --parent-id $parent_id "$@"
}
