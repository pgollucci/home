aws_organizations_policies_list() {
    local filter="$1"
    shift 1

    log_and_run aws organizations  --filter $filter "@"

}
