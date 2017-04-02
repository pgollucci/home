aws_kms_grant_retire() {
    shift 0

    cond_log_and_run aws kms  "@"

}
