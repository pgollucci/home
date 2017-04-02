aws_kms_key_material_import() {
    local encrypted-key-material="$1"
    local import-token="$2"
    local key-id="$3"
    shift 3

    cond_log_and_run aws kms  --encrypted-key-material $encrypted_key_material --import-token $import_token --key-id $key_id "@"

}
