aws_organizations_parents_list() {
    local child-id="$1"
    shift 1

    log_and_run aws organizations  --child-id $child_id "@"

}
