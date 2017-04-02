aws_ds_schema_extension_cancel() {
    local schema-extension-id="$1"
    local directory-id="$2"
    shift 2

    cond_log_and_run aws ds  --schema-extension-id $schema_extension_id --directory-id $directory_id "@"

}
