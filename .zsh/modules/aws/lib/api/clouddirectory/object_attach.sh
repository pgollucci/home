aws_clouddirectory_object_attach() {
    local directory_arn="$1"
    local parent_reference="$2"
    local child_reference="$3"
    local link_name="$4"
    shift 4

    cond_log_and_run aws clouddirectory attach-object --directory-arn $directory_arn --parent-reference $parent_reference --child-reference $child_reference --link-name $link_name "$@"
}
