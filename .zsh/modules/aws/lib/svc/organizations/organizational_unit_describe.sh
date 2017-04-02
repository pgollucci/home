aws_organizations_organizational_unit_describe() {
    local organizational-unit-id="$1"
    shift 1

    log_and_run aws organizations  --organizational-unit-id $organizational_unit_id "@"

}
