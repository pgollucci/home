aws_kms_parameters_for_import_get() {
    local key_id="$1"
    local wrapping_algorithm="$2"
    local wrapping_key_spec="$3"
    shift 3

    log_and_run aws kms get-parameters-for-import --key-id $key_id --wrapping-algorithm $wrapping_algorithm --wrapping-key-spec $wrapping_key_spec "$@"
}
