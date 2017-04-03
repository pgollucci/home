aws_clouddirectory_object_detach() {
    local directory_arn="$1"
    local parent_reference="$2"
    local link_name="$3"
    shift 3

    cond_log_and_run aws clouddirectory detach-object --directory-arn $directory_arn --parent-reference $parent_reference --link-name $link_name "$@"
}
