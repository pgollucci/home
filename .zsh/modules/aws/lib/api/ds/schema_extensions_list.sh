aws_ds_schema_extensions_list() {
    local directory_id="$1"
    shift 1

    log_and_run aws ds list-schema-extensions --directory-id $directory_id "$@"
}
