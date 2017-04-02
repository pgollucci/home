aws_clouddirectory_index_create() {
    local directory-arn="$1"
    local ordered-indexed-attribute-list="$2"
    local is-unique="$3"
    shift 3

    cond_log_and_run aws clouddirectory  --directory-arn $directory_arn --ordered-indexed-attribute-list $ordered_indexed_attribute_list --is-unique $is_unique "@"

}
