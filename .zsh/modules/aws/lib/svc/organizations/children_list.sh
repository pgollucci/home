aws_organizations_children_list() {
    local child-type="$1"
    local parent-id="$2"
    shift 2

    log_and_run aws organizations  --child-type $child_type --parent-id $parent_id "@"

}
