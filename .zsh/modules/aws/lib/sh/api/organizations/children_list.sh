aws_organizations_children_list() {
    local parent_id="$1"
    local child_type="$2"
    shift 2

    log_and_run aws organizations list-children --parent-id $parent_id --child-type $child_type "$@"
}
