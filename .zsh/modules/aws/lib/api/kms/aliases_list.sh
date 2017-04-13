aws_kms_aliases_list() {

    log_and_run aws kms list-aliases "$@"
}
