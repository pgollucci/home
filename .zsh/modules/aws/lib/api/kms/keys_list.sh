aws_kms_keys_list() {
    shift 0

    log_and_run aws kms list-keys "$@"
}
