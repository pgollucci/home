aws_ds_alias_create() {
    local directory_id="$1"
    local alias="$2"
    shift 2

    cond_log_and_run aws ds create-alias --directory-id $directory_id --alias $alias "$@"
}
