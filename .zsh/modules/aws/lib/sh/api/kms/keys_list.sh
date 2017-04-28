aws_kms_keys_list() {

    log_and_run aws kms list-keys "$@"
}
