aws_ds_schema_extensions_list() {
    local directory-id="$1"
    shift 1

    log_and_run aws ds  --directory-id $directory_id "@"

}
