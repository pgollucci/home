aws_organizations_organizational_unit_update() {
    local organizational_unit_id="$1"
    shift 1

    cond_log_and_run aws organizations update-organizational-unit --organizational-unit-id $organizational_unit_id "$@"
}
