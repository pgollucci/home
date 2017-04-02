aws_kms_parameters_for_import_get() {
    local key-id="$1"
    local wrapping-key-spec="$2"
    local wrapping-algorithm="$3"
    shift 3

    log_and_run aws kms  --key-id $key_id --wrapping-key-spec $wrapping_key_spec --wrapping-algorithm $wrapping_algorithm "@"

}
