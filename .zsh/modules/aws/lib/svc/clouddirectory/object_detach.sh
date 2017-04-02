aws_clouddirectory_object_detach() {
    local directory-arn="$1"
    local parent-reference="$2"
    local link-name="$3"
    shift 3

    cond_log_and_run aws clouddirectory  --directory-arn $directory_arn --parent-reference $parent_reference --link-name $link_name "@"

}
