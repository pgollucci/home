aws_ds_trusts_describe() {
    shift 0

    log_and_run aws ds describe-trusts "$@"
}
