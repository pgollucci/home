aws_organizations_organizational_unit_update() {
    local organizational-unit-id="$1"
    shift 1

    cond_log_and_run aws organizations  --organizational-unit-id $organizational_unit_id "@"

}
