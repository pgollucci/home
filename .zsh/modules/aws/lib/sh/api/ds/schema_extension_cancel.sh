aws_ds_schema_extension_cancel() {
    local directory_id="$1"
    local schema_extension_id="$2"
    shift 2

    cond_log_and_run aws ds cancel-schema-extension --directory-id $directory_id --schema-extension-id $schema_extension_id "$@"
}
