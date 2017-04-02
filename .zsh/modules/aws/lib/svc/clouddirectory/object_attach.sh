aws_clouddirectory_object_attach() {
    local link-name="$1"
    local child-reference="$2"
    local parent-reference="$3"
    local directory-arn="$4"
    shift 4

    cond_log_and_run aws clouddirectory  --link-name $link_name --child-reference $child_reference --parent-reference $parent_reference --directory-arn $directory_arn "@"

}
