aws_ds_schema_extension_start() {
    local ldif-content="$1"
    local description="$2"
    local create-snapshot-before-schema-extension="$3"
    local directory-id="$4"
    shift 4

    cond_log_and_run aws ds  --ldif-content $ldif_content --description $description --create-snapshot-before-schema-extension $create_snapshot_before_schema_extension --directory-id $directory_id "@"

}
