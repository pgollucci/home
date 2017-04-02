aws_kms_imported_key_material_delete() {
    local key-id="$1"
    shift 1

    cond_log_and_run aws kms  --key-id $key_id "@"

}
