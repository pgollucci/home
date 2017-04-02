aws_organizations_organizational_unit_delete() {
    local organizational-unit-id="$1"
    shift 1

    cond_log_and_run aws organizations  --organizational-unit-id $organizational_unit_id "@"

}
