aws_organizations_organizational_unit_delete() {
    local organizational_unit_id="$1"
    shift 1

    cond_log_and_run aws organizations delete-organizational-unit --organizational-unit-id $organizational_unit_id "$@"
}
