aws_ds_alias_create() {
    local alias="$1"
    local directory-id="$2"
    shift 2

    cond_log_and_run aws ds  --alias $alias --directory-id $directory_id "@"

}
